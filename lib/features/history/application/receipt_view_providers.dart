import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../weighing/application/weighing_providers.dart';
import 'receipt_view.dart';

final receiptViewProvider =
Provider.autoDispose.family<AsyncValue<ReceiptView?>, String>((ref, id) {
  return ref
      .watch(receiptByIdProvider(id))
      .whenData((receipt) => receipt == null ? null : buildReceiptView(receipt));
});