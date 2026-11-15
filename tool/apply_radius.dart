import 'dart:io';

void main() {
  final pattern = RegExp(r'BorderRadius\.circular\((\d+(?:\.\d+)?)\)');
  final changedFiles = <String>[];

  for (final entity in Directory('lib').listSync(recursive: true)) {
    if (entity is! File || !entity.path.endsWith('.dart')) continue;
    final path = entity.path.replaceAll('\\', '/');
    if (path.contains('/generated/') || path.contains('/core/theme/')) continue;

    var touched = false;
    var text = entity.readAsStringSync().replaceAllMapped(pattern, (match) {
      final value = double.parse(match.group(1)!);
      if (value > 16) return match.group(0)!;
      touched = true;
      return value <= 4 ? 'AppRadius.badge' : 'AppRadius.control';
    });
    if (!touched) continue;

    if (!text.contains('app_dimens.dart')) {
      final depth = path.split('/').length - 2;
      final prefix = depth == 0 ? '' : '${List.filled(depth, '..').join('/')}/';
      final importLine = "import '${prefix}core/theme/app_dimens.dart';";
      final lines = text.split('\n');
      final lastImport = lines.lastIndexWhere((l) => l.startsWith('import '));
      lines.insert(lastImport + 1, importLine);
      text = lines.join('\n');
    }

    entity.writeAsStringSync(text);
    changedFiles.add(path);
  }

  stdout.writeln('Changed ${changedFiles.length} files');
  for (final path in changedFiles) {
    stdout.writeln(path);
  }
}