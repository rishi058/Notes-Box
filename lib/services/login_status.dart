import 'package:get_storage/get_storage.dart';

void setLoginTrue(){
  GetStorage().write('isLoggedIn', true);
}

void setLoginFalse(){
  GetStorage().write('isLoggedIn', false);
}

bool isLoggedIn(){
  bool? status =  GetStorage().read('isLoggedIn');
  if(status==null){return false;}
  return status;
}