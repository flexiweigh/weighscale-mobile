import '../../items/domain/item_enums.dart';
import 'receipt_enums.dart';
import 'receipt_line.dart';
import 'weight_units.dart';

class Receipt {
  const Receipt({
    required this.id,
    required this.number,
    required this.type,
    required this.status,
    required this.totalAmount,
    required this.lines,
    required this.createdAt,
    required this.updatedAt,
    this.partyName,
    this.completedAt,
  });

  final String id;
  final int number;
  final ReceiptType type;
  final ReceiptStatus status;
  final String? partyName;
  final int totalAmount;
  final List<ReceiptLine> lines;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? completedAt;

  String get displayNumber => number.toString().padLeft(4, '0');

  int get lineCount => lines.length;

  bool get isDraft => status == ReceiptStatus.draft;

  bool get hasLines => lines.isNotEmpty;

  bool get hasParty => partyName != null && partyName!.trim().isNotEmpty;

  DateTime get displayTime => completedAt ?? createdAt;

  int get totalWeightKgMilli {
    var total = 0;
    for (final line in lines) {
      total += convertWeightMilli(
        line.netWeightMilli,
        line.unit,
        WeightUnit.kg,
      );
    }
    return total;
  }
}