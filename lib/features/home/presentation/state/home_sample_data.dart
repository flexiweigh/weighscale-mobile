import 'home_card_states.dart';
import 'home_state.dart';

class HomeSampleData {
  HomeSampleData._();

  static const _stepsPending = GetStartedState(
    steps: [
      GetStartedStep(id: GetStartedStepId.connectScale),
      GetStartedStep(id: GetStartedStepId.addItems),
      GetStartedStep(id: GetStartedStepId.firstWeighing),
    ],
  );

  static const _stepsDone = GetStartedState(
    steps: [
      GetStartedStep(id: GetStartedStepId.connectScale, done: true),
      GetStartedStep(id: GetStartedStepId.addItems, done: true),
      GetStartedStep(id: GetStartedStepId.firstWeighing, done: true),
    ],
  );

  static const _transactions = [
    TransactionItemState(
      id: '124',
      number: '0124',
      party: 'Ko Aung',
      item: 'Copper',
      time: '10:42 AM',
      weight: 85.5,
      amount: 428000,
      type: TransactionType.buy,
    ),
    TransactionItemState(
      id: '123',
      number: '0123',
      party: 'Shwe Metals',
      item: 'Aluminium',
      time: '10:15 AM',
      weight: 210.0,
      amount: 735000,
      type: TransactionType.sell,
    ),
    TransactionItemState(
      id: '122',
      number: '0122',
      party: 'Ma Hla',
      item: 'Iron scrap',
      time: '09:50 AM',
      weight: 64.2,
      amount: 96300,
      type: TransactionType.buy,
    ),
    TransactionItemState(
      id: '121',
      number: '0121',
      party: 'U Min',
      item: 'Plastic',
      time: '09:20 AM',
      weight: 42.8,
      amount: 51360,
      type: TransactionType.buy,
    ),
  ];

  static const _transactionsLost = [
    TransactionItemState(
      id: '124',
      number: '0124',
      party: 'Ko Aung',
      item: 'Copper',
      time: '10:42 AM',
      weight: 85.5,
      amount: 428000,
      type: TransactionType.buy,
    ),
    TransactionItemState(
      id: '123',
      number: '0123',
      party: 'Shwe Metals',
      item: 'Aluminium',
      time: '10:15 AM',
      weight: 210.0,
      amount: 735000,
      type: TransactionType.sell,
    ),
  ];

  static const _today = TodaySummaryState(
    transactions: 18,
    weight: 1240.5,
    amount: 3450000,
  );

  static const empty = HomeState(
    scale: ScaleCardState.notConnected(),
    today: TodaySummaryState.empty(),
    getStarted: _stepsPending,
    recent: RecentTransactionsState(),
  );

  static const connected = HomeState(
    scale: ScaleCardState.connected(
      deviceName: 'Scale-01',
      profileName: 'Generic ASCII (kg)',
      weight: 125.40,
      isStable: true,
    ),
    today: _today,
    getStarted: _stepsDone,
    recent: RecentTransactionsState(items: _transactions),
  );

  static const connectionLost = HomeState(
    scale: ScaleCardState.disconnected(
      deviceName: 'Scale-01',
      weight: 125.40,
    ),
    connectionLost: ConnectionLostState(attempt: 2, maxAttempts: 5),
    today: _today,
    getStarted: _stepsDone,
    recent: RecentTransactionsState(items: _transactionsLost),
  );
}