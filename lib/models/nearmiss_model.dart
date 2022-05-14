class NearmissModel {
  String? id;
  String? title;
  String? description;
  String? img;
  String? date;

  NearmissModel({this.id, this.title, this.description, this.img, this.date});

  NearmissModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    img = json['img'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['img'] = img;
    data['date'] = date;
    return data;
  }
}
