import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_resume_listener.dart';
import '../../home/presentation/widgets/app_card.dart';
import '../application/connect_sheet_controller.dart';
import '../domain/discovery_state.dart';
import 'device_l10n.dart';
import 'widgets/device_row.dart';
import 'widgets/discovery_banner.dart';

class ConnectedScale {
  const ConnectedScale({required this.deviceName, required this.profileName});

  final String deviceName;
  final String profileName;
}

Future<ConnectedScale?> showConnectScaleSheet(
    BuildContext context, {
      VoidCallback? onEnterManually,
    }) {
  return showModalBottomSheet<ConnectedScale>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    backgroundColor: AppColors.surface,
    builder: (_) => ConnectScaleSheet(onEnterManually: onEnterManually),
  );
}

class ConnectScaleSheet extends ConsumerWidget {
  const ConnectScaleSheet({super.key, this.onEnterManually});

  final VoidCallback? onEnterManually;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(connectSheetControllerProvider);
    final controller = ref.read(connectSheetControllerProvider.notifier);
    final l10n = context.l10n;
    final devices = state.discovery.devices;
    final showEmpty = state.discovery.status == DiscoveryStatus.finished &&
        devices.isEmpty;

    return AppResumeListener(
      onResume: controller.refreshAvailability,
      child: PopScope(
        canPop: !state.isConnecting,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            16,
            0,
            16,
            16 + MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.connectTitle,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          l10n.connectSubtitle,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.4,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton.icon(
                    onPressed: state.isConnecting || state.discovery.isScanning
                        ? null
                        : controller.startScan,
                    icon: const Icon(Icons.refresh, size: 18),
                    label: Text(l10n.connectRescan),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              DiscoveryBanner(
                discovery: state.discovery,
                busy: state.isFixingAccess || state.isConnecting,
                fixFor: controller.fixFor,
                onFix: controller.fixAccess,
              ),
              const SizedBox(height: 12),
              if (showEmpty)
                const _EmptyDevices()
              else if (devices.isNotEmpty)
                AppCard(
                  padding: EdgeInsets.zero,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 260),
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: devices.length,
                        separatorBuilder: (_, __) =>
                        const Divider(height: 1, color: AppColors.border),
                        itemBuilder: (context, index) {
                          final device = devices[index];
                          return DeviceRow(
                            device: device,
                            highlighted: index == 0,
                            isConnecting: state.connectingKey == device.key,
                            enabled: state.canConnect,
                            onConnect: () async {
                              final ok = await controller.connect(device);
                              if (!ok || !context.mounted) return;
                              final latest =
                              ref.read(connectSheetControllerProvider);
                              final profile = latest.profiles
                                  .where(
                                    (p) => p.id == latest.selectedProfileId,
                              )
                                  .firstOrNull;
                              Navigator.of(context).pop(
                                ConnectedScale(
                                  deviceName: device.isNamed
                                      ? device.name!
                                      : l10n.deviceUnnamed,
                                  profileName: profile?.name ?? '',
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              if (state.failure != null) ...[
                const SizedBox(height: 10),
                Text(
                  state.failure!.message(l10n),
                  style: const TextStyle(fontSize: 12, color: AppColors.danger),
                ),
              ],
              const SizedBox(height: 16),
              InputDecorator(
                decoration: InputDecoration(
                  labelText: l10n.connectProfileLabel,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: state.selectedProfileId,
                    items: [
                      for (final profile in state.profiles)
                        DropdownMenuItem(
                          value: profile.id,
                          child: Text(profile.name),
                        ),
                    ],
                    onChanged: state.isConnecting
                        ? null
                        : (id) {
                      if (id != null) controller.selectProfile(id);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    '${l10n.connectCantFind} ',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: state.isConnecting
                        ? null
                        : () {
                      Navigator.of(context).pop();
                      onEnterManually?.call();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        l10n.connectEnterManually,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyDevices extends StatelessWidget {
  const _EmptyDevices();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Icon(
            Icons.bluetooth_searching,
            size: 32,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.connectNoDevices,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.connectNoDevicesHint,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              height: 1.5,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}