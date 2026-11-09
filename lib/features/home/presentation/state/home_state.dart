import 'home_card_states.dart';

class HomeState {
  const HomeState({
    required this.scale,
    required this.today,
    required this.getStarted,
    required this.recent,
    this.connectionLost,
  });

  final ScaleCardState scale;
  final ConnectionLostState? connectionLost;
  final TodaySummaryState today;
  final GetStartedState getStarted;
  final RecentTransactionsState recent;

  bool get hasTransactions => !recent.isEmpty;

  HomeState copyWith({
    ScaleCardState? scale,
    ConnectionLostState? connectionLost,
    bool clearConnectionLost = false,
    TodaySummaryState? today,
    GetStartedState? getStarted,
    RecentTransactionsState? recent,
  }) {
    return HomeState(
      scale: scale ?? this.scale,
      connectionLost:
      clearConnectionLost ? null : (connectionLost ?? this.connectionLost),
      today: today ?? this.today,
      getStarted: getStarted ?? this.getStarted,
      recent: recent ?? this.recent,
    );
  }
}