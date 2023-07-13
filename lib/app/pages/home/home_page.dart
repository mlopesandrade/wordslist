import 'package:english_lists/app/theme/themes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: controller.signOut,
        ),
        centerTitle: true,
        title: Hero(
            tag: "logo",
            child: ClipRRect(
                child: FlutterLogo(
                  size: Get.height * 0.05,
                )
            )
        ),
        actions: [
          Obx((){
            return IconButton(
              icon: Icon(
                  controller.appController.isDarkMode.value ?
                  Icons.dark_mode:
                  Icons.light_mode
              ),
              onPressed: controller.appController.changeTheme,
            );
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() {
            return Column(
              children: [
                SegmentedButton(
                  segments: controller.buttons,
                  selected: <int>{controller.buttonValue.value},
                  showSelectedIcon: false,
                  onSelectionChanged: (Set value){
                    controller.buttonValue.value = value.first;
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: controller.pageSelected(controller),
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}

