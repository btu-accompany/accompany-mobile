class LoginRequestModel {
  String? password;
  String? phoneNumber;

  LoginRequestModel({this.password, this.phoneNumber});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
