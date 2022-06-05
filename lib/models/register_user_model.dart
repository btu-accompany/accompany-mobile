class RegisterUserModel {
  String? ppUrl;
  String? fcmToken;
  String? name;
  String? surname;
  String? departmant;
  String? email;
  String? address;
  String? password;
  String? role;
  String? phoneNumber;

  RegisterUserModel(
      {this.ppUrl,
      this.fcmToken,
      this.name,
      this.surname,
      this.departmant,
      this.email,
      this.address,
      this.password,
      this.role,
      this.phoneNumber});

  RegisterUserModel.fromJson(Map<String, dynamic> json) {
    ppUrl = json['ppUrl'];
    fcmToken = json['fcmToken'];
    name = json['name'];
    surname = json['surname'];
    departmant = json['departmant'];
    email = json['email'];
    address = json['address'];
    password = json['password'];
    role = json['role'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ppUrl'] = this.ppUrl;
    data['fcmToken'] = this.fcmToken;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['departmant'] = this.departmant;
    data['email'] = this.email;
    data['address'] = this.address;
    data['password'] = this.password;
    data['role'] = this.role;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
