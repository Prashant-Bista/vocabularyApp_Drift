import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocabularyapp_drift/core/providers/vocabulary_provider.dart';

class AddVocabulary extends ConsumerWidget {
  const AddVocabulary({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    GlobalKey<FormState> addVocabKey = GlobalKey<FormState>();
    TextEditingController _wordController =TextEditingController();
    TextEditingController _definitionController =TextEditingController();
    TextEditingController _exampleController =TextEditingController();

    final provider = ref.watch(vocabProvider);
    return Scaffold(
      appBar:AppBar(
        title: Text("Add vocabulary"),
      ),
      body:  Form(
        key: addVocabKey,
        child: Column(
          children: [
            TextFormField(

            )
          ],
        ),
      ),
    );

  }
}
