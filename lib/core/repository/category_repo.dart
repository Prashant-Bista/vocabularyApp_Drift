import 'package:vocabularyapp_drift/core/locator/locator.dart';
import '../data_source/app_db.dart';
class CategoryRepository {
  AppDb db = locator.get<AppDb>();
  Future<List<VocabularyCategoryData>> allCatagories()async{
    try {
      return await db.select(db.vocabularyCategory).get();
  }
  catch(e){
      print(e.toString());
      return [];
  }
  }
  addCategory(VocabularyCategoryCompanion cc)async{
    try {
      await db.into(db.vocabularyCategory).insert(cc);
    }
    catch(e){
      print(e.toString());

    }
  }
  deleteCategory(int id)async{
    try {
      await (db.delete(db.vocabularyCategory)..where((vocab)=>vocab.id.equals(id))).go();
    }
    catch(e){
      print(e.toString());

    }
  }
  updateCategory(VocabularyCategoryCompanion cc) async{
    try {
      await (db.update(db.vocabularyCategory).replace(cc));
    }
    catch(e){
      print(e.toString());
    }
  }
}