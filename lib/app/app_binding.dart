import 'package:english_lists/app/app_repository.dart';
import 'package:english_lists/app/app_controller.dart';
import 'package:get/get.dart';
import 'auth/auth_controller.dart';
import 'auth/auth_repository.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository(),fenix: true);
    Get.lazyPut(() => AppRepository(),fenix: true);
    Get.put(AuthController(Get.find()));
    Get.put(AppController(Get.find(),Get.find()));
  }
}