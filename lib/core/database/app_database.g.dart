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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final Index categoriesNameIdx = Index(
    'categories_name_idx',
    'CREATE INDEX categories_name_idx ON categories (name)',
  );
  late final Index itemsNameIdx = Index(
    'items_name_idx',
    'CREATE INDEX items_name_idx ON items (name)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categories,
    items,
    categoriesNameIdx,
    itemsNameIdx,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db, _db.items);
}
