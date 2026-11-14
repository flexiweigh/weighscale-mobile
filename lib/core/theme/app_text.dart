import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppText {
  AppText._();

  static const headerTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static const headerSubtitle = TextStyle(fontSize: 12, color: Color(0xCCFFFFFF));
  static const sectionTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );
  static const body = TextStyle(fontSize: 13, color: AppColors.textPrimary);
  static const bodyStrong = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  static const caption = TextStyle(fontSize: 12, color: AppColors.textSecondary);
  static const label = TextStyle(fontSize: 11, color: AppColors.textSecondary);
  static const link = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
  static const hint = TextStyle(fontSize: 13, color: AppColors.hint);
}