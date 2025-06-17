import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_db.g.dart';
class VocabularyTable extends Table{
  IntColumn get id=> integer().autoIncrement()();
  TextColumn get word => text()();
  TextColumn get definition => text()();
  TextColumn get exampleSentence =>text().nullable()();
  BoolColumn get mastered => boolean().withDefault(const Constant(false))();
  IntColumn get categoryId => integer().references(VocabularyCategory, #id,onDelete: KeyAction.restrict,)();
  DateTimeColumn get createdAt =>dateTime().nullable().clientDefault(()=>DateTime.now())();
  DateTimeColumn? get updatedAt => dateTime().nullable().withDefault(currentDateAndTime)();
}
class VocabularyCategory extends Table{
  IntColumn get id =>integer().autoIncrement()();
  TextColumn get category => text().unique()();
  DateTimeColumn get createdAt => dateTime().nullable().clientDefault(()=>DateTime.now())();
  DateTimeColumn get updatedAt => dateTime().nullable().withDefault(currentDateAndTime)();

}
 QueryExecutor _openConnection(){
    return driftDatabase(name: "my_database");
  }

@DriftDatabase(tables:[VocabularyTable,VocabularyCategory])
class AppDb extends _$AppDb{
  AppDb(): super(_openConnection());
@override
  int get schemaVersion => 1;
}
