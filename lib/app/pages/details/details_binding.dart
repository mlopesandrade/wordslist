import 'package:english_lists/app/pages/details/details_controller.dart';
import 'package:english_lists/app/pages/details/details_repository.dart';
import 'package:get/get.dart';

class DetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsRepository(),fenix: true);
    Get.put(DetailsController(Get.find(),Get.find()));
  }
}