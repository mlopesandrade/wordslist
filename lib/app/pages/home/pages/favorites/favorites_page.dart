import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/cards/favorite_card.dart';
import '../../../../shared/widgets/cards/word_card.dart';
import '../../home_controller.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key,required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5
        ),
        itemCount: controller.appController.favorites.length,
        itemBuilder: (context,index){
          return FavoriteCard(word: controller.appController.favorites[index]);
        },
      );
    });
  }
}
