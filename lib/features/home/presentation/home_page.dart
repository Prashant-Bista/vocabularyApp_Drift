import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabularyapp_drift/core/router/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Row(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              color: Colors.purpleAccent,
              height: 100.h,
              minWidth: 100,
              onPressed: (){
                routeController.routeToVocabularyHomePage();
              },child: Text("Vocabulary",style: TextStyle(fontSize: 20.sp,color: Colors.white),),),
            MaterialButton(
              color: Colors.purpleAccent,
              minWidth: 100,
              height: 100.h,
              onPressed: (){
                routeController.routeToCategoryHomePage();


              },child: Text("Category",style: TextStyle(fontSize: 20.sp,color: Colors.white),),)

          ],
        ),
      ),
    );
  }
}
