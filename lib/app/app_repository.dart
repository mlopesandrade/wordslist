import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_lists/app/shared/models/favorite_model.dart';
import 'package:english_lists/app/shared/models/historic_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'shared/models/words_model.dart';

class AppRepository extends GetConnect{

  FirebaseFirestore firebase = FirebaseFirestore.instance;

  Future getWords()async{
    List<WordsModel> words = [];
    final String response = await rootBundle.loadString('assets/data/words_dictionary.json');
    final data = await json.decode(response);
    data.forEach((key,value){
      words.add(WordsModel(title: key,quantity: value));
    });
    return words;
  }

  postFavorite(String word,String userId){
    firebase.collection('users').doc(userId).collection('favorites').doc(word).set({
      'word': word
    });
  }

  postHistoric(String word,String userId){
    firebase.collection('users').doc(userId).collection('historic').doc(word).set({
      'word': word,
      'views': 1,
      'update_date': DateTime.now()
    });
  }

  putHistoric(HistoricModel historic,String userId){
    firebase.collection('users').doc(userId).collection('historic').doc(historic.id).set(historic.toJson());
  }

  removeFavorite(String word,String userId){
    firebase.collection('users').doc(userId).collection('favorites').doc(word).delete();
  }

  Stream<List<FavoriteModel>> getFavorites(String userId){
    return firebase.collection('users').doc(userId).collection('favorites').snapshots().asyncMap((event){
      List<FavoriteModel> favorites = [];
      for (var element in event.docs) {
        favorites.add(FavoriteModel.fromFirebase(element));
      }
      return favorites;
    });
  }

  Stream<List<HistoricModel>> getHistoric(String userId){
    return firebase.collection('users').doc(userId).collection('historic').snapshots().asyncMap((event){
      List<HistoricModel> historic = [];
      for (var element in event.docs) {
        historic.add(HistoricModel.fromFirebase(element));
      }
      if(historic.isNotEmpty && historic.length > 1){
        historic.sort((a,b)=> b.updateDate!.compareTo(a.updateDate!));
      }
      return historic;
    });
  }

}