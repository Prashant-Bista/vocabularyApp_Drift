import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocabularyapp_drift/features/home/data/repository/category_repo.dart';

import '../../features/vocabulary/data/data_source/app_db.dart';
final categoryProvider = ChangeNotifierProvider.autoDispose<CategoryProvider>((ref)=>CategoryProvider());
class CategoryProvider extends ChangeNotifier{

  CategoryRepository _catrepo = CategoryRepository();
  List<VocabularyCategoryData> allCagegories =[];
  getAllCategory() async{
    allCagegories = await _catrepo.allCatagories();
    notifyListeners();
  }
  addCategory(VocabularyCategoryCompanion cc) async{
    await _catrepo.addCategory(cc);
    getAllCategory();
    notifyListeners();
  }
  updateCategory(VocabularyCategoryCompanion cc) async{
    await _catrepo.updateCategory(cc);
    getAllCategory();
    notifyListeners();
  }
  deleteCategory(int id) async{
    await _catrepo.deleteCategory(id);
    getAllCategory();
    notifyListeners();
  }

}