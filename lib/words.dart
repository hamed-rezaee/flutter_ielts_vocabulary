import 'package:moor_flutter/moor_flutter.dart';

part 'words.g.dart';

class Words extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get word => text().nullable()();
  TextColumn get definitions => text().nullable()();
  TextColumn get synonyms => text().nullable()();
  BoolColumn get checked =>
      boolean().withDefault(const Constant<bool>(false))();
}

@UseMoor(tables: <Type>[Words])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<Word>> getAll() => select(words).get();

  Stream<List<Word>> watchAll() => select(words).watch();

  Future<int> insertItem(Word word) => into(words).insert(word);

  Future<bool> updateItem(Word word) => update(words).replace(word);

  Future<int> deleteItem(Word word) => delete(words).delete(word);
}
