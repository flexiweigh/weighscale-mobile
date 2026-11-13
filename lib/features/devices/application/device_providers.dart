import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/fake_ble_scanner.dart';
import '../data/fake_scale_connector.dart';
import '../data/fake_scale_profile_repository.dart';
import '../domain/device_scanner.dart';
import '../domain/scale_connector.dart';
import '../domain/scale_profile_summary.dart';
import 'device_discovery_service.dart';

final fakeBleScannerProvider = Provider<FakeBleScanner>(
      (ref) => FakeBleScanner(),
);

final deviceScannersProvider = Provider<List<DeviceScanner>>(
      (ref) => [ref.watch(fakeBleScannerProvider)],
);

final deviceDiscoveryServiceProvider = Provider<DeviceDiscoveryService>(
      (ref) => DeviceDiscoveryService(ref.watch(deviceScannersProvider)),
);

final scaleConnectorProvider = Provider<ScaleConnector>(
      (ref) => const FakeScaleConnector(),
);

final scaleProfileRepositoryProvider = Provider<ScaleProfileRepository>(
      (ref) => const FakeScaleProfileRepository(),
);