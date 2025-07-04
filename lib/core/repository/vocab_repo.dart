
import 'package:vocabularyapp_drift/core/locator/locator.dart';

import '../data_source/app_db.dart';


class VocabularyRepository{
  AppDb db = locator.get<AppDb>();
  Future<List<VocabularyTableData>> allVocabularies() async{
    try{
      return await db.select(db.vocabularyTable).get();
    }
    catch (e){
      print(e.toString());
      return [];
    }
  }
  Future<VocabularyTableData?> getVocabularyById(int id) async{
    try{
      return await (db.select(db.vocabularyTable)..where((vocab)=>vocab.id.equals(id))).getSingle();
    }
    catch (e){
      print(e.toString());
      return null;
    }
  }
  addVocabulary(VocabularyTableCompanion vc)async{
    try{
       await db.into(db.vocabularyTable).insert(vc);
    }
    catch(e){
      print(e.toString());
    }
  }
  updateVocabulary(VocabularyTableCompanion vc) async{
    try{
       await db.update(db.vocabularyTable).replace(vc);
    }
    catch(e){
      print("yoyo");
      print(e.toString());
    }
  }
  deleteVocabulary(int id) async{
    try{
      print("yoyo");
      await (db.delete(db.vocabularyTable)..where((vocab)=>vocab.id.equals(id))).go();
    }
    catch(e){
      print(e.toString());
    }
  }
}