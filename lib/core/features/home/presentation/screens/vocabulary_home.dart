import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocabularyapp_drift/core/features/home/data/data_source/app_db.dart';
import 'package:vocabularyapp_drift/core/providers/vocabulary_provider.dart';

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
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Text("${index+1}"),
          ),
          title:  Text(vocabs[index].word),
          subtitle: Column(
            children: [
              Text(vocabs[index].definition),
              Text(vocabs[index].definition??""),
            ],
          ),
          trailing: vocabs[index].mastered?Icon(Icons.check):null,
        );
      }):Center(child: Text("No vocabularies added yet")),
      floatingActionButton: FloatingActionButton(child:Icon(Icons.add),onPressed: (){
        
      }),
    );
  }
}
