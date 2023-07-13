import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'themes.dart';

class ThemeController{
  static void switchTheme(){
    final box = GetStorage();
    if(Get.isDarkMode){
      Get.changeTheme(Themes().lightTheme);
      box.write('isDark',false);
    }else{
      Get.changeTheme(Themes().darkTheme);
      box.write('isDark',true);
    }
  }
}