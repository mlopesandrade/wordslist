import 'package:english_lists/app/shared/models/favorite_model.dart';
import 'package:english_lists/app/shared/models/historic_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoricCard extends StatelessWidget {
  const HistoricCard({super.key,required this.historic});
  final HistoricModel historic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.toNamed('/details',arguments: historic.word.toString()),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(historic.word.toString()),
            Text('${'views'.tr}: ${historic.views}')
          ],
        ),
      ),
    );
  }
}