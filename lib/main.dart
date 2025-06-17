import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabularyapp_drift/core/features/home/presentation/screens/vocabulary_home.dart';
import 'package:vocabularyapp_drift/core/locator/locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocabularyapp_drift/core/router/routes.dart';
void main() {
  runApp(const ProviderScope(child:  MyApp()));
  setup();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,640),
child: MaterialApp.router(
  routeInformationProvider: appRoutes.routeInformationProvider,
  routerDelegate: appRoutes.routerDelegate,
  routeInformationParser: appRoutes.routeInformationParser,
    backButtonDispatcher: appRoutes.backButtonDispatcher,
  title: 'Flutter Demo',
  theme: ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.purple,
      shadowColor: Colors.purpleAccent,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  ),
  builder: (context,child){
    return child!;
  },
),

    );
  }
}


