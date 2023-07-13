import 'package:english_lists/app/shared/widgets/cards/historic_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_controller.dart';

class HistoricPage extends StatelessWidget {
  const HistoricPage({super.key,required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5
        ),
        itemCount: controller.appController.historic.length,
        itemBuilder: (context,index){
          return HistoricCard(historic: controller.appController.historic[index]);
        },
      );
    });
  }
}
