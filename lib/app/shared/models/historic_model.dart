import 'package:cloud_firestore/cloud_firestore.dart';

class HistoricModel {
  String? id;
  String? word;
  int? views;
  DateTime? updateDate;

  HistoricModel({this.id, this.word, this.views, this.updateDate});

  HistoricModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    word = json['word'];
    views = json['views'];
    updateDate = json['update_data'];
  }

  HistoricModel.fromFirebase(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    id = json.id;
    word = json.data()['word'];
    views = json.data()['views'];
    updateDate = json.data()['update_date'] == null ? null : json.data()['update_date'].toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word'] = word;
    data['views'] = views! + 1;
    data['update_date'] = DateTime.now();
    return data;
  }
}