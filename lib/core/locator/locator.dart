import 'package:get_it/get_it.dart';

import '../features/home/data/data_source/app_db.dart';

GetIt locator =  GetIt.instance;
void setup(){
  locator.registerLazySingleton(()=>AppDb());
}
