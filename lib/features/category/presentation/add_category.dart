import 'package:drift/drift.dart' as df;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabularyapp_drift/core/data_source/app_db.dart';
import 'package:vocabularyapp_drift/core/providers/category_provider.dart';
import 'package:vocabularyapp_drift/core/providers/vocabulary_provider.dart';

class AddCategory extends ConsumerWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GlobalKey<FormState> addVocabKey = GlobalKey<FormState>();

    final provider = ref.watch(categoryProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Add Category")),
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
                      return "Category can not be empty";
                    } else{
                      return null;
                    }
                  },
                  controller: provider.categoryController,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    labelText: "Category",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                ),
                MaterialButton(
                  height: 40.h,
                  minWidth: 100.w,
                  onPressed: () {
                    if(addVocabKey.currentState!.validate()){
                      VocabularyCategoryCompanion cc = VocabularyCategoryCompanion(
                        id: provider.isAdd?df.Value.absent(): df.Value(provider.updateId),
                        category: df.Value(provider.categoryController.text),
                        createdAt: df.Value(DateTime.now())
                      );
                      if(provider.isAdd){
                        provider.addCategory(cc);
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
