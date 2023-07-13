import 'package:english_lists/app/app_repository.dart';
import 'package:english_lists/app/shared/models/favorite_model.dart';
import 'package:english_lists/app/shared/models/historic_model.dart';
import 'package:english_lists/app/shared/models/words_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'auth/auth_controller.dart';
import 'theme/themes_controller.dart';

class AppController extends GetxController{

  final box = GetStorage();

  RxBool isDarkMode = RxBool(false);

  TextEditingController filterText = TextEditingController();

  RxList<HistoricModel> historic = RxList<HistoricModel>([]);

  RxList<FavoriteModel> favorites = RxList<FavoriteModel>([]);

  RxList<WordsModel> words = RxList<WordsModel>([]);

  RxList<WordsModel> filterList = RxList<WordsModel>([]);

  final AppRepository _appRepository;
  final AuthController _authController;
  AppController(this._appRepository,this._authController);

  @override
  void onInit(){
    isDarkMode.value = box.read('isDark') ?? false;
    getWords();
    super.onInit();
  }

  changeTheme(){
    ThemeController.switchTheme();
    isDarkMode.value = !isDarkMode.value;
  }

  getWordFilter(){
    filterList.clear();
    if(filterText.text.isEmpty){
      for (var element in words) {
        filterList.add(element);
      }
    }else{
      for (var element in words) {
        if(element.title!.contains(filterText.text)){
          filterList.add(element);
        }
      }
    }
  }

  Future getWords()async{
    var data = await _appRepository.getWords();
    if(data != null && data.isNotEmpty){
      words.addAll(data);
      filterList.addAll(data);
    }
  }

  getFavorites(){
    favorites.bindStream(_appRepository.getFavorites(_authController.userLogged!.email.toString()));
  }

  postFavorite(String word){
    _appRepository.postFavorite(word,_authController.userLogged!.email.toString());
  }

  getHistoric(){
    historic.bindStream(_appRepository.getHistoric(_authController.userLogged!.email.toString()));
  }

  removeFavorite(String word){
    _appRepository.removeFavorite(word,_authController.userLogged!.email.toString());
  }

  postHistoric(String word){
    _appRepository.postHistoric(word,_authController.userLogged!.email.toString());
  }

  putHistoric(HistoricModel historic){
    _appRepository.putHistoric(historic,_authController.userLogged!.email.toString());
  }

}