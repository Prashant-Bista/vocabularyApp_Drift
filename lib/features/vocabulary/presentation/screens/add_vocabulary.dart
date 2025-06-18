import 'package:drift/drift.dart' as df;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabularyapp_drift/core/providers/category_provider.dart';
import 'package:vocabularyapp_drift/core/providers/vocabulary_provider.dart';

import '../../../../core/data_source/app_db.dart' ;

class AddVocabulary extends ConsumerWidget {
  const AddVocabulary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GlobalKey<FormState> addVocabKey = GlobalKey<FormState>();

    final provider = ref.watch(vocabProvider);
    final catProvider = ref.watch(categoryProvider);
    return catProvider.allCagegories.isEmpty?CircularProgressIndicator():Scaffold(
      appBar: AppBar(title: Text("Add vocabulary")),
      body: Form(
        key: addVocabKey,
        child: Center(
          child: SizedBox(
            width: 200.w,
            child: Column(
              spacing: 40,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Word can not be empty";
                    }
                    else{
                      return null;
                    }
                  },
                  controller: provider.wordController,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    labelText: "Word",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Definition can not be empty";
                    } else{
                      return null;
                    }
                  },
                  controller: provider.definitionController,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    labelText: "Definition",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Example can not be empty";
                    } else{
                      return null;
                    }
                  },
                  controller: provider.exampleController,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    labelText: "Example",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Mastered?",style: TextStyle(color: Colors.black,fontSize: 15),),
                    SizedBox(
                      width: 35.w,
                    ),
                    Checkbox(value: provider.mastered, onChanged: (value){
                      provider.toggleMastered();
                    })
                  ],
                ),
                DropdownButton(value:catProvider.selectedCategory,hint:Text("Category"),items: catProvider.allCagegories.map((each)=>DropdownMenuItem(value: each.category,child: Text(each.category))).toList(), onChanged: (value){
                 catProvider.setSelectedCategory(value!);
                  provider.selectedCatId = catProvider.allCagegories.where((each)=>each.category==value).first.id;
                },),
                MaterialButton(
                  height: 40.h,
                  minWidth: 100.w,
                  onPressed: () {
                    if(addVocabKey.currentState!.validate()){
                      VocabularyTableCompanion vc = VocabularyTableCompanion(
                          word: df.Value(provider.wordController.text),
                          definition: df.Value(provider.definitionController.text),
                          exampleSentence:  df.Value(provider.exampleController.text),
                          mastered:  df.Value(provider.mastered),
                          categoryId:  df.Value(provider.selectedCatId),
                          createdAt:  df.Value.absent(),
                          updatedAt:  df.Value.absent()

                      );
                      if(provider.isAdd){
                        provider.addVocabulary(vc);
                      }
                      else{
                        provider.updateVocabulary(vc);
                      }
                      Navigator.of(context).pop();
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.purple,
                  splashColor: Colors.blue,
                  child: Text("${provider.isAdd?"Add":"Update"}", style: TextStyle(color: Colors.white)),
                ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
