import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/home_card_states.dart';
import '../state/home_sample_data.dart';
import '../state/home_state.dart';

final homeControllerProvider =
NotifierProvider<HomeController, HomeState>(HomeController.new);

class HomeController extends Notifier<HomeState> {
  @override
  HomeState build() => HomeSampleData.empty;

  void showEmpty() => state = HomeSampleData.empty;

  void showConnected() => state = HomeSampleData.connected;

  void showConnectionLost() => state = HomeSampleData.connectionLost;

  void showConnecting() {
    state = state.copyWith(
      scale: const ScaleCardState.connecting(deviceName: 'Scale-01'),
      clearConnectionLost: true,
    );
  }

  void showUnstable() {
    state = HomeSampleData.connected.copyWith(
      scale: const ScaleCardState.connected(
        deviceName: 'Scale-01',
        profileName: 'Generic ASCII (kg)',
        weight: 125.12,
        isStable: false,
      ),
    );
  }

  void updateScale(ScaleCardState scale) {
    state = state.copyWith(scale: scale);
  }

  void updateConnectionLost(ConnectionLostState value) {
    state = state.copyWith(connectionLost: value);
  }

  void clearConnectionLost() {
    state = state.copyWith(clearConnectionLost: true);
  }

  void updateToday(TodaySummaryState today) {
    state = state.copyWith(today: today);
  }

  void updateGetStarted(GetStartedState getStarted) {
    state = state.copyWith(getStarted: getStarted);
  }

  void updateRecent(RecentTransactionsState recent) {
    state = state.copyWith(recent: recent);
  }

  void connectScale() {
    state = state.copyWith(
      scale: const ScaleCardState.connected(
        deviceName: 'Scale-01',
        profileName: 'Generic ASCII (kg)',
        weight: 0,
        isStable: true,
      ),
      clearConnectionLost: true,
    );
  }

  void reconnect() => connectScale();

  void tare() {
    final current = state.scale;
    state = state.copyWith(
      scale: ScaleCardState.connected(
        deviceName: current.deviceName ?? 'Scale',
        profileName: current.profileName ?? '',
        weight: 0,
        unit: current.unit,
        isStable: true,
      ),
    );
  }

  void zero() => tare();

  void scaleConnected({
    required String deviceName,
    required String profileName,
  }) {
    state = state.copyWith(
      scale: ScaleCardState.connected(
        deviceName: deviceName,
        profileName: profileName,
        weight: 0,
        isStable: true,
      ),
      clearConnectionLost: true,
      getStarted: GetStartedState(
        steps: [
          for (final step in state.getStarted.steps)
            step.id == GetStartedStepId.connectScale
                ? GetStartedStep(id: step.id, done: true)
                : step,
        ],
      ),
    );
  }

}