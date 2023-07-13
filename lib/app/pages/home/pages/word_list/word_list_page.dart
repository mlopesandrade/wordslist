import 'package:english_lists/app/pages/home/home_controller.dart';
import 'package:english_lists/app/shared/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/cards/word_card.dart';

class WordListPage extends StatelessWidget {
  const WordListPage({super.key,required this.controller});
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: CustomTextFormField(
            hintText: 'searchWord'.tr,
            labelText: 'filter'.tr,
            controller: controller.appController.filterText,
            onChanged: (x)=>controller.appController.getWordFilter(),
          ),
        ),
        Expanded(
          child: Obx((){
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.5
              ),
              itemCount: controller.appController.filterList.length,
              itemBuilder: (context,index){
                return WordCard(word: controller.appController.filterList[index]);
              },
            );
          }),
        ),
      ],
    );
  }
}
