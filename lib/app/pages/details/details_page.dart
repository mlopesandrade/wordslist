import 'package:english_lists/app/pages/details/details_controller.dart';
import 'package:english_lists/app/shared/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(controller.word),
        actions:  [
          Obx((){
            return
            controller.appController.favorites.where((x) => x.id == controller.word).length == 1 ?
            IconButton(
              icon: const Icon(Icons.star),
              onPressed: controller.setRemoveFavorite,
            ):IconButton(
            icon: const Icon(Icons.star_outline),
            onPressed: controller.setChangeFavorite,
            );
          })
        ]
      ),
      body: Obx((){
        if(controller.statusScreen.value == StatusScreen.loading)return const Center(child: CircularProgressIndicator(),);
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: Get.width * 0.5,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade900),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(controller.word,
                            style: const TextStyle(
                                fontSize: 30
                            ),
                          ),
                          Text(
                              controller.statusScreen.value == StatusScreen.error || controller.wordData.value.pronunciation == null || controller.wordData.value.pronunciation!.all == null? '':
                              controller.wordData.value.pronunciation!.all.toString(),
                            style: const TextStyle(
                                fontSize: 30
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      IconButton(
                        icon: AnimatedIcon(
                          progress: controller.animationController,
                          icon: AnimatedIcons.play_pause,
                          size: 40,
                        ),
                        onPressed: controller.speakWord,
                      ),
                    ],
                  )
                ),
                Text(
                  'meanings'.tr,
                  style: const TextStyle(
                    fontSize: 30
                  ),
                ),
                Text(
                  '${'verb'.tr} - "${controller.word}" ' ,
                  style: const TextStyle(
                      fontSize: 15
                  ),
                ),
                controller.statusScreen.value == StatusScreen.error || controller.wordData.value.results == null ? const SizedBox():
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'or'.tr,
                        style: const TextStyle(
                            fontSize: 15
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.wordData.value.results?.length,
                          itemBuilder: (context,index){
                            return Text(controller.wordData.value.results![index].definition.toString(),
                              style: const TextStyle(
                                  fontSize: 15,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
