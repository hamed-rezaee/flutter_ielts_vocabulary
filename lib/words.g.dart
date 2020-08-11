// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Word extends DataClass implements Insertable<Word> {
  final int id;
  final String word;
  final String definitions;
  final String synonyms;
  final String opposites;
  final bool checked;
  Word(
      {this.id,
      this.word,
      this.definitions,
      this.synonyms,
      this.opposites,
      this.checked});
  factory Word.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Word(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      word: stringType.mapFromDatabaseResponse(data['${effectivePrefix}word']),
      definitions: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}definitions']),
      synonyms: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}synonyms']),
      opposites: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}opposites']),
      checked:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}checked']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || word != null) {
      map['word'] = Variable<String>(word);
    }
    if (!nullToAbsent || definitions != null) {
      map['definitions'] = Variable<String>(definitions);
    }
    if (!nullToAbsent || synonyms != null) {
      map['synonyms'] = Variable<String>(synonyms);
    }
    if (!nullToAbsent || opposites != null) {
      map['opposites'] = Variable<String>(opposites);
    }
    if (!nullToAbsent || checked != null) {
      map['checked'] = Variable<bool>(checked);
    }
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      word: word == null && nullToAbsent ? const Value.absent() : Value(word),
      definitions: definitions == null && nullToAbsent
          ? const Value.absent()
          : Value(definitions),
      synonyms: synonyms == null && nullToAbsent
          ? const Value.absent()
          : Value(synonyms),
      opposites: opposites == null && nullToAbsent
          ? const Value.absent()
          : Value(opposites),
      checked: checked == null && nullToAbsent
          ? const Value.absent()
          : Value(checked),
    );
  }

  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Word(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      definitions: serializer.fromJson<String>(json['definitions']),
      synonyms: serializer.fromJson<String>(json['synonyms']),
      opposites: serializer.fromJson<String>(json['opposites']),
      checked: serializer.fromJson<bool>(json['checked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'definitions': serializer.toJson<String>(definitions),
      'synonyms': serializer.toJson<String>(synonyms),
      'opposites': serializer.toJson<String>(opposites),
      'checked': serializer.toJson<bool>(checked),
    };
  }

  Word copyWith(
          {int id,
          String word,
          String definitions,
          String synonyms,
          String opposites,
          bool checked}) =>
      Word(
        id: id ?? this.id,
        word: word ?? this.word,
        definitions: definitions ?? this.definitions,
        synonyms: synonyms ?? this.synonyms,
        opposites: opposites ?? this.opposites,
        checked: checked ?? this.checked,
      );
  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('definitions: $definitions, ')
          ..write('synonyms: $synonyms, ')
          ..write('opposites: $opposites, ')
          ..write('checked: $checked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          word.hashCode,
          $mrjc(
              definitions.hashCode,
              $mrjc(synonyms.hashCode,
                  $mrjc(opposites.hashCode, checked.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.word == this.word &&
          other.definitions == this.definitions &&
          other.synonyms == this.synonyms &&
          other.opposites == this.opposites &&
          other.checked == this.checked);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<int> id;
  final Value<String> word;
  final Value<String> definitions;
  final Value<String> synonyms;
  final Value<String> opposites;
  final Value<bool> checked;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.definitions = const Value.absent(),
    this.synonyms = const Value.absent(),
    this.opposites = const Value.absent(),
    this.checked = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.definitions = const Value.absent(),
    this.synonyms = const Value.absent(),
    this.opposites = const Value.absent(),
    this.checked = const Value.absent(),
  });
  static Insertable<Word> custom({
    Expression<int> id,
    Expression<String> word,
    Expression<String> definitions,
    Expression<String> synonyms,
    Expression<String> opposites,
    Expression<bool> checked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (definitions != null) 'definitions': definitions,
      if (synonyms != null) 'synonyms': synonyms,
      if (opposites != null) 'opposites': opposites,
      if (checked != null) 'checked': checked,
    });
  }

  WordsCompanion copyWith(
      {Value<int> id,
      Value<String> word,
      Value<String> definitions,
      Value<String> synonyms,
      Value<String> opposites,
      Value<bool> checked}) {
    return WordsCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      definitions: definitions ?? this.definitions,
      synonyms: synonyms ?? this.synonyms,
      opposites: opposites ?? this.opposites,
      checked: checked ?? this.checked,
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
    if (definitions.present) {
      map['definitions'] = Variable<String>(definitions.value);
    }
    if (synonyms.present) {
      map['synonyms'] = Variable<String>(synonyms.value);
    }
    if (opposites.present) {
      map['opposites'] = Variable<String>(opposites.value);
    }
    if (checked.present) {
      map['checked'] = Variable<bool>(checked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('definitions: $definitions, ')
          ..write('synonyms: $synonyms, ')
          ..write('opposites: $opposites, ')
          ..write('checked: $checked')
          ..write(')'))
        .toString();
  }
}

class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  final GeneratedDatabase _db;
  final String _alias;
  $WordsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _wordMeta = const VerificationMeta('word');
  GeneratedTextColumn _word;
  @override
  GeneratedTextColumn get word => _word ??= _constructWord();
  GeneratedTextColumn _constructWord() {
    return GeneratedTextColumn(
      'word',
      $tableName,
      true,
    );
  }

  final VerificationMeta _definitionsMeta =
      const VerificationMeta('definitions');
  GeneratedTextColumn _definitions;
  @override
  GeneratedTextColumn get definitions =>
      _definitions ??= _constructDefinitions();
  GeneratedTextColumn _constructDefinitions() {
    return GeneratedTextColumn(
      'definitions',
      $tableName,
      true,
    );
  }

  final VerificationMeta _synonymsMeta = const VerificationMeta('synonyms');
  GeneratedTextColumn _synonyms;
  @override
  GeneratedTextColumn get synonyms => _synonyms ??= _constructSynonyms();
  GeneratedTextColumn _constructSynonyms() {
    return GeneratedTextColumn(
      'synonyms',
      $tableName,
      true,
    );
  }

  final VerificationMeta _oppositesMeta = const VerificationMeta('opposites');
  GeneratedTextColumn _opposites;
  @override
  GeneratedTextColumn get opposites => _opposites ??= _constructOpposites();
  GeneratedTextColumn _constructOpposites() {
    return GeneratedTextColumn(
      'opposites',
      $tableName,
      true,
    );
  }

  final VerificationMeta _checkedMeta = const VerificationMeta('checked');
  GeneratedBoolColumn _checked;
  @override
  GeneratedBoolColumn get checked => _checked ??= _constructChecked();
  GeneratedBoolColumn _constructChecked() {
    return GeneratedBoolColumn('checked', $tableName, true,
        defaultValue: const Constant<bool>(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, word, definitions, synonyms, opposites, checked];
  @override
  $WordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'words';
  @override
  final String actualTableName = 'words';
  @override
  VerificationContext validateIntegrity(Insertable<Word> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word'], _wordMeta));
    }
    if (data.containsKey('definitions')) {
      context.handle(
          _definitionsMeta,
          definitions.isAcceptableOrUnknown(
              data['definitions'], _definitionsMeta));
    }
    if (data.containsKey('synonyms')) {
      context.handle(_synonymsMeta,
          synonyms.isAcceptableOrUnknown(data['synonyms'], _synonymsMeta));
    }
    if (data.containsKey('opposites')) {
      context.handle(_oppositesMeta,
          opposites.isAcceptableOrUnknown(data['opposites'], _oppositesMeta));
    }
    if (data.containsKey('checked')) {
      context.handle(_checkedMeta,
          checked.isAcceptableOrUnknown(data['checked'], _checkedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Word map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Word.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $WordsTable _words;
  $WordsTable get words => _words ??= $WordsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [words];
}
