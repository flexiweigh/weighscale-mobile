import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/items/application/item_form_request.dart';
import '../../features/items/presentation/item_form_screen.dart';
import '../../features/items/presentation/items_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../l10n/l10n_extension.dart';
import '../widgets/placeholder_screen.dart';
import 'app_routes.dart';
import 'app_shell.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.weigh,
                builder: (context, state) => PlaceholderScreen(
                  title: context.l10n.navWeigh,
                  detail: state.uri.queryParameters['type'],
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.history,
                builder: (context, state) =>
                    PlaceholderScreen(title: context.l10n.navHistory),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.items,
                builder: (context, state) => const ItemsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.settings,
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.devices,
        builder: (context, state) => PlaceholderScreen(
          title: context.l10n.devicesTitle,
          showBack: true,
        ),
      ),
      GoRoute(
        path: AppRoutes.reports,
        builder: (context, state) => PlaceholderScreen(
          title: context.l10n.reportsTitle,
          showBack: true,
        ),
      ),
      GoRoute(
        path: AppRoutes.manualEntry,
        builder: (context, state) => PlaceholderScreen(
          title: context.l10n.manualEntryTitle,
          showBack: true,
        ),
      ),
      GoRoute(
        path: AppRoutes.transaction,
        builder: (context, state) => PlaceholderScreen(
          title: context.l10n.transactionDetailTitle,
          detail: '#${state.pathParameters['id']}',
          showBack: true,
        ),
      ),
      GoRoute(
        path: AppRoutes.itemNew,
        builder: (context, state) => ItemFormScreen(
          request: ItemFormRequest.create(
            name: state.uri.queryParameters['name'],
            shortCode: state.uri.queryParameters['code'],
            categoryKey: state.uri.queryParameters['category'],
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.itemEdit,
        builder: (context, state) => ItemFormScreen(
          request: ItemFormRequest.edit(state.pathParameters['id']!),
        ),
      ),
    ],
  );
});