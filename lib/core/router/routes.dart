import 'package:go_router/go_router.dart';
import 'package:vocabularyapp_drift/core/router/routeConstants.dart';
import 'package:vocabularyapp_drift/core/router/routerConfig.dart';
import 'package:vocabularyapp_drift/features/category/presentation/add_category.dart';
import 'package:vocabularyapp_drift/features/category/presentation/category_home.dart';
import 'package:vocabularyapp_drift/features/home/presentation/home_page.dart';

import '../../features/vocabulary/presentation/screens/add_vocabulary.dart';
import '../../features/vocabulary/presentation/screens/vocabulary_home.dart';


final routeController = RouteController();
final appRoutes = GoRouter(
  initialLocation: RouteConstants.mainHomePage,routes: [
    GoRoute(path: RouteConstants.mainHomePage,name: RouteConstants.mainHomePage,builder: (context,state){
      routeController.addContext(context);
      return HomePage(key: state.pageKey,);
    },routes: [
      GoRoute(path: RouteConstants.catHomePage,name: RouteConstants.catHomePage,builder:(context,state){
        routeController.addContext(context);
        return CategoryHome(key: state.pageKey,);
      }),
      GoRoute(path: RouteConstants.catAddPage,name: RouteConstants.catAddPage,builder:(context,state){
        routeController.addContext(context);
        return AddCategory(key: state.pageKey,);
      }),
      GoRoute(path: RouteConstants.vocabHomePage,name: RouteConstants.vocabHomePage,builder:(context,state){
        routeController.addContext(context);
        return VocabularyHome(key: state.pageKey,);
      }),
      GoRoute(path: RouteConstants.vocabAddPage,name: RouteConstants.vocabAddPage,builder:(context,state){
        routeController.addContext(context);
        return AddVocabulary(key: state.pageKey,);
      })



    ]),
]);