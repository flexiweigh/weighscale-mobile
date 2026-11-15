import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/storage/shared_prefs_provider.dart';

final receiptFooterControllerProvider =
NotifierProvider<ReceiptFooterController, String>(
  ReceiptFooterController.new,
);

class ReceiptFooterController extends Notifier<String> {
  static const _storageKey = 'receipt_footer';
  static const defaultText = 'Thank you';

  @override
  String build() {
    return ref.read(sharedPreferencesProvider).getString(_storageKey) ??
        defaultText;
  }

  Future<void> setText(String value) async {
    final text = value.trim();
    if (text == state) return;
    state = text;
    await ref.read(sharedPreferencesProvider).setString(_storageKey, text);
  }
}