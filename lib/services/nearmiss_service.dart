import 'dart:io';

import 'package:accompany/models/nearmiss_model.dart';
import 'package:dio/dio.dart';

import 'shared_service.dart';

class NearMissService {
  late final Dio _networkManager;

  NearMissService() {
    _networkManager = Dio(BaseOptions(baseUrl: "http://10.0.2.2:3000/"));
    _networkManager.options.headers['auth-token'] =
        SharedPrefHelper.prefInstance.getString("token");
  }

  Future<bool> postNearMiss(NearmissModel model, File file) async {
    try {
      FormData formData = FormData.fromMap({
        "img": await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last),
        "title": model.title,
        "description": model.description,
        "senderName": model.senderName
      });

      final response = await _networkManager.post("/nearmiss", data: formData);

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  Future<bool> notifyUsersAboutNearMiss(NearmissModel model) async {
    try {
      final response = await _networkManager.post(
        "/nearmiss/notify-users",
        data: {
          "title": model.title,
          "desc": model.description,
        },
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  Future<List<NearmissModel>?> fetchNearmisses() async {
    try {
      final response = await _networkManager.get("/nearmiss");

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => NearmissModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
