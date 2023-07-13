import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteModel {
  String? id;
  String? word;

  FavoriteModel({this.word});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    word = json['word'];
  }

  FavoriteModel.fromFirebase(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    id = json.id;
    word = json.data()['word'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word'] = word;
    return data;
  }
}