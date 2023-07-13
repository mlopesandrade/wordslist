import 'dart:async';

import 'package:english_lists/app/pages/details/details_repository.dart';
import 'package:english_lists/app/shared/models/historic_model.dart';
import 'package:english_lists/app/shared/models/word_model.dart';
import 'package:english_lists/app/shared/utils/enums.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';

class DetailsController extends GetxController with GetSingleTickerProviderStateMixin{

  late AnimationController animationController;

  FlutterTts flutterTts = FlutterTts();

  Rx<TtsState> state = Rx<TtsState>(TtsState.stopped);

  Rx<StatusScreen> statusScreen = Rx<StatusScreen>(StatusScreen.loading);

  Rx<WordModel> wordData = Rx<WordModel>(WordModel());

  final String word = Get.arguments as String;

  final DetailsRepository _detailsRepository;
  AppController appController;
  DetailsController(this._detailsRepository,this.appController);

  @override
  void onInit()async{
    postHistoricWord();
    getDetailsWord();
    animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    await flutterTts.setLanguage("en-US");
    super.onInit();
  }

  changeStatusScreen(StatusScreen newStatus)=> statusScreen.value = newStatus;

  Future postHistoricWord()async{
    var historic = appController.historic.where((HistoricModel historic) => historic.word == word);
    if(historic.isEmpty){
      appController.postHistoric(word);
    }else{
      appController.putHistoric(historic.first);
    }
  }

  Future getDetailsWord()async{
    changeStatusScreen(StatusScreen.loading);
    final data = await _detailsRepository.getWord(word);
    if(data != null){
      wordData.value = data;
      changeStatusScreen(StatusScreen.ok);
    }else{
      changeStatusScreen(StatusScreen.error);
    }
  }

  Future speakWord()async{
    await flutterTts.setVolume(1);
    var result = await flutterTts.speak(word);
    if(result == 1){
      animationController.forward();
    }
    Timer(const Duration(seconds: 1),(){
      animationController.reverse();
    });
  }

  setChangeFavorite(){
    appController.postFavorite(word);
  }

  setRemoveFavorite(){
    appController.removeFavorite(word);
  }

}