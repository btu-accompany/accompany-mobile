import 'dart:io';
import 'package:accompany/models/login_request_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  late final Dio _networkManager;
  LoginService()
      : _networkManager = Dio(BaseOptions(baseUrl: "http://10.0.2.2:3000/"));

  Future<bool> login(LoginRequestModel model) async {
    try {
      final response = await _networkManager.post(
        "/auth/login",
        data: {
          "phoneNumber": model.phoneNumber,
          "password": model.password,
        },
      );
      print("evetevet"+ response.data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", response.data);
      return true;

    } catch (e) {
      
      print("mustafa");
      print(e.toString());
      return false;
    }

  }
}
