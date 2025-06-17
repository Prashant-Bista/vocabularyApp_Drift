import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vocabularyapp_drift/core/router/routeConstants.dart';

class RouteController{
BuildContext? ctx;
void addContext(BuildContext context) {
  ctx=  context;
}
routeToHomePage({bool shouldRemovePrevious=false, }){
  if(ctx!=null){
    if(shouldRemovePrevious){
      ctx?.goNamed(RouteConstants.homePage);
    }
    else{
      ctx?.pushNamed(RouteConstants.homePage);
    }
  }
}
routeToAddVocabulary({bool shouldRemovePrevious=false}){
  if(ctx!=null){
    if(shouldRemovePrevious){
      ctx?.goNamed(RouteConstants.addPage);
    }
    else{
      ctx?.pushNamed(RouteConstants.addPage);
    }
  }
}
}