import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_db.g.dart';
class VocabularyTable extends Table{
  IntColumn get id=> integer().autoIncrement()();
  TextColumn get word => text()();
  TextColumn get definition => text()();
  TextColumn get exampleSentence =>text().nullable()();
  BoolColumn get mastered => boolean().withDefault(const Constant(false))();

}
LazyDatabase _openConnection(){
  return LazyDatabase((){
    return driftDatabase(name: "my_database");
  });
}
@DriftDatabase(tables:[VocabularyTable])
class AppDb extends _$AppDb{
  AppDb(): super(_openConnection());
@override
  int get schemaVersion => 1;
}
