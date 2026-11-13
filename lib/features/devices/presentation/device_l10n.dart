import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../domain/device_scanner.dart';
import '../domain/discovered_device.dart';
import '../domain/scale_connector.dart';

extension SignalStrengthL10n on SignalStrength {
  String label(AppL10n l10n) => switch (this) {
    SignalStrength.strong => l10n.signalStrong,
    SignalStrength.good => l10n.signalGood,
    SignalStrength.weak => l10n.signalWeak,
    SignalStrength.unknown => l10n.signalUnknown,
  };
}

extension DeviceTransportUi on DeviceTransport {
  String label(AppL10n l10n) => switch (this) {
    DeviceTransport.ble => l10n.transportBluetooth,
    DeviceTransport.spp => l10n.transportBluetooth,
    DeviceTransport.wifi => l10n.transportWifi,
    DeviceTransport.usb => l10n.transportUsb,
  };

  IconData get icon => switch (this) {
    DeviceTransport.ble => Icons.bluetooth,
    DeviceTransport.spp => Icons.bluetooth_connected,
    DeviceTransport.wifi => Icons.wifi,
    DeviceTransport.usb => Icons.usb,
  };
}

extension ConnectFailureL10n on ConnectFailureReason {
  String message(AppL10n l10n) => switch (this) {
    ConnectFailureReason.timeout => l10n.connectFailedTimeout,
    ConnectFailureReason.rejected => l10n.connectFailedRejected,
    ConnectFailureReason.unsupported => l10n.connectFailedUnsupported,
    ConnectFailureReason.unknown => l10n.connectFailedUnknown,
  };
}

extension ScannerAvailabilityL10n on ScannerAvailability {
  String message(AppL10n l10n, DeviceTransport transport) {
    final name = transport.label(l10n);
    return switch (this) {
      ScannerAvailability.adapterOff => l10n.unavailableAdapterOff(name),
      ScannerAvailability.permissionDenied ||
      ScannerAvailability.permissionPermanentlyDenied =>
          l10n.unavailablePermission(name),
      ScannerAvailability.unsupported => l10n.unavailableUnsupported(name),
      ScannerAvailability.available => '',
    };
  }
}

extension AccessFixL10n on AccessFix {
  String? label(AppL10n l10n) => switch (this) {
    AccessFix.requestPermission => l10n.accessAllow,
    AccessFix.turnOnAdapter => l10n.accessTurnOn,
    AccessFix.openSettings => l10n.accessOpenSettings,
    AccessFix.none => null,
  };
}