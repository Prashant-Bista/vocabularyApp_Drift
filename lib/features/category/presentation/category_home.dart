import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabularyapp_drift/core/providers/category_provider.dart';
import 'package:vocabularyapp_drift/core/router/routes.dart';

import '../../../core/data_source/app_db.dart';


class CategoryHome extends ConsumerWidget {

  CategoryHome({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final provider = ref.watch(categoryProvider);
    List<VocabularyCategoryData> cats = provider.allCagegories;
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body:cats.length!=0? ListView.builder(itemCount:cats.length ,itemBuilder:(context,index){
        return ListTile(
          onLongPress: (){
            showDialog(context: context, builder: (context)=>SizedBox(
              height: 20.h,
              child: AlertDialog(
                title: Text("Delete ${cats[index].category}?"),
                actions: [IconButton(onPressed: (){
                  provider.deleteCategory(cats[index].id);
                  Navigator.of(context).pop();
                }, icon: Icon(Icons.delete))],
              ),
            ));
          },
          onTap: (){
            // provider.toggleIsAdd(false);
            // provider.setValuesForUpdate(index);
            routeController.routeToVocabularyAdd();
          },
          leading: CircleAvatar(
            radius: 20.sp,
            backgroundColor: Colors.grey,
            child: Text("${index+1}"),
          ),
          title:  Text(cats[index].category),
          titleTextStyle: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black),
          subtitleTextStyle: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black,),
        );
      }):Center(child: Text("No categories added yet")),
      floatingActionButton: FloatingActionButton(child:Icon(Icons.add),onPressed: (){
        provider.toggleIsAdd(true);
        provider.initiateValuesForAdd();
        routeController.routeToCategoryAdd();
      }),
    );
  }
}
