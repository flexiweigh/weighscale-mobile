import '../../weighing/domain/receipt_enums.dart';

class HistoryFilter {
  const HistoryFilter({
    this.type,
    this.query = '',
    this.from,
    this.to,
    this.limit,
  });

  final ReceiptType? type;
  final String query;
  final DateTime? from;
  final DateTime? to;
  final int? limit;

  HistoryFilter copyWith({
    ReceiptType? type,
    bool clearType = false,
    String? query,
    DateTime? from,
    DateTime? to,
    bool clearRange = false,
    int? limit,
  }) {
    return HistoryFilter(
      type: clearType ? null : (type ?? this.type),
      query: query ?? this.query,
      from: clearRange ? null : (from ?? this.from),
      to: clearRange ? null : (to ?? this.to),
      limit: limit ?? this.limit,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is HistoryFilter &&
          other.type == type &&
          other.query == query &&
          other.from == from &&
          other.to == to &&
          other.limit == limit;

  @override
  int get hashCode => Object.hash(type, query, from, to, limit);
}