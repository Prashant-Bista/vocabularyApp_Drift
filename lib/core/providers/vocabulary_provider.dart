import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/home/data/data_source/app_db.dart';
import '../features/home/data/repository/vocab_repo.dart';
final vocabProvider = ChangeNotifierProvider.autoDispose<VocabularyProvider>((ref)=>VocabularyProvider());
class VocabularyProvider extends ChangeNotifier{
  VocabularyRepository _vocabRepo = VocabularyRepository();
  List<VocabularyTableData> _allVocabularies=[];
  List<VocabularyTableData> get allVocabularies =>_allVocabularies;
  getAllVocabularies() async{
    _allVocabularies = await _vocabRepo.allVocabularies();
    notifyListeners();
  }


}
