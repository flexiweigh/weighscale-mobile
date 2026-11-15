import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text.dart';
import '../../../../core/widgets/app_card.dart';

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
        const SizedBox(height: 6),
        AppCard(
          padding: EdgeInsets.zero,
          clip: true,
          child: Column(
            children: [
              for (var i = 0; i < tiles.length; i++) ...[
                if (i > 0) const Divider(height: 1, color: AppColors.border),
                tiles[i],
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    this.value,
    this.chip,
    this.trailing,
    this.onTap,
  });

  final String title;
  final String? value;
  final Widget? chip;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final maxValueWidth = MediaQuery.sizeOf(context).width * 0.45;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppText.body.copyWith(fontWeight: FontWeight.w500),
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
                    style: AppText.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
              if (chip != null) ...[const SizedBox(width: 8), chip!],
              if (trailing != null) ...[const SizedBox(width: 8), trailing!],
              if (onTap != null) ...[
                const SizedBox(width: 4),
                const Icon(
                  Icons.chevron_right,
                  size: 18,
                  color: AppColors.mutedIcon,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}