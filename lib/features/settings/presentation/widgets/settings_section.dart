import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tone.dart';
import '../../../home/presentation/widgets/app_card.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key, required this.title, required this.tiles});

  final String title;
  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title),
        const SizedBox(height: 8),
        AppCard(
          padding: EdgeInsets.zero,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Column(
              children: [
                for (var i = 0; i < tiles.length; i++) ...[
                  if (i > 0)
                    const Divider(
                      height: 1,
                      indent: 60,
                      color: AppColors.border,
                    ),
                  tiles[i],
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.tone,
    required this.title,
    this.value,
    this.onTap,
  });

  final IconData icon;
  final AppTone tone;
  final String title;
  final String? value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = tone.colors;
    final maxValueWidth = MediaQuery.sizeOf(context).width * 0.4;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: colors.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 20, color: colors.foreground),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (value != null) ...[
                const SizedBox(width: 8),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxValueWidth),
                  child: Text(
                    value!,
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
              const SizedBox(width: 4),
              const Icon(
                Icons.chevron_right,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}