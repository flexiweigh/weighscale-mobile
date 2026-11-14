import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../domain/receipt_enums.dart';

ReceiptType receiptTypeFromQuery(String? value) {
  return ReceiptType.values.asNameMap()[value] ?? ReceiptType.buy;
}

void leaveWeighing(BuildContext context) {
  if (context.canPop()) {
    context.pop();
  } else {
    context.go(AppRoutes.home);
  }
}