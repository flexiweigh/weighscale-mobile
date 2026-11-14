class PeriodTotals {
  const PeriodTotals({
    required this.transactions,
    required this.weightKgMilli,
    required this.amount,
  });

  static const empty = PeriodTotals(
    transactions: 0,
    weightKgMilli: 0,
    amount: 0,
  );

  final int transactions;
  final int weightKgMilli;
  final int amount;
}