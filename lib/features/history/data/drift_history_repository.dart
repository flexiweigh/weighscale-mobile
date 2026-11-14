import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../items/domain/item_enums.dart';
import '../../weighing/domain/receipt_enums.dart';
import '../../weighing/domain/weight_units.dart';
import '../domain/history_filter.dart';
import '../domain/history_repository.dart';
import '../domain/period_totals.dart';
import '../domain/receipt_summary.dart';
import 'history_mapper.dart';

class DriftHistoryRepository implements HistoryRepository {
  DriftHistoryRepository(this._db);

  static const _idChunkSize = 500;

  final AppDatabase _db;

  Expression<bool> _where(HistoryFilter filter) {
    final receipts = _db.receipts;
    final conditions = <Expression<bool>>[
      receipts.status.equalsValue(ReceiptStatus.completed),
    ];

    final type = filter.type;
    if (type != null) conditions.add(receipts.type.equalsValue(type));

    final from = filter.from;
    if (from != null) {
      conditions.add(receipts.completedAt.isBiggerOrEqualValue(from));
    }

    final to = filter.to;
    if (to != null) {
      conditions.add(receipts.completedAt.isSmallerThanValue(to));
    }

    final text = filter.query.trim();
    if (text.isNotEmpty) {
      final lineMatches = _db.selectOnly(_db.receiptLines, distinct: true)
        ..addColumns([_db.receiptLines.receiptId])
        ..where(_db.receiptLines.itemName.contains(text));
      conditions.add(
        receipts.partyName.contains(text) | receipts.id.isInQuery(lineMatches),
      );
    }

    return conditions.reduce((a, b) => a & b);
  }

  @override
  Stream<List<ReceiptSummary>> watch(HistoryFilter filter) {
    final select = _db.select(_db.receipts)
      ..where((_) => _where(filter))
      ..orderBy([
            (t) => OrderingTerm.desc(t.completedAt),
            (t) => OrderingTerm.desc(t.receiptNumber),
      ]);

    final limit = filter.limit;
    if (limit != null) select.limit(limit);

    return select.watch().asyncMap(_withLines);
  }

  Future<List<ReceiptSummary>> _withLines(List<ReceiptRow> rows) async {
    if (rows.isEmpty) return const [];

    final byReceipt = <String, List<ReceiptLineRow>>{};
    for (var i = 0; i < rows.length; i += _idChunkSize) {
      final ids = rows.skip(i).take(_idChunkSize).map((row) => row.id).toList();
      final lineRows = await (_db.select(_db.receiptLines)
        ..where((t) => t.receiptId.isIn(ids))
        ..orderBy([(t) => OrderingTerm.asc(t.lineNo)]))
          .get();
      for (final line in lineRows) {
        (byReceipt[line.receiptId] ??= []).add(line);
      }
    }

    return [
      for (final row in rows) row.toSummary(byReceipt[row.id] ?? const []),
    ];
  }

  @override
  Stream<PeriodTotals> watchTotals(HistoryFilter filter) {
    final receipts = _db.receipts;
    final count = receipts.id.count();
    final amount = receipts.totalAmount.sum();
    final query = _db.selectOnly(receipts)
      ..addColumns([count, amount])
      ..where(_where(filter));

    return query.watchSingle().asyncMap((row) async {
      return PeriodTotals(
        transactions: row.read(count) ?? 0,
        amount: row.read(amount) ?? 0,
        weightKgMilli: await _weightKgMilli(filter),
      );
    });
  }

  Future<int> _weightKgMilli(HistoryFilter filter) async {
    final receipts = _db.receipts;
    final lines = _db.receiptLines;
    final query = _db.select(lines).join([
      innerJoin(receipts, receipts.id.equalsExp(lines.receiptId)),
    ])
      ..where(_where(filter));

    final rows = await query.get();
    var total = 0;
    for (final row in rows) {
      final line = row.readTable(lines);
      total += convertWeightMilli(
        line.netWeightMilli,
        line.unit,
        WeightUnit.kg,
      );
    }
    return total;
  }
}