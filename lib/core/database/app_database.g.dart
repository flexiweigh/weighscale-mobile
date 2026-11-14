// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 40,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _systemKeyMeta = const VerificationMeta(
    'systemKey',
  );
  @override
  late final GeneratedColumn<String> systemKey = GeneratedColumn<String>(
    'system_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(100),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    systemKey,
    sortOrder,
    createdAt,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('system_key')) {
      context.handle(
        _systemKeyMeta,
        systemKey.isAcceptableOrUnknown(data['system_key']!, _systemKeyMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      systemKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}system_key'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class CategoryRow extends DataClass implements Insertable<CategoryRow> {
  final String id;
  final String name;
  final String? systemKey;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const CategoryRow({
    required this.id,
    required this.name,
    this.systemKey,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || systemKey != null) {
      map['system_key'] = Variable<String>(systemKey);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      systemKey: systemKey == null && nullToAbsent
          ? const Value.absent()
          : Value(systemKey),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory CategoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      systemKey: serializer.fromJson<String?>(json['systemKey']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'systemKey': serializer.toJson<String?>(systemKey),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  CategoryRow copyWith({
    String? id,
    String? name,
    Value<String?> systemKey = const Value.absent(),
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => CategoryRow(
    id: id ?? this.id,
    name: name ?? this.name,
    systemKey: systemKey.present ? systemKey.value : this.systemKey,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  CategoryRow copyWithCompanion(CategoriesCompanion data) {
    return CategoryRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      systemKey: data.systemKey.present ? data.systemKey.value : this.systemKey,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('systemKey: $systemKey, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    systemKey,
    sortOrder,
    createdAt,
    updatedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.systemKey == this.systemKey &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class CategoriesCompanion extends UpdateCompanion<CategoryRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> systemKey;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.systemKey = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String name,
    this.systemKey = const Value.absent(),
    this.sortOrder = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CategoryRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? systemKey,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (systemKey != null) 'system_key': systemKey,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? systemKey,
    Value<int>? sortOrder,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      systemKey: systemKey ?? this.systemKey,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (systemKey.present) {
      map['system_key'] = Variable<String>(systemKey.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('systemKey: $systemKey, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ItemsTable extends Items with TableInfo<$ItemsTable, ItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 80,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shortCodeMeta = const VerificationMeta(
    'shortCode',
  );
  @override
  late final GeneratedColumn<String> shortCode = GeneratedColumn<String>(
    'short_code',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 12),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<WeightUnit, String> unit =
      GeneratedColumn<String>(
        'unit',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<WeightUnit>($ItemsTable.$converterunit);
  static const VerificationMeta _buyPriceMeta = const VerificationMeta(
    'buyPrice',
  );
  @override
  late final GeneratedColumn<int> buyPrice = GeneratedColumn<int>(
    'buy_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sellPriceMeta = const VerificationMeta(
    'sellPrice',
  );
  @override
  late final GeneratedColumn<int> sellPrice = GeneratedColumn<int>(
    'sell_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _targetWeightMilliMeta = const VerificationMeta(
    'targetWeightMilli',
  );
  @override
  late final GeneratedColumn<int> targetWeightMilli = GeneratedColumn<int>(
    'target_weight_milli',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _toleranceMilliMeta = const VerificationMeta(
    'toleranceMilli',
  );
  @override
  late final GeneratedColumn<int> toleranceMilli = GeneratedColumn<int>(
    'tolerance_milli',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _showWeightCheckMeta = const VerificationMeta(
    'showWeightCheck',
  );
  @override
  late final GeneratedColumn<bool> showWeightCheck = GeneratedColumn<bool>(
    'show_weight_check',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("show_weight_check" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _autoCaptureWhenOkMeta = const VerificationMeta(
    'autoCaptureWhenOk',
  );
  @override
  late final GeneratedColumn<bool> autoCaptureWhenOk = GeneratedColumn<bool>(
    'auto_capture_when_ok',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("auto_capture_when_ok" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _defaultDeductionMilliMeta =
      const VerificationMeta('defaultDeductionMilli');
  @override
  late final GeneratedColumn<int> defaultDeductionMilli = GeneratedColumn<int>(
    'default_deduction_milli',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    shortCode,
    categoryId,
    unit,
    buyPrice,
    sellPrice,
    targetWeightMilli,
    toleranceMilli,
    showWeightCheck,
    autoCaptureWhenOk,
    defaultDeductionMilli,
    isActive,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('short_code')) {
      context.handle(
        _shortCodeMeta,
        shortCode.isAcceptableOrUnknown(data['short_code']!, _shortCodeMeta),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('buy_price')) {
      context.handle(
        _buyPriceMeta,
        buyPrice.isAcceptableOrUnknown(data['buy_price']!, _buyPriceMeta),
      );
    }
    if (data.containsKey('sell_price')) {
      context.handle(
        _sellPriceMeta,
        sellPrice.isAcceptableOrUnknown(data['sell_price']!, _sellPriceMeta),
      );
    }
    if (data.containsKey('target_weight_milli')) {
      context.handle(
        _targetWeightMilliMeta,
        targetWeightMilli.isAcceptableOrUnknown(
          data['target_weight_milli']!,
          _targetWeightMilliMeta,
        ),
      );
    }
    if (data.containsKey('tolerance_milli')) {
      context.handle(
        _toleranceMilliMeta,
        toleranceMilli.isAcceptableOrUnknown(
          data['tolerance_milli']!,
          _toleranceMilliMeta,
        ),
      );
    }
    if (data.containsKey('show_weight_check')) {
      context.handle(
        _showWeightCheckMeta,
        showWeightCheck.isAcceptableOrUnknown(
          data['show_weight_check']!,
          _showWeightCheckMeta,
        ),
      );
    }
    if (data.containsKey('auto_capture_when_ok')) {
      context.handle(
        _autoCaptureWhenOkMeta,
        autoCaptureWhenOk.isAcceptableOrUnknown(
          data['auto_capture_when_ok']!,
          _autoCaptureWhenOkMeta,
        ),
      );
    }
    if (data.containsKey('default_deduction_milli')) {
      context.handle(
        _defaultDeductionMilliMeta,
        defaultDeductionMilli.isAcceptableOrUnknown(
          data['default_deduction_milli']!,
          _defaultDeductionMilliMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      shortCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_code'],
      ),
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      ),
      unit: $ItemsTable.$converterunit.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}unit'],
        )!,
      ),
      buyPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}buy_price'],
      )!,
      sellPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sell_price'],
      )!,
      targetWeightMilli: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_weight_milli'],
      ),
      toleranceMilli: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tolerance_milli'],
      )!,
      showWeightCheck: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}show_weight_check'],
      )!,
      autoCaptureWhenOk: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}auto_capture_when_ok'],
      )!,
      defaultDeductionMilli: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_deduction_milli'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<WeightUnit, String, String> $converterunit =
      const EnumNameConverter<WeightUnit>(WeightUnit.values);
}

class ItemRow extends DataClass implements Insertable<ItemRow> {
  final String id;
  final String name;
  final String? shortCode;
  final String? categoryId;
  final WeightUnit unit;
  final int buyPrice;
  final int sellPrice;
  final int? targetWeightMilli;
  final int toleranceMilli;
  final bool showWeightCheck;
  final bool autoCaptureWhenOk;
  final int defaultDeductionMilli;
  final bool isActive;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const ItemRow({
    required this.id,
    required this.name,
    this.shortCode,
    this.categoryId,
    required this.unit,
    required this.buyPrice,
    required this.sellPrice,
    this.targetWeightMilli,
    required this.toleranceMilli,
    required this.showWeightCheck,
    required this.autoCaptureWhenOk,
    required this.defaultDeductionMilli,
    required this.isActive,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || shortCode != null) {
      map['short_code'] = Variable<String>(shortCode);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    {
      map['unit'] = Variable<String>($ItemsTable.$converterunit.toSql(unit));
    }
    map['buy_price'] = Variable<int>(buyPrice);
    map['sell_price'] = Variable<int>(sellPrice);
    if (!nullToAbsent || targetWeightMilli != null) {
      map['target_weight_milli'] = Variable<int>(targetWeightMilli);
    }
    map['tolerance_milli'] = Variable<int>(toleranceMilli);
    map['show_weight_check'] = Variable<bool>(showWeightCheck);
    map['auto_capture_when_ok'] = Variable<bool>(autoCaptureWhenOk);
    map['default_deduction_milli'] = Variable<int>(defaultDeductionMilli);
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: Value(id),
      name: Value(name),
      shortCode: shortCode == null && nullToAbsent
          ? const Value.absent()
          : Value(shortCode),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      unit: Value(unit),
      buyPrice: Value(buyPrice),
      sellPrice: Value(sellPrice),
      targetWeightMilli: targetWeightMilli == null && nullToAbsent
          ? const Value.absent()
          : Value(targetWeightMilli),
      toleranceMilli: Value(toleranceMilli),
      showWeightCheck: Value(showWeightCheck),
      autoCaptureWhenOk: Value(autoCaptureWhenOk),
      defaultDeductionMilli: Value(defaultDeductionMilli),
      isActive: Value(isActive),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      shortCode: serializer.fromJson<String?>(json['shortCode']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      unit: $ItemsTable.$converterunit.fromJson(
        serializer.fromJson<String>(json['unit']),
      ),
      buyPrice: serializer.fromJson<int>(json['buyPrice']),
      sellPrice: serializer.fromJson<int>(json['sellPrice']),
      targetWeightMilli: serializer.fromJson<int?>(json['targetWeightMilli']),
      toleranceMilli: serializer.fromJson<int>(json['toleranceMilli']),
      showWeightCheck: serializer.fromJson<bool>(json['showWeightCheck']),
      autoCaptureWhenOk: serializer.fromJson<bool>(json['autoCaptureWhenOk']),
      defaultDeductionMilli: serializer.fromJson<int>(
        json['defaultDeductionMilli'],
      ),
      isActive: serializer.fromJson<bool>(json['isActive']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'shortCode': serializer.toJson<String?>(shortCode),
      'categoryId': serializer.toJson<String?>(categoryId),
      'unit': serializer.toJson<String>(
        $ItemsTable.$converterunit.toJson(unit),
      ),
      'buyPrice': serializer.toJson<int>(buyPrice),
      'sellPrice': serializer.toJson<int>(sellPrice),
      'targetWeightMilli': serializer.toJson<int?>(targetWeightMilli),
      'toleranceMilli': serializer.toJson<int>(toleranceMilli),
      'showWeightCheck': serializer.toJson<bool>(showWeightCheck),
      'autoCaptureWhenOk': serializer.toJson<bool>(autoCaptureWhenOk),
      'defaultDeductionMilli': serializer.toJson<int>(defaultDeductionMilli),
      'isActive': serializer.toJson<bool>(isActive),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ItemRow copyWith({
    String? id,
    String? name,
    Value<String?> shortCode = const Value.absent(),
    Value<String?> categoryId = const Value.absent(),
    WeightUnit? unit,
    int? buyPrice,
    int? sellPrice,
    Value<int?> targetWeightMilli = const Value.absent(),
    int? toleranceMilli,
    bool? showWeightCheck,
    bool? autoCaptureWhenOk,
    int? defaultDeductionMilli,
    bool? isActive,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => ItemRow(
    id: id ?? this.id,
    name: name ?? this.name,
    shortCode: shortCode.present ? shortCode.value : this.shortCode,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    unit: unit ?? this.unit,
    buyPrice: buyPrice ?? this.buyPrice,
    sellPrice: sellPrice ?? this.sellPrice,
    targetWeightMilli: targetWeightMilli.present
        ? targetWeightMilli.value
        : this.targetWeightMilli,
    toleranceMilli: toleranceMilli ?? this.toleranceMilli,
    showWeightCheck: showWeightCheck ?? this.showWeightCheck,
    autoCaptureWhenOk: autoCaptureWhenOk ?? this.autoCaptureWhenOk,
    defaultDeductionMilli: defaultDeductionMilli ?? this.defaultDeductionMilli,
    isActive: isActive ?? this.isActive,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  ItemRow copyWithCompanion(ItemsCompanion data) {
    return ItemRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      shortCode: data.shortCode.present ? data.shortCode.value : this.shortCode,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      unit: data.unit.present ? data.unit.value : this.unit,
      buyPrice: data.buyPrice.present ? data.buyPrice.value : this.buyPrice,
      sellPrice: data.sellPrice.present ? data.sellPrice.value : this.sellPrice,
      targetWeightMilli: data.targetWeightMilli.present
          ? data.targetWeightMilli.value
          : this.targetWeightMilli,
      toleranceMilli: data.toleranceMilli.present
          ? data.toleranceMilli.value
          : this.toleranceMilli,
      showWeightCheck: data.showWeightCheck.present
          ? data.showWeightCheck.value
          : this.showWeightCheck,
      autoCaptureWhenOk: data.autoCaptureWhenOk.present
          ? data.autoCaptureWhenOk.value
          : this.autoCaptureWhenOk,
      defaultDeductionMilli: data.defaultDeductionMilli.present
          ? data.defaultDeductionMilli.value
          : this.defaultDeductionMilli,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortCode: $shortCode, ')
          ..write('categoryId: $categoryId, ')
          ..write('unit: $unit, ')
          ..write('buyPrice: $buyPrice, ')
          ..write('sellPrice: $sellPrice, ')
          ..write('targetWeightMilli: $targetWeightMilli, ')
          ..write('toleranceMilli: $toleranceMilli, ')
          ..write('showWeightCheck: $showWeightCheck, ')
          ..write('autoCaptureWhenOk: $autoCaptureWhenOk, ')
          ..write('defaultDeductionMilli: $defaultDeductionMilli, ')
          ..write('isActive: $isActive, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    shortCode,
    categoryId,
    unit,
    buyPrice,
    sellPrice,
    targetWeightMilli,
    toleranceMilli,
    showWeightCheck,
    autoCaptureWhenOk,
    defaultDeductionMilli,
    isActive,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.shortCode == this.shortCode &&
          other.categoryId == this.categoryId &&
          other.unit == this.unit &&
          other.buyPrice == this.buyPrice &&
          other.sellPrice == this.sellPrice &&
          other.targetWeightMilli == this.targetWeightMilli &&
          other.toleranceMilli == this.toleranceMilli &&
          other.showWeightCheck == this.showWeightCheck &&
          other.autoCaptureWhenOk == this.autoCaptureWhenOk &&
          other.defaultDeductionMilli == this.defaultDeductionMilli &&
          other.isActive == this.isActive &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ItemsCompanion extends UpdateCompanion<ItemRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> shortCode;
  final Value<String?> categoryId;
  final Value<WeightUnit> unit;
  final Value<int> buyPrice;
  final Value<int> sellPrice;
  final Value<int?> targetWeightMilli;
  final Value<int> toleranceMilli;
  final Value<bool> showWeightCheck;
  final Value<bool> autoCaptureWhenOk;
  final Value<int> defaultDeductionMilli;
  final Value<bool> isActive;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.shortCode = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.unit = const Value.absent(),
    this.buyPrice = const Value.absent(),
    this.sellPrice = const Value.absent(),
    this.targetWeightMilli = const Value.absent(),
    this.toleranceMilli = const Value.absent(),
    this.showWeightCheck = const Value.absent(),
    this.autoCaptureWhenOk = const Value.absent(),
    this.defaultDeductionMilli = const Value.absent(),
    this.isActive = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemsCompanion.insert({
    required String id,
    required String name,
    this.shortCode = const Value.absent(),
    this.categoryId = const Value.absent(),
    required WeightUnit unit,
    this.buyPrice = const Value.absent(),
    this.sellPrice = const Value.absent(),
    this.targetWeightMilli = const Value.absent(),
    this.toleranceMilli = const Value.absent(),
    this.showWeightCheck = const Value.absent(),
    this.autoCaptureWhenOk = const Value.absent(),
    this.defaultDeductionMilli = const Value.absent(),
    this.isActive = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       unit = Value(unit),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ItemRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? shortCode,
    Expression<String>? categoryId,
    Expression<String>? unit,
    Expression<int>? buyPrice,
    Expression<int>? sellPrice,
    Expression<int>? targetWeightMilli,
    Expression<int>? toleranceMilli,
    Expression<bool>? showWeightCheck,
    Expression<bool>? autoCaptureWhenOk,
    Expression<int>? defaultDeductionMilli,
    Expression<bool>? isActive,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (shortCode != null) 'short_code': shortCode,
      if (categoryId != null) 'category_id': categoryId,
      if (unit != null) 'unit': unit,
      if (buyPrice != null) 'buy_price': buyPrice,
      if (sellPrice != null) 'sell_price': sellPrice,
      if (targetWeightMilli != null) 'target_weight_milli': targetWeightMilli,
      if (toleranceMilli != null) 'tolerance_milli': toleranceMilli,
      if (showWeightCheck != null) 'show_weight_check': showWeightCheck,
      if (autoCaptureWhenOk != null) 'auto_capture_when_ok': autoCaptureWhenOk,
      if (defaultDeductionMilli != null)
        'default_deduction_milli': defaultDeductionMilli,
      if (isActive != null) 'is_active': isActive,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? shortCode,
    Value<String?>? categoryId,
    Value<WeightUnit>? unit,
    Value<int>? buyPrice,
    Value<int>? sellPrice,
    Value<int?>? targetWeightMilli,
    Value<int>? toleranceMilli,
    Value<bool>? showWeightCheck,
    Value<bool>? autoCaptureWhenOk,
    Value<int>? defaultDeductionMilli,
    Value<bool>? isActive,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return ItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      shortCode: shortCode ?? this.shortCode,
      categoryId: categoryId ?? this.categoryId,
      unit: unit ?? this.unit,
      buyPrice: buyPrice ?? this.buyPrice,
      sellPrice: sellPrice ?? this.sellPrice,
      targetWeightMilli: targetWeightMilli ?? this.targetWeightMilli,
      toleranceMilli: toleranceMilli ?? this.toleranceMilli,
      showWeightCheck: showWeightCheck ?? this.showWeightCheck,
      autoCaptureWhenOk: autoCaptureWhenOk ?? this.autoCaptureWhenOk,
      defaultDeductionMilli:
          defaultDeductionMilli ?? this.defaultDeductionMilli,
      isActive: isActive ?? this.isActive,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (shortCode.present) {
      map['short_code'] = Variable<String>(shortCode.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(
        $ItemsTable.$converterunit.toSql(unit.value),
      );
    }
    if (buyPrice.present) {
      map['buy_price'] = Variable<int>(buyPrice.value);
    }
    if (sellPrice.present) {
      map['sell_price'] = Variable<int>(sellPrice.value);
    }
    if (targetWeightMilli.present) {
      map['target_weight_milli'] = Variable<int>(targetWeightMilli.value);
    }
    if (toleranceMilli.present) {
      map['tolerance_milli'] = Variable<int>(toleranceMilli.value);
    }
    if (showWeightCheck.present) {
      map['show_weight_check'] = Variable<bool>(showWeightCheck.value);
    }
    if (autoCaptureWhenOk.present) {
      map['auto_capture_when_ok'] = Variable<bool>(autoCaptureWhenOk.value);
    }
    if (defaultDeductionMilli.present) {
      map['default_deduction_milli'] = Variable<int>(
        defaultDeductionMilli.value,
      );
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortCode: $shortCode, ')
          ..write('categoryId: $categoryId, ')
          ..write('unit: $unit, ')
          ..write('buyPrice: $buyPrice, ')
          ..write('sellPrice: $sellPrice, ')
          ..write('targetWeightMilli: $targetWeightMilli, ')
          ..write('toleranceMilli: $toleranceMilli, ')
          ..write('showWeightCheck: $showWeightCheck, ')
          ..write('autoCaptureWhenOk: $autoCaptureWhenOk, ')
          ..write('defaultDeductionMilli: $defaultDeductionMilli, ')
          ..write('isActive: $isActive, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReceiptsTable extends Receipts
    with TableInfo<$ReceiptsTable, ReceiptRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReceiptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _receiptNumberMeta = const VerificationMeta(
    'receiptNumber',
  );
  @override
  late final GeneratedColumn<int> receiptNumber = GeneratedColumn<int>(
    'receipt_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  late final GeneratedColumnWithTypeConverter<ReceiptType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ReceiptType>($ReceiptsTable.$convertertype);
  @override
  late final GeneratedColumnWithTypeConverter<ReceiptStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ReceiptStatus>($ReceiptsTable.$converterstatus);
  static const VerificationMeta _partyNameMeta = const VerificationMeta(
    'partyName',
  );
  @override
  late final GeneratedColumn<String> partyName = GeneratedColumn<String>(
    'party_name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 80),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<int> totalAmount = GeneratedColumn<int>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    receiptNumber,
    type,
    status,
    partyName,
    totalAmount,
    createdAt,
    updatedAt,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'receipts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReceiptRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('receipt_number')) {
      context.handle(
        _receiptNumberMeta,
        receiptNumber.isAcceptableOrUnknown(
          data['receipt_number']!,
          _receiptNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_receiptNumberMeta);
    }
    if (data.containsKey('party_name')) {
      context.handle(
        _partyNameMeta,
        partyName.isAcceptableOrUnknown(data['party_name']!, _partyNameMeta),
      );
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReceiptRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReceiptRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      receiptNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}receipt_number'],
      )!,
      type: $ReceiptsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      status: $ReceiptsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      partyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}party_name'],
      ),
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_amount'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $ReceiptsTable createAlias(String alias) {
    return $ReceiptsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ReceiptType, String, String> $convertertype =
      const EnumNameConverter<ReceiptType>(ReceiptType.values);
  static JsonTypeConverter2<ReceiptStatus, String, String> $converterstatus =
      const EnumNameConverter<ReceiptStatus>(ReceiptStatus.values);
}

class ReceiptRow extends DataClass implements Insertable<ReceiptRow> {
  final String id;
  final int receiptNumber;
  final ReceiptType type;
  final ReceiptStatus status;
  final String? partyName;
  final int totalAmount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? completedAt;
  const ReceiptRow({
    required this.id,
    required this.receiptNumber,
    required this.type,
    required this.status,
    this.partyName,
    required this.totalAmount,
    required this.createdAt,
    required this.updatedAt,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['receipt_number'] = Variable<int>(receiptNumber);
    {
      map['type'] = Variable<String>($ReceiptsTable.$convertertype.toSql(type));
    }
    {
      map['status'] = Variable<String>(
        $ReceiptsTable.$converterstatus.toSql(status),
      );
    }
    if (!nullToAbsent || partyName != null) {
      map['party_name'] = Variable<String>(partyName);
    }
    map['total_amount'] = Variable<int>(totalAmount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  ReceiptsCompanion toCompanion(bool nullToAbsent) {
    return ReceiptsCompanion(
      id: Value(id),
      receiptNumber: Value(receiptNumber),
      type: Value(type),
      status: Value(status),
      partyName: partyName == null && nullToAbsent
          ? const Value.absent()
          : Value(partyName),
      totalAmount: Value(totalAmount),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory ReceiptRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReceiptRow(
      id: serializer.fromJson<String>(json['id']),
      receiptNumber: serializer.fromJson<int>(json['receiptNumber']),
      type: $ReceiptsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      status: $ReceiptsTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      partyName: serializer.fromJson<String?>(json['partyName']),
      totalAmount: serializer.fromJson<int>(json['totalAmount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'receiptNumber': serializer.toJson<int>(receiptNumber),
      'type': serializer.toJson<String>(
        $ReceiptsTable.$convertertype.toJson(type),
      ),
      'status': serializer.toJson<String>(
        $ReceiptsTable.$converterstatus.toJson(status),
      ),
      'partyName': serializer.toJson<String?>(partyName),
      'totalAmount': serializer.toJson<int>(totalAmount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  ReceiptRow copyWith({
    String? id,
    int? receiptNumber,
    ReceiptType? type,
    ReceiptStatus? status,
    Value<String?> partyName = const Value.absent(),
    int? totalAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> completedAt = const Value.absent(),
  }) => ReceiptRow(
    id: id ?? this.id,
    receiptNumber: receiptNumber ?? this.receiptNumber,
    type: type ?? this.type,
    status: status ?? this.status,
    partyName: partyName.present ? partyName.value : this.partyName,
    totalAmount: totalAmount ?? this.totalAmount,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  ReceiptRow copyWithCompanion(ReceiptsCompanion data) {
    return ReceiptRow(
      id: data.id.present ? data.id.value : this.id,
      receiptNumber: data.receiptNumber.present
          ? data.receiptNumber.value
          : this.receiptNumber,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      partyName: data.partyName.present ? data.partyName.value : this.partyName,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptRow(')
          ..write('id: $id, ')
          ..write('receiptNumber: $receiptNumber, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('partyName: $partyName, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    receiptNumber,
    type,
    status,
    partyName,
    totalAmount,
    createdAt,
    updatedAt,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReceiptRow &&
          other.id == this.id &&
          other.receiptNumber == this.receiptNumber &&
          other.type == this.type &&
          other.status == this.status &&
          other.partyName == this.partyName &&
          other.totalAmount == this.totalAmount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.completedAt == this.completedAt);
}

class ReceiptsCompanion extends UpdateCompanion<ReceiptRow> {
  final Value<String> id;
  final Value<int> receiptNumber;
  final Value<ReceiptType> type;
  final Value<ReceiptStatus> status;
  final Value<String?> partyName;
  final Value<int> totalAmount;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const ReceiptsCompanion({
    this.id = const Value.absent(),
    this.receiptNumber = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.partyName = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReceiptsCompanion.insert({
    required String id,
    required int receiptNumber,
    required ReceiptType type,
    required ReceiptStatus status,
    this.partyName = const Value.absent(),
    this.totalAmount = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       receiptNumber = Value(receiptNumber),
       type = Value(type),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ReceiptRow> custom({
    Expression<String>? id,
    Expression<int>? receiptNumber,
    Expression<String>? type,
    Expression<String>? status,
    Expression<String>? partyName,
    Expression<int>? totalAmount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (receiptNumber != null) 'receipt_number': receiptNumber,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (partyName != null) 'party_name': partyName,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReceiptsCompanion copyWith({
    Value<String>? id,
    Value<int>? receiptNumber,
    Value<ReceiptType>? type,
    Value<ReceiptStatus>? status,
    Value<String?>? partyName,
    Value<int>? totalAmount,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return ReceiptsCompanion(
      id: id ?? this.id,
      receiptNumber: receiptNumber ?? this.receiptNumber,
      type: type ?? this.type,
      status: status ?? this.status,
      partyName: partyName ?? this.partyName,
      totalAmount: totalAmount ?? this.totalAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (receiptNumber.present) {
      map['receipt_number'] = Variable<int>(receiptNumber.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $ReceiptsTable.$convertertype.toSql(type.value),
      );
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $ReceiptsTable.$converterstatus.toSql(status.value),
      );
    }
    if (partyName.present) {
      map['party_name'] = Variable<String>(partyName.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<int>(totalAmount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptsCompanion(')
          ..write('id: $id, ')
          ..write('receiptNumber: $receiptNumber, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('partyName: $partyName, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReceiptLinesTable extends ReceiptLines
    with TableInfo<$ReceiptLinesTable, ReceiptLineRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReceiptLinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _receiptIdMeta = const VerificationMeta(
    'receiptId',
  );
  @override
  late final GeneratedColumn<String> receiptId = GeneratedColumn<String>(
    'receipt_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lineNoMeta = const VerificationMeta('lineNo');
  @override
  late final GeneratedColumn<int> lineNo = GeneratedColumn<int>(
    'line_no',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
    'item_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _itemNameMeta = const VerificationMeta(
    'itemName',
  );
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
    'item_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 80,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<WeightUnit, String> unit =
      GeneratedColumn<String>(
        'unit',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<WeightUnit>($ReceiptLinesTable.$converterunit);
  static const VerificationMeta _grossWeightMilliMeta = const VerificationMeta(
    'grossWeightMilli',
  );
  @override
  late final GeneratedColumn<int> grossWeightMilli = GeneratedColumn<int>(
    'gross_weight_milli',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deductionMilliMeta = const VerificationMeta(
    'deductionMilli',
  );
  @override
  late final GeneratedColumn<int> deductionMilli = GeneratedColumn<int>(
    'deduction_milli',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _netWeightMilliMeta = const VerificationMeta(
    'netWeightMilli',
  );
  @override
  late final GeneratedColumn<int> netWeightMilli = GeneratedColumn<int>(
    'net_weight_milli',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isManualMeta = const VerificationMeta(
    'isManual',
  );
  @override
  late final GeneratedColumn<bool> isManual = GeneratedColumn<bool>(
    'is_manual',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_manual" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    receiptId,
    lineNo,
    itemId,
    itemName,
    unit,
    grossWeightMilli,
    deductionMilli,
    netWeightMilli,
    unitPrice,
    amount,
    isManual,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'receipt_lines';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReceiptLineRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('receipt_id')) {
      context.handle(
        _receiptIdMeta,
        receiptId.isAcceptableOrUnknown(data['receipt_id']!, _receiptIdMeta),
      );
    } else if (isInserting) {
      context.missing(_receiptIdMeta);
    }
    if (data.containsKey('line_no')) {
      context.handle(
        _lineNoMeta,
        lineNo.isAcceptableOrUnknown(data['line_no']!, _lineNoMeta),
      );
    } else if (isInserting) {
      context.missing(_lineNoMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    }
    if (data.containsKey('item_name')) {
      context.handle(
        _itemNameMeta,
        itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta),
      );
    } else if (isInserting) {
      context.missing(_itemNameMeta);
    }
    if (data.containsKey('gross_weight_milli')) {
      context.handle(
        _grossWeightMilliMeta,
        grossWeightMilli.isAcceptableOrUnknown(
          data['gross_weight_milli']!,
          _grossWeightMilliMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_grossWeightMilliMeta);
    }
    if (data.containsKey('deduction_milli')) {
      context.handle(
        _deductionMilliMeta,
        deductionMilli.isAcceptableOrUnknown(
          data['deduction_milli']!,
          _deductionMilliMeta,
        ),
      );
    }
    if (data.containsKey('net_weight_milli')) {
      context.handle(
        _netWeightMilliMeta,
        netWeightMilli.isAcceptableOrUnknown(
          data['net_weight_milli']!,
          _netWeightMilliMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_netWeightMilliMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('is_manual')) {
      context.handle(
        _isManualMeta,
        isManual.isAcceptableOrUnknown(data['is_manual']!, _isManualMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReceiptLineRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReceiptLineRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      receiptId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_id'],
      )!,
      lineNo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_no'],
      )!,
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_id'],
      ),
      itemName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_name'],
      )!,
      unit: $ReceiptLinesTable.$converterunit.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}unit'],
        )!,
      ),
      grossWeightMilli: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}gross_weight_milli'],
      )!,
      deductionMilli: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deduction_milli'],
      )!,
      netWeightMilli: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}net_weight_milli'],
      )!,
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      isManual: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_manual'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ReceiptLinesTable createAlias(String alias) {
    return $ReceiptLinesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<WeightUnit, String, String> $converterunit =
      const EnumNameConverter<WeightUnit>(WeightUnit.values);
}

class ReceiptLineRow extends DataClass implements Insertable<ReceiptLineRow> {
  final String id;
  final String receiptId;
  final int lineNo;
  final String? itemId;
  final String itemName;
  final WeightUnit unit;
  final int grossWeightMilli;
  final int deductionMilli;
  final int netWeightMilli;
  final int unitPrice;
  final int amount;
  final bool isManual;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ReceiptLineRow({
    required this.id,
    required this.receiptId,
    required this.lineNo,
    this.itemId,
    required this.itemName,
    required this.unit,
    required this.grossWeightMilli,
    required this.deductionMilli,
    required this.netWeightMilli,
    required this.unitPrice,
    required this.amount,
    required this.isManual,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['receipt_id'] = Variable<String>(receiptId);
    map['line_no'] = Variable<int>(lineNo);
    if (!nullToAbsent || itemId != null) {
      map['item_id'] = Variable<String>(itemId);
    }
    map['item_name'] = Variable<String>(itemName);
    {
      map['unit'] = Variable<String>(
        $ReceiptLinesTable.$converterunit.toSql(unit),
      );
    }
    map['gross_weight_milli'] = Variable<int>(grossWeightMilli);
    map['deduction_milli'] = Variable<int>(deductionMilli);
    map['net_weight_milli'] = Variable<int>(netWeightMilli);
    map['unit_price'] = Variable<int>(unitPrice);
    map['amount'] = Variable<int>(amount);
    map['is_manual'] = Variable<bool>(isManual);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ReceiptLinesCompanion toCompanion(bool nullToAbsent) {
    return ReceiptLinesCompanion(
      id: Value(id),
      receiptId: Value(receiptId),
      lineNo: Value(lineNo),
      itemId: itemId == null && nullToAbsent
          ? const Value.absent()
          : Value(itemId),
      itemName: Value(itemName),
      unit: Value(unit),
      grossWeightMilli: Value(grossWeightMilli),
      deductionMilli: Value(deductionMilli),
      netWeightMilli: Value(netWeightMilli),
      unitPrice: Value(unitPrice),
      amount: Value(amount),
      isManual: Value(isManual),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ReceiptLineRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReceiptLineRow(
      id: serializer.fromJson<String>(json['id']),
      receiptId: serializer.fromJson<String>(json['receiptId']),
      lineNo: serializer.fromJson<int>(json['lineNo']),
      itemId: serializer.fromJson<String?>(json['itemId']),
      itemName: serializer.fromJson<String>(json['itemName']),
      unit: $ReceiptLinesTable.$converterunit.fromJson(
        serializer.fromJson<String>(json['unit']),
      ),
      grossWeightMilli: serializer.fromJson<int>(json['grossWeightMilli']),
      deductionMilli: serializer.fromJson<int>(json['deductionMilli']),
      netWeightMilli: serializer.fromJson<int>(json['netWeightMilli']),
      unitPrice: serializer.fromJson<int>(json['unitPrice']),
      amount: serializer.fromJson<int>(json['amount']),
      isManual: serializer.fromJson<bool>(json['isManual']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'receiptId': serializer.toJson<String>(receiptId),
      'lineNo': serializer.toJson<int>(lineNo),
      'itemId': serializer.toJson<String?>(itemId),
      'itemName': serializer.toJson<String>(itemName),
      'unit': serializer.toJson<String>(
        $ReceiptLinesTable.$converterunit.toJson(unit),
      ),
      'grossWeightMilli': serializer.toJson<int>(grossWeightMilli),
      'deductionMilli': serializer.toJson<int>(deductionMilli),
      'netWeightMilli': serializer.toJson<int>(netWeightMilli),
      'unitPrice': serializer.toJson<int>(unitPrice),
      'amount': serializer.toJson<int>(amount),
      'isManual': serializer.toJson<bool>(isManual),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ReceiptLineRow copyWith({
    String? id,
    String? receiptId,
    int? lineNo,
    Value<String?> itemId = const Value.absent(),
    String? itemName,
    WeightUnit? unit,
    int? grossWeightMilli,
    int? deductionMilli,
    int? netWeightMilli,
    int? unitPrice,
    int? amount,
    bool? isManual,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ReceiptLineRow(
    id: id ?? this.id,
    receiptId: receiptId ?? this.receiptId,
    lineNo: lineNo ?? this.lineNo,
    itemId: itemId.present ? itemId.value : this.itemId,
    itemName: itemName ?? this.itemName,
    unit: unit ?? this.unit,
    grossWeightMilli: grossWeightMilli ?? this.grossWeightMilli,
    deductionMilli: deductionMilli ?? this.deductionMilli,
    netWeightMilli: netWeightMilli ?? this.netWeightMilli,
    unitPrice: unitPrice ?? this.unitPrice,
    amount: amount ?? this.amount,
    isManual: isManual ?? this.isManual,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ReceiptLineRow copyWithCompanion(ReceiptLinesCompanion data) {
    return ReceiptLineRow(
      id: data.id.present ? data.id.value : this.id,
      receiptId: data.receiptId.present ? data.receiptId.value : this.receiptId,
      lineNo: data.lineNo.present ? data.lineNo.value : this.lineNo,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      itemName: data.itemName.present ? data.itemName.value : this.itemName,
      unit: data.unit.present ? data.unit.value : this.unit,
      grossWeightMilli: data.grossWeightMilli.present
          ? data.grossWeightMilli.value
          : this.grossWeightMilli,
      deductionMilli: data.deductionMilli.present
          ? data.deductionMilli.value
          : this.deductionMilli,
      netWeightMilli: data.netWeightMilli.present
          ? data.netWeightMilli.value
          : this.netWeightMilli,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      amount: data.amount.present ? data.amount.value : this.amount,
      isManual: data.isManual.present ? data.isManual.value : this.isManual,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptLineRow(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('lineNo: $lineNo, ')
          ..write('itemId: $itemId, ')
          ..write('itemName: $itemName, ')
          ..write('unit: $unit, ')
          ..write('grossWeightMilli: $grossWeightMilli, ')
          ..write('deductionMilli: $deductionMilli, ')
          ..write('netWeightMilli: $netWeightMilli, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('amount: $amount, ')
          ..write('isManual: $isManual, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    receiptId,
    lineNo,
    itemId,
    itemName,
    unit,
    grossWeightMilli,
    deductionMilli,
    netWeightMilli,
    unitPrice,
    amount,
    isManual,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReceiptLineRow &&
          other.id == this.id &&
          other.receiptId == this.receiptId &&
          other.lineNo == this.lineNo &&
          other.itemId == this.itemId &&
          other.itemName == this.itemName &&
          other.unit == this.unit &&
          other.grossWeightMilli == this.grossWeightMilli &&
          other.deductionMilli == this.deductionMilli &&
          other.netWeightMilli == this.netWeightMilli &&
          other.unitPrice == this.unitPrice &&
          other.amount == this.amount &&
          other.isManual == this.isManual &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ReceiptLinesCompanion extends UpdateCompanion<ReceiptLineRow> {
  final Value<String> id;
  final Value<String> receiptId;
  final Value<int> lineNo;
  final Value<String?> itemId;
  final Value<String> itemName;
  final Value<WeightUnit> unit;
  final Value<int> grossWeightMilli;
  final Value<int> deductionMilli;
  final Value<int> netWeightMilli;
  final Value<int> unitPrice;
  final Value<int> amount;
  final Value<bool> isManual;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ReceiptLinesCompanion({
    this.id = const Value.absent(),
    this.receiptId = const Value.absent(),
    this.lineNo = const Value.absent(),
    this.itemId = const Value.absent(),
    this.itemName = const Value.absent(),
    this.unit = const Value.absent(),
    this.grossWeightMilli = const Value.absent(),
    this.deductionMilli = const Value.absent(),
    this.netWeightMilli = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.amount = const Value.absent(),
    this.isManual = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReceiptLinesCompanion.insert({
    required String id,
    required String receiptId,
    required int lineNo,
    this.itemId = const Value.absent(),
    required String itemName,
    required WeightUnit unit,
    required int grossWeightMilli,
    this.deductionMilli = const Value.absent(),
    required int netWeightMilli,
    required int unitPrice,
    required int amount,
    this.isManual = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       receiptId = Value(receiptId),
       lineNo = Value(lineNo),
       itemName = Value(itemName),
       unit = Value(unit),
       grossWeightMilli = Value(grossWeightMilli),
       netWeightMilli = Value(netWeightMilli),
       unitPrice = Value(unitPrice),
       amount = Value(amount),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ReceiptLineRow> custom({
    Expression<String>? id,
    Expression<String>? receiptId,
    Expression<int>? lineNo,
    Expression<String>? itemId,
    Expression<String>? itemName,
    Expression<String>? unit,
    Expression<int>? grossWeightMilli,
    Expression<int>? deductionMilli,
    Expression<int>? netWeightMilli,
    Expression<int>? unitPrice,
    Expression<int>? amount,
    Expression<bool>? isManual,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (receiptId != null) 'receipt_id': receiptId,
      if (lineNo != null) 'line_no': lineNo,
      if (itemId != null) 'item_id': itemId,
      if (itemName != null) 'item_name': itemName,
      if (unit != null) 'unit': unit,
      if (grossWeightMilli != null) 'gross_weight_milli': grossWeightMilli,
      if (deductionMilli != null) 'deduction_milli': deductionMilli,
      if (netWeightMilli != null) 'net_weight_milli': netWeightMilli,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (amount != null) 'amount': amount,
      if (isManual != null) 'is_manual': isManual,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReceiptLinesCompanion copyWith({
    Value<String>? id,
    Value<String>? receiptId,
    Value<int>? lineNo,
    Value<String?>? itemId,
    Value<String>? itemName,
    Value<WeightUnit>? unit,
    Value<int>? grossWeightMilli,
    Value<int>? deductionMilli,
    Value<int>? netWeightMilli,
    Value<int>? unitPrice,
    Value<int>? amount,
    Value<bool>? isManual,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ReceiptLinesCompanion(
      id: id ?? this.id,
      receiptId: receiptId ?? this.receiptId,
      lineNo: lineNo ?? this.lineNo,
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      unit: unit ?? this.unit,
      grossWeightMilli: grossWeightMilli ?? this.grossWeightMilli,
      deductionMilli: deductionMilli ?? this.deductionMilli,
      netWeightMilli: netWeightMilli ?? this.netWeightMilli,
      unitPrice: unitPrice ?? this.unitPrice,
      amount: amount ?? this.amount,
      isManual: isManual ?? this.isManual,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (receiptId.present) {
      map['receipt_id'] = Variable<String>(receiptId.value);
    }
    if (lineNo.present) {
      map['line_no'] = Variable<int>(lineNo.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (itemName.present) {
      map['item_name'] = Variable<String>(itemName.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(
        $ReceiptLinesTable.$converterunit.toSql(unit.value),
      );
    }
    if (grossWeightMilli.present) {
      map['gross_weight_milli'] = Variable<int>(grossWeightMilli.value);
    }
    if (deductionMilli.present) {
      map['deduction_milli'] = Variable<int>(deductionMilli.value);
    }
    if (netWeightMilli.present) {
      map['net_weight_milli'] = Variable<int>(netWeightMilli.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<int>(unitPrice.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (isManual.present) {
      map['is_manual'] = Variable<bool>(isManual.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptLinesCompanion(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('lineNo: $lineNo, ')
          ..write('itemId: $itemId, ')
          ..write('itemName: $itemName, ')
          ..write('unit: $unit, ')
          ..write('grossWeightMilli: $grossWeightMilli, ')
          ..write('deductionMilli: $deductionMilli, ')
          ..write('netWeightMilli: $netWeightMilli, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('amount: $amount, ')
          ..write('isManual: $isManual, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DeductionPresetsTable extends DeductionPresets
    with TableInfo<$DeductionPresetsTable, DeductionPresetRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeductionPresetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 40,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMilliMeta = const VerificationMeta(
    'weightMilli',
  );
  @override
  late final GeneratedColumn<int> weightMilli = GeneratedColumn<int>(
    'weight_milli',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _systemKeyMeta = const VerificationMeta(
    'systemKey',
  );
  @override
  late final GeneratedColumn<String> systemKey = GeneratedColumn<String>(
    'system_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(100),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    weightMilli,
    systemKey,
    sortOrder,
    createdAt,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'deduction_presets';
  @override
  VerificationContext validateIntegrity(
    Insertable<DeductionPresetRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('weight_milli')) {
      context.handle(
        _weightMilliMeta,
        weightMilli.isAcceptableOrUnknown(
          data['weight_milli']!,
          _weightMilliMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weightMilliMeta);
    }
    if (data.containsKey('system_key')) {
      context.handle(
        _systemKeyMeta,
        systemKey.isAcceptableOrUnknown(data['system_key']!, _systemKeyMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeductionPresetRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeductionPresetRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      weightMilli: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weight_milli'],
      )!,
      systemKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}system_key'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $DeductionPresetsTable createAlias(String alias) {
    return $DeductionPresetsTable(attachedDatabase, alias);
  }
}

class DeductionPresetRow extends DataClass
    implements Insertable<DeductionPresetRow> {
  final String id;
  final String name;
  final int weightMilli;
  final String? systemKey;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const DeductionPresetRow({
    required this.id,
    required this.name,
    required this.weightMilli,
    this.systemKey,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['weight_milli'] = Variable<int>(weightMilli);
    if (!nullToAbsent || systemKey != null) {
      map['system_key'] = Variable<String>(systemKey);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  DeductionPresetsCompanion toCompanion(bool nullToAbsent) {
    return DeductionPresetsCompanion(
      id: Value(id),
      name: Value(name),
      weightMilli: Value(weightMilli),
      systemKey: systemKey == null && nullToAbsent
          ? const Value.absent()
          : Value(systemKey),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory DeductionPresetRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeductionPresetRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      weightMilli: serializer.fromJson<int>(json['weightMilli']),
      systemKey: serializer.fromJson<String?>(json['systemKey']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'weightMilli': serializer.toJson<int>(weightMilli),
      'systemKey': serializer.toJson<String?>(systemKey),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  DeductionPresetRow copyWith({
    String? id,
    String? name,
    int? weightMilli,
    Value<String?> systemKey = const Value.absent(),
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => DeductionPresetRow(
    id: id ?? this.id,
    name: name ?? this.name,
    weightMilli: weightMilli ?? this.weightMilli,
    systemKey: systemKey.present ? systemKey.value : this.systemKey,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  DeductionPresetRow copyWithCompanion(DeductionPresetsCompanion data) {
    return DeductionPresetRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      weightMilli: data.weightMilli.present
          ? data.weightMilli.value
          : this.weightMilli,
      systemKey: data.systemKey.present ? data.systemKey.value : this.systemKey,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeductionPresetRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weightMilli: $weightMilli, ')
          ..write('systemKey: $systemKey, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    weightMilli,
    systemKey,
    sortOrder,
    createdAt,
    updatedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeductionPresetRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.weightMilli == this.weightMilli &&
          other.systemKey == this.systemKey &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class DeductionPresetsCompanion extends UpdateCompanion<DeductionPresetRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> weightMilli;
  final Value<String?> systemKey;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const DeductionPresetsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.weightMilli = const Value.absent(),
    this.systemKey = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DeductionPresetsCompanion.insert({
    required String id,
    required String name,
    required int weightMilli,
    this.systemKey = const Value.absent(),
    this.sortOrder = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       weightMilli = Value(weightMilli),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DeductionPresetRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? weightMilli,
    Expression<String>? systemKey,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (weightMilli != null) 'weight_milli': weightMilli,
      if (systemKey != null) 'system_key': systemKey,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DeductionPresetsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? weightMilli,
    Value<String?>? systemKey,
    Value<int>? sortOrder,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return DeductionPresetsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      weightMilli: weightMilli ?? this.weightMilli,
      systemKey: systemKey ?? this.systemKey,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (weightMilli.present) {
      map['weight_milli'] = Variable<int>(weightMilli.value);
    }
    if (systemKey.present) {
      map['system_key'] = Variable<String>(systemKey.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeductionPresetsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weightMilli: $weightMilli, ')
          ..write('systemKey: $systemKey, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final $ReceiptsTable receipts = $ReceiptsTable(this);
  late final $ReceiptLinesTable receiptLines = $ReceiptLinesTable(this);
  late final $DeductionPresetsTable deductionPresets = $DeductionPresetsTable(
    this,
  );
  late final Index categoriesNameIdx = Index(
    'categories_name_idx',
    'CREATE INDEX categories_name_idx ON categories (name)',
  );
  late final Index itemsNameIdx = Index(
    'items_name_idx',
    'CREATE INDEX items_name_idx ON items (name)',
  );
  late final Index receiptLinesReceiptIdx = Index(
    'receipt_lines_receipt_idx',
    'CREATE INDEX receipt_lines_receipt_idx ON receipt_lines (receipt_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categories,
    items,
    receipts,
    receiptLines,
    deductionPresets,
    categoriesNameIdx,
    itemsNameIdx,
    receiptLinesReceiptIdx,
  ];
}

typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      required String id,
      required String name,
      Value<String?> systemKey,
      Value<int> sortOrder,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> systemKey,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get systemKey => $composableBuilder(
    column: $table.systemKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get systemKey => $composableBuilder(
    column: $table.systemKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get systemKey =>
      $composableBuilder(column: $table.systemKey, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          CategoryRow,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (
            CategoryRow,
            BaseReferences<_$AppDatabase, $CategoriesTable, CategoryRow>,
          ),
          CategoryRow,
          PrefetchHooks Function()
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> systemKey = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                name: name,
                systemKey: systemKey,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> systemKey = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                name: name,
                systemKey: systemKey,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      CategoryRow,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (
        CategoryRow,
        BaseReferences<_$AppDatabase, $CategoriesTable, CategoryRow>,
      ),
      CategoryRow,
      PrefetchHooks Function()
    >;
typedef $$ItemsTableCreateCompanionBuilder =
    ItemsCompanion Function({
      required String id,
      required String name,
      Value<String?> shortCode,
      Value<String?> categoryId,
      required WeightUnit unit,
      Value<int> buyPrice,
      Value<int> sellPrice,
      Value<int?> targetWeightMilli,
      Value<int> toleranceMilli,
      Value<bool> showWeightCheck,
      Value<bool> autoCaptureWhenOk,
      Value<int> defaultDeductionMilli,
      Value<bool> isActive,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$ItemsTableUpdateCompanionBuilder =
    ItemsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> shortCode,
      Value<String?> categoryId,
      Value<WeightUnit> unit,
      Value<int> buyPrice,
      Value<int> sellPrice,
      Value<int?> targetWeightMilli,
      Value<int> toleranceMilli,
      Value<bool> showWeightCheck,
      Value<bool> autoCaptureWhenOk,
      Value<int> defaultDeductionMilli,
      Value<bool> isActive,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

class $$ItemsTableFilterComposer extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortCode => $composableBuilder(
    column: $table.shortCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<WeightUnit, WeightUnit, String> get unit =>
      $composableBuilder(
        column: $table.unit,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get buyPrice => $composableBuilder(
    column: $table.buyPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sellPrice => $composableBuilder(
    column: $table.sellPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetWeightMilli => $composableBuilder(
    column: $table.targetWeightMilli,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get toleranceMilli => $composableBuilder(
    column: $table.toleranceMilli,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get showWeightCheck => $composableBuilder(
    column: $table.showWeightCheck,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get autoCaptureWhenOk => $composableBuilder(
    column: $table.autoCaptureWhenOk,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultDeductionMilli => $composableBuilder(
    column: $table.defaultDeductionMilli,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortCode => $composableBuilder(
    column: $table.shortCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get buyPrice => $composableBuilder(
    column: $table.buyPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sellPrice => $composableBuilder(
    column: $table.sellPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetWeightMilli => $composableBuilder(
    column: $table.targetWeightMilli,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get toleranceMilli => $composableBuilder(
    column: $table.toleranceMilli,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get showWeightCheck => $composableBuilder(
    column: $table.showWeightCheck,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get autoCaptureWhenOk => $composableBuilder(
    column: $table.autoCaptureWhenOk,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultDeductionMilli => $composableBuilder(
    column: $table.defaultDeductionMilli,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get shortCode =>
      $composableBuilder(column: $table.shortCode, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<WeightUnit, String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get buyPrice =>
      $composableBuilder(column: $table.buyPrice, builder: (column) => column);

  GeneratedColumn<int> get sellPrice =>
      $composableBuilder(column: $table.sellPrice, builder: (column) => column);

  GeneratedColumn<int> get targetWeightMilli => $composableBuilder(
    column: $table.targetWeightMilli,
    builder: (column) => column,
  );

  GeneratedColumn<int> get toleranceMilli => $composableBuilder(
    column: $table.toleranceMilli,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get showWeightCheck => $composableBuilder(
    column: $table.showWeightCheck,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get autoCaptureWhenOk => $composableBuilder(
    column: $table.autoCaptureWhenOk,
    builder: (column) => column,
  );

  GeneratedColumn<int> get defaultDeductionMilli => $composableBuilder(
    column: $table.defaultDeductionMilli,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$ItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItemsTable,
          ItemRow,
          $$ItemsTableFilterComposer,
          $$ItemsTableOrderingComposer,
          $$ItemsTableAnnotationComposer,
          $$ItemsTableCreateCompanionBuilder,
          $$ItemsTableUpdateCompanionBuilder,
          (ItemRow, BaseReferences<_$AppDatabase, $ItemsTable, ItemRow>),
          ItemRow,
          PrefetchHooks Function()
        > {
  $$ItemsTableTableManager(_$AppDatabase db, $ItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> shortCode = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<WeightUnit> unit = const Value.absent(),
                Value<int> buyPrice = const Value.absent(),
                Value<int> sellPrice = const Value.absent(),
                Value<int?> targetWeightMilli = const Value.absent(),
                Value<int> toleranceMilli = const Value.absent(),
                Value<bool> showWeightCheck = const Value.absent(),
                Value<bool> autoCaptureWhenOk = const Value.absent(),
                Value<int> defaultDeductionMilli = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItemsCompanion(
                id: id,
                name: name,
                shortCode: shortCode,
                categoryId: categoryId,
                unit: unit,
                buyPrice: buyPrice,
                sellPrice: sellPrice,
                targetWeightMilli: targetWeightMilli,
                toleranceMilli: toleranceMilli,
                showWeightCheck: showWeightCheck,
                autoCaptureWhenOk: autoCaptureWhenOk,
                defaultDeductionMilli: defaultDeductionMilli,
                isActive: isActive,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> shortCode = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                required WeightUnit unit,
                Value<int> buyPrice = const Value.absent(),
                Value<int> sellPrice = const Value.absent(),
                Value<int?> targetWeightMilli = const Value.absent(),
                Value<int> toleranceMilli = const Value.absent(),
                Value<bool> showWeightCheck = const Value.absent(),
                Value<bool> autoCaptureWhenOk = const Value.absent(),
                Value<int> defaultDeductionMilli = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItemsCompanion.insert(
                id: id,
                name: name,
                shortCode: shortCode,
                categoryId: categoryId,
                unit: unit,
                buyPrice: buyPrice,
                sellPrice: sellPrice,
                targetWeightMilli: targetWeightMilli,
                toleranceMilli: toleranceMilli,
                showWeightCheck: showWeightCheck,
                autoCaptureWhenOk: autoCaptureWhenOk,
                defaultDeductionMilli: defaultDeductionMilli,
                isActive: isActive,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItemsTable,
      ItemRow,
      $$ItemsTableFilterComposer,
      $$ItemsTableOrderingComposer,
      $$ItemsTableAnnotationComposer,
      $$ItemsTableCreateCompanionBuilder,
      $$ItemsTableUpdateCompanionBuilder,
      (ItemRow, BaseReferences<_$AppDatabase, $ItemsTable, ItemRow>),
      ItemRow,
      PrefetchHooks Function()
    >;
typedef $$ReceiptsTableCreateCompanionBuilder =
    ReceiptsCompanion Function({
      required String id,
      required int receiptNumber,
      required ReceiptType type,
      required ReceiptStatus status,
      Value<String?> partyName,
      Value<int> totalAmount,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });
typedef $$ReceiptsTableUpdateCompanionBuilder =
    ReceiptsCompanion Function({
      Value<String> id,
      Value<int> receiptNumber,
      Value<ReceiptType> type,
      Value<ReceiptStatus> status,
      Value<String?> partyName,
      Value<int> totalAmount,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });

class $$ReceiptsTableFilterComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get receiptNumber => $composableBuilder(
    column: $table.receiptNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ReceiptType, ReceiptType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<ReceiptStatus, ReceiptStatus, String>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get partyName => $composableBuilder(
    column: $table.partyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReceiptsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get receiptNumber => $composableBuilder(
    column: $table.receiptNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partyName => $composableBuilder(
    column: $table.partyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReceiptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get receiptNumber => $composableBuilder(
    column: $table.receiptNumber,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ReceiptType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ReceiptStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get partyName =>
      $composableBuilder(column: $table.partyName, builder: (column) => column);

  GeneratedColumn<int> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$ReceiptsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReceiptsTable,
          ReceiptRow,
          $$ReceiptsTableFilterComposer,
          $$ReceiptsTableOrderingComposer,
          $$ReceiptsTableAnnotationComposer,
          $$ReceiptsTableCreateCompanionBuilder,
          $$ReceiptsTableUpdateCompanionBuilder,
          (
            ReceiptRow,
            BaseReferences<_$AppDatabase, $ReceiptsTable, ReceiptRow>,
          ),
          ReceiptRow,
          PrefetchHooks Function()
        > {
  $$ReceiptsTableTableManager(_$AppDatabase db, $ReceiptsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReceiptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReceiptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReceiptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> receiptNumber = const Value.absent(),
                Value<ReceiptType> type = const Value.absent(),
                Value<ReceiptStatus> status = const Value.absent(),
                Value<String?> partyName = const Value.absent(),
                Value<int> totalAmount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReceiptsCompanion(
                id: id,
                receiptNumber: receiptNumber,
                type: type,
                status: status,
                partyName: partyName,
                totalAmount: totalAmount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int receiptNumber,
                required ReceiptType type,
                required ReceiptStatus status,
                Value<String?> partyName = const Value.absent(),
                Value<int> totalAmount = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReceiptsCompanion.insert(
                id: id,
                receiptNumber: receiptNumber,
                type: type,
                status: status,
                partyName: partyName,
                totalAmount: totalAmount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReceiptsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReceiptsTable,
      ReceiptRow,
      $$ReceiptsTableFilterComposer,
      $$ReceiptsTableOrderingComposer,
      $$ReceiptsTableAnnotationComposer,
      $$ReceiptsTableCreateCompanionBuilder,
      $$ReceiptsTableUpdateCompanionBuilder,
      (ReceiptRow, BaseReferences<_$AppDatabase, $ReceiptsTable, ReceiptRow>),
      ReceiptRow,
      PrefetchHooks Function()
    >;
typedef $$ReceiptLinesTableCreateCompanionBuilder =
    ReceiptLinesCompanion Function({
      required String id,
      required String receiptId,
      required int lineNo,
      Value<String?> itemId,
      required String itemName,
      required WeightUnit unit,
      required int grossWeightMilli,
      Value<int> deductionMilli,
      required int netWeightMilli,
      required int unitPrice,
      required int amount,
      Value<bool> isManual,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ReceiptLinesTableUpdateCompanionBuilder =
    ReceiptLinesCompanion Function({
      Value<String> id,
      Value<String> receiptId,
      Value<int> lineNo,
      Value<String?> itemId,
      Value<String> itemName,
      Value<WeightUnit> unit,
      Value<int> grossWeightMilli,
      Value<int> deductionMilli,
      Value<int> netWeightMilli,
      Value<int> unitPrice,
      Value<int> amount,
      Value<bool> isManual,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$ReceiptLinesTableFilterComposer
    extends Composer<_$AppDatabase, $ReceiptLinesTable> {
  $$ReceiptLinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receiptId => $composableBuilder(
    column: $table.receiptId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lineNo => $composableBuilder(
    column: $table.lineNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemName => $composableBuilder(
    column: $table.itemName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<WeightUnit, WeightUnit, String> get unit =>
      $composableBuilder(
        column: $table.unit,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get grossWeightMilli => $composableBuilder(
    column: $table.grossWeightMilli,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deductionMilli => $composableBuilder(
    column: $table.deductionMilli,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get netWeightMilli => $composableBuilder(
    column: $table.netWeightMilli,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isManual => $composableBuilder(
    column: $table.isManual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReceiptLinesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReceiptLinesTable> {
  $$ReceiptLinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receiptId => $composableBuilder(
    column: $table.receiptId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lineNo => $composableBuilder(
    column: $table.lineNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemName => $composableBuilder(
    column: $table.itemName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get grossWeightMilli => $composableBuilder(
    column: $table.grossWeightMilli,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deductionMilli => $composableBuilder(
    column: $table.deductionMilli,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get netWeightMilli => $composableBuilder(
    column: $table.netWeightMilli,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isManual => $composableBuilder(
    column: $table.isManual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReceiptLinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReceiptLinesTable> {
  $$ReceiptLinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get receiptId =>
      $composableBuilder(column: $table.receiptId, builder: (column) => column);

  GeneratedColumn<int> get lineNo =>
      $composableBuilder(column: $table.lineNo, builder: (column) => column);

  GeneratedColumn<String> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<String> get itemName =>
      $composableBuilder(column: $table.itemName, builder: (column) => column);

  GeneratedColumnWithTypeConverter<WeightUnit, String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get grossWeightMilli => $composableBuilder(
    column: $table.grossWeightMilli,
    builder: (column) => column,
  );

  GeneratedColumn<int> get deductionMilli => $composableBuilder(
    column: $table.deductionMilli,
    builder: (column) => column,
  );

  GeneratedColumn<int> get netWeightMilli => $composableBuilder(
    column: $table.netWeightMilli,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<bool> get isManual =>
      $composableBuilder(column: $table.isManual, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ReceiptLinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReceiptLinesTable,
          ReceiptLineRow,
          $$ReceiptLinesTableFilterComposer,
          $$ReceiptLinesTableOrderingComposer,
          $$ReceiptLinesTableAnnotationComposer,
          $$ReceiptLinesTableCreateCompanionBuilder,
          $$ReceiptLinesTableUpdateCompanionBuilder,
          (
            ReceiptLineRow,
            BaseReferences<_$AppDatabase, $ReceiptLinesTable, ReceiptLineRow>,
          ),
          ReceiptLineRow,
          PrefetchHooks Function()
        > {
  $$ReceiptLinesTableTableManager(_$AppDatabase db, $ReceiptLinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReceiptLinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReceiptLinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReceiptLinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> receiptId = const Value.absent(),
                Value<int> lineNo = const Value.absent(),
                Value<String?> itemId = const Value.absent(),
                Value<String> itemName = const Value.absent(),
                Value<WeightUnit> unit = const Value.absent(),
                Value<int> grossWeightMilli = const Value.absent(),
                Value<int> deductionMilli = const Value.absent(),
                Value<int> netWeightMilli = const Value.absent(),
                Value<int> unitPrice = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<bool> isManual = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReceiptLinesCompanion(
                id: id,
                receiptId: receiptId,
                lineNo: lineNo,
                itemId: itemId,
                itemName: itemName,
                unit: unit,
                grossWeightMilli: grossWeightMilli,
                deductionMilli: deductionMilli,
                netWeightMilli: netWeightMilli,
                unitPrice: unitPrice,
                amount: amount,
                isManual: isManual,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String receiptId,
                required int lineNo,
                Value<String?> itemId = const Value.absent(),
                required String itemName,
                required WeightUnit unit,
                required int grossWeightMilli,
                Value<int> deductionMilli = const Value.absent(),
                required int netWeightMilli,
                required int unitPrice,
                required int amount,
                Value<bool> isManual = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ReceiptLinesCompanion.insert(
                id: id,
                receiptId: receiptId,
                lineNo: lineNo,
                itemId: itemId,
                itemName: itemName,
                unit: unit,
                grossWeightMilli: grossWeightMilli,
                deductionMilli: deductionMilli,
                netWeightMilli: netWeightMilli,
                unitPrice: unitPrice,
                amount: amount,
                isManual: isManual,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReceiptLinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReceiptLinesTable,
      ReceiptLineRow,
      $$ReceiptLinesTableFilterComposer,
      $$ReceiptLinesTableOrderingComposer,
      $$ReceiptLinesTableAnnotationComposer,
      $$ReceiptLinesTableCreateCompanionBuilder,
      $$ReceiptLinesTableUpdateCompanionBuilder,
      (
        ReceiptLineRow,
        BaseReferences<_$AppDatabase, $ReceiptLinesTable, ReceiptLineRow>,
      ),
      ReceiptLineRow,
      PrefetchHooks Function()
    >;
typedef $$DeductionPresetsTableCreateCompanionBuilder =
    DeductionPresetsCompanion Function({
      required String id,
      required String name,
      required int weightMilli,
      Value<String?> systemKey,
      Value<int> sortOrder,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$DeductionPresetsTableUpdateCompanionBuilder =
    DeductionPresetsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> weightMilli,
      Value<String?> systemKey,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

class $$DeductionPresetsTableFilterComposer
    extends Composer<_$AppDatabase, $DeductionPresetsTable> {
  $$DeductionPresetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weightMilli => $composableBuilder(
    column: $table.weightMilli,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get systemKey => $composableBuilder(
    column: $table.systemKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DeductionPresetsTableOrderingComposer
    extends Composer<_$AppDatabase, $DeductionPresetsTable> {
  $$DeductionPresetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weightMilli => $composableBuilder(
    column: $table.weightMilli,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get systemKey => $composableBuilder(
    column: $table.systemKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DeductionPresetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DeductionPresetsTable> {
  $$DeductionPresetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get weightMilli => $composableBuilder(
    column: $table.weightMilli,
    builder: (column) => column,
  );

  GeneratedColumn<String> get systemKey =>
      $composableBuilder(column: $table.systemKey, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$DeductionPresetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DeductionPresetsTable,
          DeductionPresetRow,
          $$DeductionPresetsTableFilterComposer,
          $$DeductionPresetsTableOrderingComposer,
          $$DeductionPresetsTableAnnotationComposer,
          $$DeductionPresetsTableCreateCompanionBuilder,
          $$DeductionPresetsTableUpdateCompanionBuilder,
          (
            DeductionPresetRow,
            BaseReferences<
              _$AppDatabase,
              $DeductionPresetsTable,
              DeductionPresetRow
            >,
          ),
          DeductionPresetRow,
          PrefetchHooks Function()
        > {
  $$DeductionPresetsTableTableManager(
    _$AppDatabase db,
    $DeductionPresetsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DeductionPresetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DeductionPresetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DeductionPresetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> weightMilli = const Value.absent(),
                Value<String?> systemKey = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DeductionPresetsCompanion(
                id: id,
                name: name,
                weightMilli: weightMilli,
                systemKey: systemKey,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int weightMilli,
                Value<String?> systemKey = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DeductionPresetsCompanion.insert(
                id: id,
                name: name,
                weightMilli: weightMilli,
                systemKey: systemKey,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DeductionPresetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DeductionPresetsTable,
      DeductionPresetRow,
      $$DeductionPresetsTableFilterComposer,
      $$DeductionPresetsTableOrderingComposer,
      $$DeductionPresetsTableAnnotationComposer,
      $$DeductionPresetsTableCreateCompanionBuilder,
      $$DeductionPresetsTableUpdateCompanionBuilder,
      (
        DeductionPresetRow,
        BaseReferences<
          _$AppDatabase,
          $DeductionPresetsTable,
          DeductionPresetRow
        >,
      ),
      DeductionPresetRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db, _db.items);
  $$ReceiptsTableTableManager get receipts =>
      $$ReceiptsTableTableManager(_db, _db.receipts);
  $$ReceiptLinesTableTableManager get receiptLines =>
      $$ReceiptLinesTableTableManager(_db, _db.receiptLines);
  $$DeductionPresetsTableTableManager get deductionPresets =>
      $$DeductionPresetsTableTableManager(_db, _db.deductionPresets);
}
