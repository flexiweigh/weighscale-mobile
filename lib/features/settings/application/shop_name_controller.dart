import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/storage/shared_prefs_provider.dart';

final shopNameControllerProvider =
NotifierProvider<ShopNameController, String>(ShopNameController.new);

class ShopNameController extends Notifier<String> {
  static const _storageKey = 'shop_name';
  static const defaultName = 'Main Shop';

  @override
  String build() {
    return ref.read(sharedPreferencesProvider).getString(_storageKey) ??
        defaultName;
  }

  Future<void> setName(String value) async {
    final name = value.trim();
    if (name.isEmpty || name == state) return;
    state = name;
    await ref.read(sharedPreferencesProvider).setString(_storageKey, name);
  }
}