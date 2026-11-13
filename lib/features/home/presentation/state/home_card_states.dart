enum ScaleConnectionStatus { notConnected, connecting, connected, disconnected }

enum ReadingQuality { stable, unstable, noSignal, lastReading }

class ScaleCardState {
  const ScaleCardState({
    required this.status,
    this.deviceName,
    this.profileName,
    this.weight,
    this.unit = 'kg',
    this.isStable = false,
  });

  const ScaleCardState.notConnected()
      : status = ScaleConnectionStatus.notConnected,
        deviceName = null,
        profileName = null,
        weight = null,
        unit = 'kg',
        isStable = false;

  const ScaleCardState.connecting({required String this.deviceName})
      : status = ScaleConnectionStatus.connecting,
        profileName = null,
        weight = null,
        unit = 'kg',
        isStable = false;

  const ScaleCardState.connected({
    required String this.deviceName,
    required String this.profileName,
    this.weight,
    this.unit = 'kg',
    this.isStable = false,
  }) : status = ScaleConnectionStatus.connected;

  const ScaleCardState.disconnected({
    required String this.deviceName,
    this.weight,
    this.unit = 'kg',
  })  : status = ScaleConnectionStatus.disconnected,
        profileName = null,
        isStable = false;

  final ScaleConnectionStatus status;
  final String? deviceName;
  final String? profileName;
  final double? weight;
  final String unit;
  final bool isStable;

  ReadingQuality get quality {
    if (weight == null) return ReadingQuality.noSignal;
    return switch (status) {
      ScaleConnectionStatus.connected =>
      isStable ? ReadingQuality.stable : ReadingQuality.unstable,
      ScaleConnectionStatus.disconnected => ReadingQuality.lastReading,
      _ => ReadingQuality.noSignal,
    };
  }
}

class ConnectionLostState {
  const ConnectionLostState({required this.attempt, required this.maxAttempts});

  final int attempt;
  final int maxAttempts;
}

class TodaySummaryState {
  const TodaySummaryState({
    required this.transactions,
    required this.weight,
    required this.amount,
  });

  const TodaySummaryState.empty()
      : transactions = 0,
        weight = 0,
        amount = 0;

  final int transactions;
  final double weight;
  final int amount;
}

enum GetStartedStepId { connectScale, addItems, firstWeighing }

class GetStartedStep {
  const GetStartedStep({
    required this.id,
    this.done = false,
  });

  final GetStartedStepId id;
  final bool done;
}

class GetStartedState {
  const GetStartedState({required this.steps});

  final List<GetStartedStep> steps;

  int get doneCount => steps.where((s) => s.done).length;
  bool get allDone => steps.every((s) => s.done);

  GetStartedStepId? get currentStepId {
    for (final step in steps) {
      if (!step.done) return step.id;
    }
    return null;
  }
}

enum TransactionType { buy, sell }

class TransactionItemState {
  const TransactionItemState({
    required this.id,
    required this.number,
    required this.party,
    required this.item,
    required this.time,
    required this.weight,
    required this.amount,
    required this.type,
  });

  final String id;
  final String number;
  final String party;
  final String item;
  final String time;
  final double weight;
  final int amount;
  final TransactionType type;
}

class RecentTransactionsState {
  const RecentTransactionsState({this.items = const []});

  final List<TransactionItemState> items;

  bool get isEmpty => items.isEmpty;
}