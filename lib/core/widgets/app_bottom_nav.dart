import 'package:flutter/material.dart';

import '../l10n/l10n_extension.dart';
import '../theme/app_colors.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surface,
        elevation: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: l10n.navHome,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.balance),
            label: l10n.navWeigh,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: l10n.navHistory,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.format_list_bulleted),
            label: l10n.navItems,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.tune),
            label: l10n.navSettings,
          ),
        ],
      ),
    );
  }
}