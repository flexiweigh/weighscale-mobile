import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/app_bottom_nav.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: AppBottomNav(
        currentIndex: shell.currentIndex,
        onTap: (index) => shell.goBranch(
          index,
          initialLocation: index == shell.currentIndex,
        ),
      ),
    );
  }
}