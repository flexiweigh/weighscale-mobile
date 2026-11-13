import 'dart:async';

import '../domain/device_scanner.dart';
import '../domain/discovered_device.dart';
import '../domain/discovery_state.dart';

class DeviceDiscoveryService {
  DeviceDiscoveryService(this._scanners);

  final List<DeviceScanner> _scanners;

  Stream<DiscoveryState> scan({
    Duration timeout = const Duration(seconds: 10),
  }) {
    late final StreamController<DiscoveryState> controller;
    final subscriptions = <StreamSubscription<DiscoveredDevice>>[];
    final found = <String, DiscoveredDevice>{};
    final unavailable = <DeviceTransport, ScannerAvailability>{};
    var running = 0;

    void emit(DiscoveryStatus status) {
      if (controller.isClosed) return;
      final devices = found.values.toList()..sort(_compare);
      controller.add(
        DiscoveryState(
          status: status,
          devices: devices,
          unavailable: Map.unmodifiable(unavailable),
        ),
      );
    }

    void finishOne() {
      running--;
      if (running <= 0 && !controller.isClosed) {
        emit(DiscoveryStatus.finished);
        controller.close();
      }
    }

    Future<void> start() async {
      emit(DiscoveryStatus.scanning);

      final checks = await Future.wait(
        _scanners.map((scanner) async => (scanner, await scanner.availability())),
      );

      final active = <DeviceScanner>[];
      for (final (scanner, availability) in checks) {
        if (availability == ScannerAvailability.available) {
          active.add(scanner);
        } else {
          unavailable[scanner.transport] = availability;
        }
      }

      if (controller.isClosed) return;

      if (active.isEmpty) {
        emit(DiscoveryStatus.unavailable);
        await controller.close();
        return;
      }

      running = active.length;
      emit(DiscoveryStatus.scanning);

      for (final scanner in active) {
        subscriptions.add(
          scanner.scan(timeout: timeout).listen(
                (device) {
              found[device.key] = device;
              emit(DiscoveryStatus.scanning);
            },
            onError: (Object _) => finishOne(),
            onDone: finishOne,
            cancelOnError: true,
          ),
        );
      }
    }

    controller = StreamController<DiscoveryState>(
      onListen: start,
      onCancel: () async {
        for (final subscription in subscriptions) {
          await subscription.cancel();
        }
      },
    );

    return controller.stream;
  }

  static int _compare(DiscoveredDevice a, DiscoveredDevice b) {
    final bySignal = a.signal.index.compareTo(b.signal.index);
    if (bySignal != 0) return bySignal;
    if (a.isNamed != b.isNamed) return a.isNamed ? -1 : 1;
    return (a.name ?? '').compareTo(b.name ?? '');
  }

  DeviceScanner? _find(DeviceTransport transport) {
    for (final scanner in _scanners) {
      if (scanner.transport == transport) return scanner;
    }
    return null;
  }

  AccessFix fixFor(DeviceTransport transport, ScannerAvailability availability) {
    return _find(transport)?.fixFor(availability) ?? AccessFix.none;
  }

  Future<Map<DeviceTransport, ScannerAvailability>> checkAvailability() async {
    final entries = await Future.wait(
      _scanners.map(
            (scanner) async => MapEntry(scanner.transport, await scanner.availability()),
      ),
    );
    return Map.fromEntries(entries);
  }

  Future<ScannerAvailability> requestAccess(DeviceTransport transport) async {
    final scanner = _find(transport);
    if (scanner == null) return ScannerAvailability.unsupported;
    return scanner.requestAccess();
  }
}