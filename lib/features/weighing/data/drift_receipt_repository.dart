import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';
import '../domain/receipt.dart';
import '../domain/receipt_enums.dart';
import '../domain/receipt_line_draft.dart';
import '../domain/receipt_repository.dart';
import 'receipt_mapper.dart';

class DriftReceiptRepository implements ReceiptRepository {
  DriftReceiptRepository(
      this._db, {
        DateTime Function()? clock,
        String Function()? idGenerator,
      })  : _clock = clock ?? DateTime.now,
        _newId = idGenerator ?? const Uuid().v4;

  final AppDatabase _db;
  final DateTime Function() _clock;
  final String Function() _newId;

  JoinedSelectStatement<HasResultSet, dynamic> _receiptQuery(
      Expression<bool> where,
      ) {
    final receipts = _db.receipts;
    final lines = _db.receiptLines;
    return _db.select(receipts).join([
      leftOuterJoin(lines, lines.receiptId.equalsExp(receipts.id)),
    ])
      ..where(where)
      ..orderBy([OrderingTerm.asc(lines.lineNo)]);
  }

  Receipt? _toReceipt(List<TypedResult> rows) {
    if (rows.isEmpty) return null;
    final header = rows.first.readTable(_db.receipts);
    final lines = [
      for (final row in rows)
        if (row.readTableOrNull(_db.receiptLines) case final line?)
          line.toReceiptLine(),
    ];
    return header.toReceipt(lines);
  }

  @override
  Stream<Receipt?> watchById(String id) {
    return _receiptQuery(_db.receipts.id.equals(id)).watch().map(_toReceipt);
  }

  @override
  Future<Receipt?> findById(String id) async {
    final rows = await _receiptQuery(_db.receipts.id.equals(id)).get();
    return _toReceipt(rows);
  }

  @override
  Future<Receipt?> findOpenDraft(ReceiptType type) async {
    final row = await (_db.select(_db.receipts)
      ..where(
            (t) =>
        t.status.equalsValue(ReceiptStatus.draft) &
        t.type.equalsValue(type),
      )
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])
      ..limit(1))
        .getSingleOrNull();
    return row == null ? null : findById(row.id);
  }

  @override
  Future<Receipt> createDraft(ReceiptType type, {String? partyName}) {
    return _db.transaction(() async {
      final now = _clock();
      final id = _newId();
      final number = await _nextReceiptNumber();

      await _db.into(_db.receipts).insert(
        ReceiptsCompanion.insert(
          id: id,
          receiptNumber: number,
          type: type,
          status: ReceiptStatus.draft,
          createdAt: now,
          updatedAt: now,
          partyName: Value(_normalizeParty(partyName)),
        ),
      );

      return (await findById(id))!;
    });
  }

  @override
  Future<Receipt> setPartyName(String receiptId, String? partyName) {
    return _db.transaction(() async {
      await _requireDraft(receiptId);
      await (_db.update(_db.receipts)..where((t) => t.id.equals(receiptId)))
          .write(
        ReceiptsCompanion(
          partyName: Value(_normalizeParty(partyName)),
          updatedAt: Value(_clock()),
        ),
      );
      return (await findById(receiptId))!;
    });
  }

  @override
  Future<Receipt> addLine(String receiptId, ReceiptLineDraft draft) {
    return _db.transaction(() async {
      _ensureValid(draft);
      await _requireDraft(receiptId);
      final item = await _requireItem(draft.itemId);
      final now = _clock();
      final lineNo = await _nextLineNo(receiptId);

      await _db.into(_db.receiptLines).insert(
        ReceiptLinesCompanion.insert(
          id: _newId(),
          receiptId: receiptId,
          lineNo: lineNo,
          itemName: item.name,
          unit: item.unit,
          grossWeightMilli: draft.grossWeightMilli,
          netWeightMilli: draft.netWeightMilli,
          unitPrice: draft.unitPrice,
          amount: draft.amount,
          createdAt: now,
          updatedAt: now,
          itemId: Value(item.id),
          deductionMilli: Value(draft.deductionMilli),
          isManual: Value(draft.isManual),
        ),
      );

      return _refreshTotal(receiptId, now);
    });
  }

  @override
  Future<Receipt> updateLine(String lineId, ReceiptLineDraft draft) {
    return _db.transaction(() async {
      _ensureValid(draft);
      final line = await _requireLine(lineId);
      await _requireDraft(line.receiptId);
      final item = await _requireItem(draft.itemId);
      final now = _clock();

      await (_db.update(_db.receiptLines)..where((t) => t.id.equals(lineId)))
          .write(
        ReceiptLinesCompanion(
          itemId: Value(item.id),
          itemName: Value(item.name),
          unit: Value(item.unit),
          grossWeightMilli: Value(draft.grossWeightMilli),
          deductionMilli: Value(draft.deductionMilli),
          netWeightMilli: Value(draft.netWeightMilli),
          unitPrice: Value(draft.unitPrice),
          amount: Value(draft.amount),
          isManual: Value(draft.isManual),
          updatedAt: Value(now),
        ),
      );

      return _refreshTotal(line.receiptId, now);
    });
  }

  @override
  Future<Receipt> removeLine(String lineId) {
    return _db.transaction(() async {
      final line = await _requireLine(lineId);
      await _requireDraft(line.receiptId);

      await (_db.delete(_db.receiptLines)..where((t) => t.id.equals(lineId)))
          .go();

      return _refreshTotal(line.receiptId, _clock());
    });
  }

  @override
  Future<Receipt> complete(String receiptId) {
    return _db.transaction(() async {
      await _requireDraft(receiptId);

      final count = _db.receiptLines.id.count();
      final row = await (_db.selectOnly(_db.receiptLines)
        ..addColumns([count])
        ..where(_db.receiptLines.receiptId.equals(receiptId)))
          .getSingle();
      if ((row.read(count) ?? 0) == 0) {
        throw const ReceiptException(ReceiptFailure.emptyReceipt);
      }

      final now = _clock();
      await (_db.update(_db.receipts)..where((t) => t.id.equals(receiptId)))
          .write(
        ReceiptsCompanion(
          status: const Value(ReceiptStatus.completed),
          completedAt: Value(now),
          updatedAt: Value(now),
        ),
      );

      return (await findById(receiptId))!;
    });
  }

  @override
  Future<void> discard(String receiptId) {
    return _db.transaction(() async {
      await _requireDraft(receiptId);
      await (_db.delete(_db.receipts)..where((t) => t.id.equals(receiptId)))
          .go();
    });
  }

  Future<int> _nextReceiptNumber() async {
    final maxNumber = _db.receipts.receiptNumber.max();
    final row = await (_db.selectOnly(_db.receipts)..addColumns([maxNumber]))
        .getSingle();
    return (row.read(maxNumber) ?? 0) + 1;
  }

  Future<int> _nextLineNo(String receiptId) async {
    final maxNo = _db.receiptLines.lineNo.max();
    final row = await (_db.selectOnly(_db.receiptLines)
      ..addColumns([maxNo])
      ..where(_db.receiptLines.receiptId.equals(receiptId)))
        .getSingle();
    return (row.read(maxNo) ?? 0) + 1;
  }

  Future<Receipt> _refreshTotal(String receiptId, DateTime now) async {
    final sum = _db.receiptLines.amount.sum();
    final row = await (_db.selectOnly(_db.receiptLines)
      ..addColumns([sum])
      ..where(_db.receiptLines.receiptId.equals(receiptId)))
        .getSingle();

    await (_db.update(_db.receipts)..where((t) => t.id.equals(receiptId)))
        .write(
      ReceiptsCompanion(
        totalAmount: Value(row.read(sum) ?? 0),
        updatedAt: Value(now),
      ),
    );

    return (await findById(receiptId))!;
  }

  Future<ReceiptRow> _requireDraft(String receiptId) async {
    final row = await (_db.select(_db.receipts)
      ..where((t) => t.id.equals(receiptId)))
        .getSingleOrNull();
    if (row == null) throw const ReceiptException(ReceiptFailure.notFound);
    if (row.status != ReceiptStatus.draft) {
      throw const ReceiptException(ReceiptFailure.notDraft);
    }
    return row;
  }

  Future<ReceiptLineRow> _requireLine(String lineId) async {
    final row = await (_db.select(_db.receiptLines)
      ..where((t) => t.id.equals(lineId)))
        .getSingleOrNull();
    if (row == null) throw const ReceiptException(ReceiptFailure.lineNotFound);
    return row;
  }

  Future<ItemRow> _requireItem(String itemId) async {
    final row = await (_db.select(_db.items)
      ..where((t) => t.id.equals(itemId) & t.deletedAt.isNull()))
        .getSingleOrNull();
    if (row == null) throw const ReceiptException(ReceiptFailure.itemNotFound);
    return row;
  }

  void _ensureValid(ReceiptLineDraft draft) {
    final errors = draft.validate();
    if (errors.isNotEmpty) {
      throw ReceiptException(ReceiptFailure.invalid, errors);
    }
  }

  String? _normalizeParty(String? value) {
    final party = value?.trim();
    return party == null || party.isEmpty ? null : party;
  }
}