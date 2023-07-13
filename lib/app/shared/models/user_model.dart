import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? name;
  String? email;

  UserModel(
      {
        this.uid,
        this.name,
        this.email
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
  }

  UserModel.fromFirebase(DocumentSnapshot json) {
    uid = json.id;
    name = json['name'] ?? '';
    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
