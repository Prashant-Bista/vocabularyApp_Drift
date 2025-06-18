import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vocabularyapp_drift/core/router/routeConstants.dart';

class RouteController{
BuildContext? ctx;
void addContext(BuildContext context) {
  ctx=  context;
}
routeToVocabularyHomePage({bool shouldRemovePrevious=false, }){
  if(ctx!=null){
    if(shouldRemovePrevious){
      ctx?.goNamed(RouteConstants.vocabHomePage);
    }
    else{
      ctx?.pushNamed(RouteConstants.vocabHomePage);
    }
  }
}
routeToVocabularyAdd({bool shouldRemovePrevious=false}){
  if(ctx!=null){
    if(shouldRemovePrevious){
      ctx?.goNamed(RouteConstants.vocabAddPage);
    }
    else{
      ctx?.pushNamed(RouteConstants.vocabAddPage);
    }
  }
}
routeToCategoryHomePage({bool shouldRemovePrevious=false, }){
  if(ctx!=null){
    if(shouldRemovePrevious){
      ctx?.goNamed(RouteConstants.catHomePage);
    }
    else{
      ctx?.pushNamed(RouteConstants.catHomePage);
    }
  }
}
routeToCategoryAdd({bool shouldRemovePrevious=false}){
  if(ctx!=null){
    if(shouldRemovePrevious){
      ctx?.goNamed(RouteConstants.catAddPage);
    }
    else{
      ctx?.pushNamed(RouteConstants.catAddPage);
    }
  }
}

}