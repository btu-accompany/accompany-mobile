class ContactModel {
  String? id;
  String? ppUrl;
  String? fcmToken;
  String? name;
  String? surname;
  String? departmant;
  String? email;
  String? address;
  String? password;
  String? phoneNumber;
  String? date;

  ContactModel(
      {this.id,
      this.ppUrl,
      this.fcmToken,
      this.name,
      this.surname,
      this.departmant,
      this.email,
      this.address,
      this.password,
      this.phoneNumber,
      this.date,});

  ContactModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    ppUrl = json['ppUrl'];
    fcmToken = json['fcmToken'];
    name = json['name'];
    surname = json['surname'];
    departmant = json['departmant'];
    email = json['email'];
    address = json['address'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['ppUrl'] = ppUrl;
    data['fcmToken'] = fcmToken;
    data['name'] = name;
    data['surname'] = surname;
    data['departmant'] = departmant;
    data['email'] = email;
    data['address'] = address;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['date'] = date;
    return data;
  }
}