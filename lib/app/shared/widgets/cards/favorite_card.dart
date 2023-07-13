import 'package:english_lists/app/shared/models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key,required this.word});
  final FavoriteModel word;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.toNamed('/details',arguments: word.word.toString()),
      child: Card(
        child: Center(
          child: Text(word.word.toString()),
        ),
      ),
    );
  }
}