import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabularyapp_drift/core/providers/vocabulary_provider.dart';
import 'package:vocabularyapp_drift/core/router/routes.dart';

import '../../data/data_source/app_db.dart';

class VocabularyHome extends ConsumerWidget {

   VocabularyHome({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final provider = ref.watch(vocabProvider);
    List<VocabularyTableData> vocabs = provider.allVocabularies;
    return Scaffold(
      appBar: AppBar(
        title: Text("Vocabulary App"),
      ),
      body:vocabs.length!=0? ListView.builder(itemCount:vocabs.length ,itemBuilder:(context,index){
        return ListTile(
          onLongPress: (){
            showDialog(context: context, builder: (context)=>SizedBox(
              height: 20.h,
              child: AlertDialog(
                title: Text("Delete ${vocabs[index].word}?"),
                actions: [IconButton(onPressed: (){
                  provider.deleteVocabulary(vocabs[index].id);
                  Navigator.of(context).pop();
                }, icon: Icon(Icons.delete))],
              ),
            ));
          },
          onTap: (){
            provider.toggleIsAdd(false);
            provider.setValuesForUpdate(index);
            routeController.routeToAddVocabulary();
          },
          leading: CircleAvatar(
            radius: 20.sp,
            backgroundColor: Colors.grey,
            child: Text("${index+1}"),
          ),
          title:  Text(vocabs[index].word),
          titleTextStyle: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black),
          subtitleTextStyle: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black,),
          subtitle: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Definition:",style: TextStyle(fontWeight: FontWeight.w600),),
                  Text("Example:",style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(width:15.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(vocabs[index].definition,overflow: TextOverflow.ellipsis,),
                    Text(vocabs[index].exampleSentence??"",overflow: TextOverflow.ellipsis),
                  ],
                ),
              )
            ],
          ),
          trailing: vocabs[index].mastered?Icon(Icons.check):null,
        );
      }):Center(child: Text("No vocabularies added yet")),
      floatingActionButton: FloatingActionButton(child:Icon(Icons.add),onPressed: (){
        provider.toggleIsAdd(true);
        provider.initiateValuesForAdd();
        routeController.routeToAddVocabulary();
      }),
    );
  }
}
