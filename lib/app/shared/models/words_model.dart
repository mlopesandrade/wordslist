class WordsModel {
  String? title;
  int? quantity;

  WordsModel({this.title, this.quantity});

  WordsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['quantity'] = quantity;
    return data;
  }
}