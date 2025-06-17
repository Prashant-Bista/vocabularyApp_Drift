import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/vocabulary/data/data_source/app_db.dart';
import '../../features/vocabulary/data/repository/vocab_repo.dart';

final vocabProvider = ChangeNotifierProvider.autoDispose<VocabularyProvider>((ref)=>VocabularyProvider());
class VocabularyProvider extends ChangeNotifier{
  VocabularyProvider(){
    getAllVocabularies();
  }
  VocabularyRepository _vocabRepo = VocabularyRepository();
  bool isAdd = false;
  bool isLoading = false;
  bool mastered = false;
  int updateId=-1;
  TextEditingController wordController = TextEditingController();
  TextEditingController definitionController = TextEditingController();
  TextEditingController exampleController = TextEditingController();

  List<VocabularyTableData> _allVocabularies=[];
  List<VocabularyTableData> get allVocabularies =>_allVocabularies;
  getAllVocabularies() async{
    isLoading = true;
    _allVocabularies = await _vocabRepo.allVocabularies();
    notifyListeners();
    isLoading = false;
  }
  addVocabulary(VocabularyTableCompanion vc) async{
    await _vocabRepo.addVocabulary(vc);
    getAllVocabularies();
    notifyListeners();
  }
  updateVocabulary(VocabularyTableCompanion vc) async{
    await _vocabRepo.updateVocabulary(vc);
    getAllVocabularies();
    notifyListeners();
  }
  deleteVocabulary(int id) async{
    await _vocabRepo.deleteVocabulary(id);
    getAllVocabularies();
    notifyListeners();
  }
  getVocabularyById(int id) async{
    await _vocabRepo.getVocabularyById(id);
    notifyListeners();
  }
  toggleMastered(){
    mastered = !mastered;
    notifyListeners();
  }
  toggleIsAdd(bool au){
    isAdd = au;
    notifyListeners();
  }
  initiateValuesForAdd(){
    wordController.text = "";
    definitionController.text = "";
    exampleController.text = "";
    mastered = false;
  }
  setValuesForUpdate(int index){
    updateId = allVocabularies[index].id;
    wordController.text = allVocabularies[index].word;
    definitionController.text = allVocabularies[index].definition;
    exampleController.text = allVocabularies[index].exampleSentence!;
    mastered = allVocabularies[index].mastered;
  }
}
