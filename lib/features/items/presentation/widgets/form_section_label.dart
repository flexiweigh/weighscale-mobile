import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class FormSectionLabel extends StatelessWidget {
  const FormSectionLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8, left: 2),
      child: Text(
        isEnglish ? text.toUpperCase() : text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: isEnglish ? 0.6 : 0,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}