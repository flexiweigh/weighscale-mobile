import 'package:flutter/material.dart';

import 'app_colors.dart';

enum AppTone { blue, green, orange, purple, teal, red, grey }

class ToneColors {
  const ToneColors(this.foreground, this.background, this.border);

  final Color foreground;
  final Color background;
  final Color border;
}

extension AppToneColors on AppTone {
  ToneColors get colors => switch (this) {
    AppTone.blue => const ToneColors(
        AppColors.primary, AppColors.selectedTint, Color(0xFFBFD3F7)),
    AppTone.green => const ToneColors(
        AppColors.success, Color(0xFFE3F5EA), Color(0xFFB9E3C8)),
    AppTone.orange => const ToneColors(
        AppColors.warning, Color(0xFFFFF0DC), Color(0xFFF5D3A3)),
    AppTone.purple => const ToneColors(
        Color(0xFF7B4DD6), Color(0xFFEEE8FA), Color(0xFFD5C6F2)),
    AppTone.teal => const ToneColors(
        AppColors.teal, Color(0xFFDFF3F6), Color(0xFFB5E0E7)),
    AppTone.red => const ToneColors(
        AppColors.danger, Color(0xFFFDE8E8), Color(0xFFF3BFBF)),
    AppTone.grey => const ToneColors(
        AppColors.textSecondary, Color(0xFFEEF1F6), Color(0xFFD9DEE8)),
  };
}