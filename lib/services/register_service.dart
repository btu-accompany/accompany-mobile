import 'dart:io';

import 'package:dio/dio.dart';
import '../models/register_user_model.dart';

class RegisterService {
  late final Dio _networkManager;
  RegisterService()
      : _networkManager = Dio(BaseOptions(baseUrl: "http://10.0.2.2:3000/"));

  Future<bool> PostRegister(RegisterUserModel model) async {
    try {
      final response = await _networkManager.post(
        "/auth/register",
        data: {
        "ppUrl": model.ppUrl,
        "fcmToken": model.fcmToken,
        "name": model.name,
        "surname": model.surname,
        "departmant": model.departmant,
        "email": model.email,
        "address": model.address,
        "password": model.password,
        "role": model.role,
        "phoneNumber": model.phoneNumber,
        },
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  Future<List<RegisterUserModel>?> fetchUserInfos() async {
    try {
      final response = await _networkManager.get("/auth/register");

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => RegisterUserModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
