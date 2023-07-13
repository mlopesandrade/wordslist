import 'package:english_lists/app/shared/models/words_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordCard extends StatelessWidget {
  const WordCard({super.key,required this.word});
  final WordsModel word;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.toNamed('/details',arguments: word.title.toString()),
      child: Card(
        child: Center(
          child: Text(word.title.toString()),
        ),
      ),
    );
  }
}
