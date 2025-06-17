import 'package:go_router/go_router.dart';
import 'package:vocabularyapp_drift/core/router/routeConstants.dart';
import 'package:vocabularyapp_drift/core/router/routerConfig.dart';

import '../../features/vocabulary/presentation/screens/add_vocabulary.dart';
import '../../features/vocabulary/presentation/screens/vocabulary_home.dart';


final routeController = RouteController();
final appRoutes = GoRouter(
  initialLocation: RouteConstants.homePage,routes: [
    GoRoute(path: RouteConstants.homePage,name: RouteConstants.homePage,builder: (context,state){
      routeController.addContext(context);
      return VocabularyHome(key: state.pageKey,);
    }),
  GoRoute(path: RouteConstants.addPage,name: RouteConstants.addPage,builder:(context,state){
    routeController.addContext(context);
    return AddVocabulary(key: state.pageKey,);
  })
]);