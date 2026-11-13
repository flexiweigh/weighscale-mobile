import '../domain/discovery_state.dart';
import '../domain/scale_connector.dart';
import '../domain/scale_profile_summary.dart';

class ConnectSheetState {
  const ConnectSheetState({
    this.discovery = const DiscoveryState(),
    this.profiles = const [],
    this.selectedProfileId,
    this.connectingKey,
    this.failure,
    this.isFixingAccess = false,
  });

  final DiscoveryState discovery;
  final List<ScaleProfileSummary> profiles;
  final String? selectedProfileId;
  final String? connectingKey;
  final ConnectFailureReason? failure;
  final bool isFixingAccess;

  bool get isConnecting => connectingKey != null;

  bool get canConnect => selectedProfileId != null && !isConnecting;

  ConnectSheetState copyWith({
    DiscoveryState? discovery,
    List<ScaleProfileSummary>? profiles,
    String? selectedProfileId,
    String? connectingKey,
    bool clearConnecting = false,
    ConnectFailureReason? failure,
    bool clearFailure = false,
    bool? isFixingAccess,
  }) {
    return ConnectSheetState(
      discovery: discovery ?? this.discovery,
      profiles: profiles ?? this.profiles,
      selectedProfileId: selectedProfileId ?? this.selectedProfileId,
      connectingKey: clearConnecting ? null : (connectingKey ?? this.connectingKey),
      failure: clearFailure ? null : (failure ?? this.failure),
      isFixingAccess: isFixingAccess ?? this.isFixingAccess,
    );
  }
}