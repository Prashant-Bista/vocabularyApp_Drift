// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $VocabularyCategoryTable extends VocabularyCategory
    with TableInfo<$VocabularyCategoryTable, VocabularyCategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VocabularyCategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, category, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocabulary_category';
  @override
  VerificationContext validateIntegrity(
    Insertable<VocabularyCategoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabularyCategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabularyCategoryData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      category:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}category'],
          )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $VocabularyCategoryTable createAlias(String alias) {
    return $VocabularyCategoryTable(attachedDatabase, alias);
  }
}

class VocabularyCategoryData extends DataClass
    implements Insertable<VocabularyCategoryData> {
  final int id;
  final String category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const VocabularyCategoryData({
    required this.id,
    required this.category,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  VocabularyCategoryCompanion toCompanion(bool nullToAbsent) {
    return VocabularyCategoryCompanion(
      id: Value(id),
      category: Value(category),
      createdAt:
          createdAt == null && nullToAbsent
              ? const Value.absent()
              : Value(createdAt),
      updatedAt:
          updatedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(updatedAt),
    );
  }

  factory VocabularyCategoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabularyCategoryData(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<String>(category),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  VocabularyCategoryData copyWith({
    int? id,
    String? category,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => VocabularyCategoryData(
    id: id ?? this.id,
    category: category ?? this.category,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  VocabularyCategoryData copyWithCompanion(VocabularyCategoryCompanion data) {
    return VocabularyCategoryData(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VocabularyCategoryData(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, category, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VocabularyCategoryData &&
          other.id == this.id &&
          other.category == this.category &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VocabularyCategoryCompanion
    extends UpdateCompanion<VocabularyCategoryData> {
  final Value<int> id;
  final Value<String> category;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const VocabularyCategoryCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VocabularyCategoryCompanion.insert({
    this.id = const Value.absent(),
    required String category,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : category = Value(category);
  static Insertable<VocabularyCategoryData> custom({
    Expression<int>? id,
    Expression<String>? category,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VocabularyCategoryCompanion copyWith({
    Value<int>? id,
    Value<String>? category,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return VocabularyCategoryCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabularyCategoryCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $VocabularyTableTable extends VocabularyTable
    with TableInfo<$VocabularyTableTable, VocabularyTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VocabularyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
    'word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _definitionMeta = const VerificationMeta(
    'definition',
  );
  @override
  late final GeneratedColumn<String> definition = GeneratedColumn<String>(
    'definition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exampleSentenceMeta = const VerificationMeta(
    'exampleSentence',
  );
  @override
  late final GeneratedColumn<String> exampleSentence = GeneratedColumn<String>(
    'example_sentence',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _masteredMeta = const VerificationMeta(
    'mastered',
  );
  @override
  late final GeneratedColumn<bool> mastered = GeneratedColumn<bool>(
    'mastered',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("mastered" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vocabulary_category (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    word,
    definition,
    exampleSentence,
    mastered,
    categoryId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocabulary_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<VocabularyTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
        _wordMeta,
        word.isAcceptableOrUnknown(data['word']!, _wordMeta),
      );
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('definition')) {
      context.handle(
        _definitionMeta,
        definition.isAcceptableOrUnknown(data['definition']!, _definitionMeta),
      );
    } else if (isInserting) {
      context.missing(_definitionMeta);
    }
    if (data.containsKey('example_sentence')) {
      context.handle(
        _exampleSentenceMeta,
        exampleSentence.isAcceptableOrUnknown(
          data['example_sentence']!,
          _exampleSentenceMeta,
        ),
      );
    }
    if (data.containsKey('mastered')) {
      context.handle(
        _masteredMeta,
        mastered.isAcceptableOrUnknown(data['mastered']!, _masteredMeta),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabularyTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabularyTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      word:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}word'],
          )!,
      definition:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}definition'],
          )!,
      exampleSentence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}example_sentence'],
      ),
      mastered:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}mastered'],
          )!,
      categoryId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}category_id'],
          )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $VocabularyTableTable createAlias(String alias) {
    return $VocabularyTableTable(attachedDatabase, alias);
  }
}

class VocabularyTableData extends DataClass
    implements Insertable<VocabularyTableData> {
  final int id;
  final String word;
  final String definition;
  final String? exampleSentence;
  final bool mastered;
  final int categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const VocabularyTableData({
    required this.id,
    required this.word,
    required this.definition,
    this.exampleSentence,
    required this.mastered,
    required this.categoryId,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['definition'] = Variable<String>(definition);
    if (!nullToAbsent || exampleSentence != null) {
      map['example_sentence'] = Variable<String>(exampleSentence);
    }
    map['mastered'] = Variable<bool>(mastered);
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  VocabularyTableCompanion toCompanion(bool nullToAbsent) {
    return VocabularyTableCompanion(
      id: Value(id),
      word: Value(word),
      definition: Value(definition),
      exampleSentence:
          exampleSentence == null && nullToAbsent
              ? const Value.absent()
              : Value(exampleSentence),
      mastered: Value(mastered),
      categoryId: Value(categoryId),
      createdAt:
          createdAt == null && nullToAbsent
              ? const Value.absent()
              : Value(createdAt),
      updatedAt:
          updatedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(updatedAt),
    );
  }

  factory VocabularyTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabularyTableData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      definition: serializer.fromJson<String>(json['definition']),
      exampleSentence: serializer.fromJson<String?>(json['exampleSentence']),
      mastered: serializer.fromJson<bool>(json['mastered']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'definition': serializer.toJson<String>(definition),
      'exampleSentence': serializer.toJson<String?>(exampleSentence),
      'mastered': serializer.toJson<bool>(mastered),
      'categoryId': serializer.toJson<int>(categoryId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  VocabularyTableData copyWith({
    int? id,
    String? word,
    String? definition,
    Value<String?> exampleSentence = const Value.absent(),
    bool? mastered,
    int? categoryId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => VocabularyTableData(
    id: id ?? this.id,
    word: word ?? this.word,
    definition: definition ?? this.definition,
    exampleSentence:
        exampleSentence.present ? exampleSentence.value : this.exampleSentence,
    mastered: mastered ?? this.mastered,
    categoryId: categoryId ?? this.categoryId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  VocabularyTableData copyWithCompanion(VocabularyTableCompanion data) {
    return VocabularyTableData(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      definition:
          data.definition.present ? data.definition.value : this.definition,
      exampleSentence:
          data.exampleSentence.present
              ? data.exampleSentence.value
              : this.exampleSentence,
      mastered: data.mastered.present ? data.mastered.value : this.mastered,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VocabularyTableData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('definition: $definition, ')
          ..write('exampleSentence: $exampleSentence, ')
          ..write('mastered: $mastered, ')
          ..write('categoryId: $categoryId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    word,
    definition,
    exampleSentence,
    mastered,
    categoryId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VocabularyTableData &&
          other.id == this.id &&
          other.word == this.word &&
          other.definition == this.definition &&
          other.exampleSentence == this.exampleSentence &&
          other.mastered == this.mastered &&
          other.categoryId == this.categoryId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VocabularyTableCompanion extends UpdateCompanion<VocabularyTableData> {
  final Value<int> id;
  final Value<String> word;
  final Value<String> definition;
  final Value<String?> exampleSentence;
  final Value<bool> mastered;
  final Value<int> categoryId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const VocabularyTableCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.definition = const Value.absent(),
    this.exampleSentence = const Value.absent(),
    this.mastered = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VocabularyTableCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    required String definition,
    this.exampleSentence = const Value.absent(),
    this.mastered = const Value.absent(),
    required int categoryId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : word = Value(word),
       definition = Value(definition),
       categoryId = Value(categoryId);
  static Insertable<VocabularyTableData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? definition,
    Expression<String>? exampleSentence,
    Expression<bool>? mastered,
    Expression<int>? categoryId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (definition != null) 'definition': definition,
      if (exampleSentence != null) 'example_sentence': exampleSentence,
      if (mastered != null) 'mastered': mastered,
      if (categoryId != null) 'category_id': categoryId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VocabularyTableCompanion copyWith({
    Value<int>? id,
    Value<String>? word,
    Value<String>? definition,
    Value<String?>? exampleSentence,
    Value<bool>? mastered,
    Value<int>? categoryId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return VocabularyTableCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      definition: definition ?? this.definition,
      exampleSentence: exampleSentence ?? this.exampleSentence,
      mastered: mastered ?? this.mastered,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (definition.present) {
      map['definition'] = Variable<String>(definition.value);
    }
    if (exampleSentence.present) {
      map['example_sentence'] = Variable<String>(exampleSentence.value);
    }
    if (mastered.present) {
      map['mastered'] = Variable<bool>(mastered.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabularyTableCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('definition: $definition, ')
          ..write('exampleSentence: $exampleSentence, ')
          ..write('mastered: $mastered, ')
          ..write('categoryId: $categoryId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $VocabularyCategoryTable vocabularyCategory =
      $VocabularyCategoryTable(this);
  late final $VocabularyTableTable vocabularyTable = $VocabularyTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    vocabularyCategory,
    vocabularyTable,
  ];
}

typedef $$VocabularyCategoryTableCreateCompanionBuilder =
    VocabularyCategoryCompanion Function({
      Value<int> id,
      required String category,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$VocabularyCategoryTableUpdateCompanionBuilder =
    VocabularyCategoryCompanion Function({
      Value<int> id,
      Value<String> category,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$VocabularyCategoryTableReferences
    extends
        BaseReferences<
          _$AppDb,
          $VocabularyCategoryTable,
          VocabularyCategoryData
        > {
  $$VocabularyCategoryTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$VocabularyTableTable, List<VocabularyTableData>>
  _vocabularyTableRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.vocabularyTable,
    aliasName: $_aliasNameGenerator(
      db.vocabularyCategory.id,
      db.vocabularyTable.categoryId,
    ),
  );

  $$VocabularyTableTableProcessedTableManager get vocabularyTableRefs {
    final manager = $$VocabularyTableTableTableManager(
      $_db,
      $_db.vocabularyTable,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _vocabularyTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VocabularyCategoryTableFilterComposer
    extends Composer<_$AppDb, $VocabularyCategoryTable> {
  $$VocabularyCategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
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

  Expression<bool> vocabularyTableRefs(
    Expression<bool> Function($$VocabularyTableTableFilterComposer f) f,
  ) {
    final $$VocabularyTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vocabularyTable,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VocabularyTableTableFilterComposer(
            $db: $db,
            $table: $db.vocabularyTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VocabularyCategoryTableOrderingComposer
    extends Composer<_$AppDb, $VocabularyCategoryTable> {
  $$VocabularyCategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
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

class $$VocabularyCategoryTableAnnotationComposer
    extends Composer<_$AppDb, $VocabularyCategoryTable> {
  $$VocabularyCategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> vocabularyTableRefs<T extends Object>(
    Expression<T> Function($$VocabularyTableTableAnnotationComposer a) f,
  ) {
    final $$VocabularyTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vocabularyTable,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VocabularyTableTableAnnotationComposer(
            $db: $db,
            $table: $db.vocabularyTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VocabularyCategoryTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $VocabularyCategoryTable,
          VocabularyCategoryData,
          $$VocabularyCategoryTableFilterComposer,
          $$VocabularyCategoryTableOrderingComposer,
          $$VocabularyCategoryTableAnnotationComposer,
          $$VocabularyCategoryTableCreateCompanionBuilder,
          $$VocabularyCategoryTableUpdateCompanionBuilder,
          (VocabularyCategoryData, $$VocabularyCategoryTableReferences),
          VocabularyCategoryData,
          PrefetchHooks Function({bool vocabularyTableRefs})
        > {
  $$VocabularyCategoryTableTableManager(
    _$AppDb db,
    $VocabularyCategoryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$VocabularyCategoryTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$VocabularyCategoryTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$VocabularyCategoryTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => VocabularyCategoryCompanion(
                id: id,
                category: category,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String category,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => VocabularyCategoryCompanion.insert(
                id: id,
                category: category,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$VocabularyCategoryTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({vocabularyTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (vocabularyTableRefs) db.vocabularyTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (vocabularyTableRefs)
                    await $_getPrefetchedData<
                      VocabularyCategoryData,
                      $VocabularyCategoryTable,
                      VocabularyTableData
                    >(
                      currentTable: table,
                      referencedTable: $$VocabularyCategoryTableReferences
                          ._vocabularyTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$VocabularyCategoryTableReferences(
                                db,
                                table,
                                p0,
                              ).vocabularyTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.categoryId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$VocabularyCategoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $VocabularyCategoryTable,
      VocabularyCategoryData,
      $$VocabularyCategoryTableFilterComposer,
      $$VocabularyCategoryTableOrderingComposer,
      $$VocabularyCategoryTableAnnotationComposer,
      $$VocabularyCategoryTableCreateCompanionBuilder,
      $$VocabularyCategoryTableUpdateCompanionBuilder,
      (VocabularyCategoryData, $$VocabularyCategoryTableReferences),
      VocabularyCategoryData,
      PrefetchHooks Function({bool vocabularyTableRefs})
    >;
typedef $$VocabularyTableTableCreateCompanionBuilder =
    VocabularyTableCompanion Function({
      Value<int> id,
      required String word,
      required String definition,
      Value<String?> exampleSentence,
      Value<bool> mastered,
      required int categoryId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$VocabularyTableTableUpdateCompanionBuilder =
    VocabularyTableCompanion Function({
      Value<int> id,
      Value<String> word,
      Value<String> definition,
      Value<String?> exampleSentence,
      Value<bool> mastered,
      Value<int> categoryId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$VocabularyTableTableReferences
    extends
        BaseReferences<_$AppDb, $VocabularyTableTable, VocabularyTableData> {
  $$VocabularyTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $VocabularyCategoryTable _categoryIdTable(_$AppDb db) =>
      db.vocabularyCategory.createAlias(
        $_aliasNameGenerator(
          db.vocabularyTable.categoryId,
          db.vocabularyCategory.id,
        ),
      );

  $$VocabularyCategoryTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$VocabularyCategoryTableTableManager(
      $_db,
      $_db.vocabularyCategory,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VocabularyTableTableFilterComposer
    extends Composer<_$AppDb, $VocabularyTableTable> {
  $$VocabularyTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exampleSentence => $composableBuilder(
    column: $table.exampleSentence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get mastered => $composableBuilder(
    column: $table.mastered,
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

  $$VocabularyCategoryTableFilterComposer get categoryId {
    final $$VocabularyCategoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.vocabularyCategory,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VocabularyCategoryTableFilterComposer(
            $db: $db,
            $table: $db.vocabularyCategory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VocabularyTableTableOrderingComposer
    extends Composer<_$AppDb, $VocabularyTableTable> {
  $$VocabularyTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exampleSentence => $composableBuilder(
    column: $table.exampleSentence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get mastered => $composableBuilder(
    column: $table.mastered,
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

  $$VocabularyCategoryTableOrderingComposer get categoryId {
    final $$VocabularyCategoryTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.vocabularyCategory,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VocabularyCategoryTableOrderingComposer(
            $db: $db,
            $table: $db.vocabularyCategory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VocabularyTableTableAnnotationComposer
    extends Composer<_$AppDb, $VocabularyTableTable> {
  $$VocabularyTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exampleSentence => $composableBuilder(
    column: $table.exampleSentence,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get mastered =>
      $composableBuilder(column: $table.mastered, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$VocabularyCategoryTableAnnotationComposer get categoryId {
    final $$VocabularyCategoryTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.vocabularyCategory,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$VocabularyCategoryTableAnnotationComposer(
                $db: $db,
                $table: $db.vocabularyCategory,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$VocabularyTableTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $VocabularyTableTable,
          VocabularyTableData,
          $$VocabularyTableTableFilterComposer,
          $$VocabularyTableTableOrderingComposer,
          $$VocabularyTableTableAnnotationComposer,
          $$VocabularyTableTableCreateCompanionBuilder,
          $$VocabularyTableTableUpdateCompanionBuilder,
          (VocabularyTableData, $$VocabularyTableTableReferences),
          VocabularyTableData,
          PrefetchHooks Function({bool categoryId})
        > {
  $$VocabularyTableTableTableManager(_$AppDb db, $VocabularyTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$VocabularyTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$VocabularyTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$VocabularyTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> word = const Value.absent(),
                Value<String> definition = const Value.absent(),
                Value<String?> exampleSentence = const Value.absent(),
                Value<bool> mastered = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => VocabularyTableCompanion(
                id: id,
                word: word,
                definition: definition,
                exampleSentence: exampleSentence,
                mastered: mastered,
                categoryId: categoryId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String word,
                required String definition,
                Value<String?> exampleSentence = const Value.absent(),
                Value<bool> mastered = const Value.absent(),
                required int categoryId,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => VocabularyTableCompanion.insert(
                id: id,
                word: word,
                definition: definition,
                exampleSentence: exampleSentence,
                mastered: mastered,
                categoryId: categoryId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$VocabularyTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (categoryId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryId,
                            referencedTable: $$VocabularyTableTableReferences
                                ._categoryIdTable(db),
                            referencedColumn:
                                $$VocabularyTableTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$VocabularyTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $VocabularyTableTable,
      VocabularyTableData,
      $$VocabularyTableTableFilterComposer,
      $$VocabularyTableTableOrderingComposer,
      $$VocabularyTableTableAnnotationComposer,
      $$VocabularyTableTableCreateCompanionBuilder,
      $$VocabularyTableTableUpdateCompanionBuilder,
      (VocabularyTableData, $$VocabularyTableTableReferences),
      VocabularyTableData,
      PrefetchHooks Function({bool categoryId})
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$VocabularyCategoryTableTableManager get vocabularyCategory =>
      $$VocabularyCategoryTableTableManager(_db, _db.vocabularyCategory);
  $$VocabularyTableTableTableManager get vocabularyTable =>
      $$VocabularyTableTableTableManager(_db, _db.vocabularyTable);
}
