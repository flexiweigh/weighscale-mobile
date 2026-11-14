import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import '../../items/application/item_providers.dart';
import '../../items/domain/item.dart';
import '../data/drift_deduction_preset_repository.dart';
import '../data/drift_receipt_repository.dart';
import '../domain/deduction_preset.dart';
import '../domain/deduction_preset_repository.dart';
import '../domain/receipt.dart';
import '../domain/receipt_repository.dart';

final receiptRepositoryProvider = Provider<ReceiptRepository>(
      (ref) => DriftReceiptRepository(ref.watch(appDatabaseProvider)),
);

final deductionPresetRepositoryProvider = Provider<DeductionPresetRepository>(
      (ref) => DriftDeductionPresetRepository(ref.watch(appDatabaseProvider)),
);

final deductionPresetsProvider = StreamProvider<List<DeductionPreset>>(
      (ref) => ref.watch(deductionPresetRepositoryProvider).watchAll(),
);

final activeItemsProvider = StreamProvider.autoDispose<List<Item>>(
      (ref) => ref.watch(itemRepositoryProvider).watchAll(activeOnly: true),
);

final receiptByIdProvider = StreamProvider.autoDispose.family<Receipt?, String>(
      (ref, id) => ref.watch(receiptRepositoryProvider).watchById(id),
);