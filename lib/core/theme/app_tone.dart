import 'package:flutter/material.dart';

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
        Color(0xFF1D5FD6), Color(0xFFE6EEFC), Color(0xFFBFD3F7)),
    AppTone.green => const ToneColors(
        Color(0xFF1E9E55), Color(0xFFE3F5EA), Color(0xFFB9E3C8)),
    AppTone.orange => const ToneColors(
        Color(0xFFE8890C), Color(0xFFFFF0DC), Color(0xFFF5D3A3)),
    AppTone.purple => const ToneColors(
        Color(0xFF7B4DD6), Color(0xFFEEE8FA), Color(0xFFD5C6F2)),
    AppTone.teal => const ToneColors(
        Color(0xFF128A9B), Color(0xFFDFF3F6), Color(0xFFB5E0E7)),
    AppTone.red => const ToneColors(
        Color(0xFFD64545), Color(0xFFFDE8E8), Color(0xFFF3BFBF)),
    AppTone.grey => const ToneColors(
        Color(0xFF6B7587), Color(0xFFEEF1F6), Color(0xFFD9DEE8)),
  };
}