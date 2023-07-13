import 'package:english_lists/app/pages/home/pages/favorites/favorites_page.dart';
import 'package:english_lists/app/pages/home/pages/historic/historic_page.dart';
import 'package:english_lists/app/pages/home/pages/word_list/word_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_controller.dart';
import '../../auth/auth_controller.dart';

class HomeController extends GetxController{

  List<ButtonSegment> buttons = [
    ButtonSegment(value: 0,label: Text('wordList'.tr,textAlign: TextAlign.center,)),
    ButtonSegment(value: 1,label: Text('historic'.tr,textAlign: TextAlign.center,)),
    ButtonSegment(value: 2,label: Text('favorites'.tr,textAlign: TextAlign.center,))
  ];

  RxInt buttonValue = RxInt(0);

  final AuthController _authController;
  final AppController appController;
  HomeController(this._authController,this.appController);

  @override
  void onInit() {
    appController.getFavorites();
    appController.getHistoric();
    super.onInit();
  }

  signOut(){
    _authController.signOut();
  }

  pageSelected(HomeController controller){
    switch(buttonValue.value){
     case 0:
       return WordListPage(controller: controller);
      case 1:
      return HistoricPage(controller: controller);
      case 2:
      return FavoritePage(controller: controller);
     default:
        return WordListPage(controller: controller);
    }
  }

}