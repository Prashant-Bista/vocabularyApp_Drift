import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocabularyapp_drift/core/repository/category_repo.dart';

import '../data_source/app_db.dart';

final categoryProvider = ChangeNotifierProvider.autoDispose<CategoryProvider>((ref)=>CategoryProvider());
class CategoryProvider extends ChangeNotifier{
  CategoryProvider(){
    getAllCategory();
  }
  bool isAdd = false;
  bool isLoading = false;
  int updateId=-1;
  int categoryId=-1;
  String? selectedCategory;
  TextEditingController categoryController = TextEditingController();

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
  toggleIsAdd(bool au){
    isAdd = au;
    notifyListeners();
  }
  initiateValuesForAdd(){
    categoryController.text =="";
  }
  setSelectedCategory(String value){
    selectedCategory = value;
    notifyListeners();
  }
}