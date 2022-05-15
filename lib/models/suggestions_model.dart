class SuggestionsModel {
  String? id;
  String? type;
  String? name;
  String? fcmToken;
  String? surname;
  String? department;
  String? topic;
  String? content;
  String? ppUrl;
  String? phoneNumber;
  String? userId;
  String? userDepartment;
  String? date;

  SuggestionsModel(
      {this.id,
      this.type,
      this.name,
      this.fcmToken,
      this.surname,
      this.department,
      this.topic,
      this.content,
      this.ppUrl,
      this.phoneNumber,
      this.userId,
      this.userDepartment,
      this.date});

  SuggestionsModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    type = json['type'];
    name = json['name'];
    fcmToken = json['fcmToken'];
    surname = json['surname'];
    department = json['department'];
    topic = json['topic'];
    content = json['content'];
    ppUrl = json['ppUrl'];
    phoneNumber = json['phoneNumber'];
    userId = json['userId'];
    userDepartment = json['userDepartment'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['fcmToken'] = fcmToken;
    data['surname'] = surname;
    data['department'] = department;
    data['topic'] = topic;
    data['content'] = content;
    data['ppUrl'] = ppUrl;
    data['phoneNumber'] = phoneNumber;
    data['userId'] = userId;
    data['userDepartment'] = userDepartment;
    data['date'] = date;
    return data;
  }
}
