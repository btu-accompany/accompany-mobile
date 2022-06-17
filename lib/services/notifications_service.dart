import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_service.dart';

class NotificationsService {
  late final Dio _networkManager;
  // NearMissService()
  //     : _networkManager = Dio(BaseOptions(baseUrl: "http://10.0.2.2:3000/"));

  NotificationsService() {
    _networkManager = Dio(BaseOptions(baseUrl: "http://10.0.2.2:3000/"));

    _networkManager.options.headers['auth-token'] =
        SharedPrefHelper.prefInstance.getString("token");
  }

  Future<List<dynamic>?> getNotifications() async {
    try {
      final response = await _networkManager.get("/notifications");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas;
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> postNotifications(
      String senderName, String description, List<String> receivers) async {
    try {
      final response = await _networkManager.post(
        "/notifications",
        data: {
          "senderName": senderName,
          "description": description,
          "receivers": receivers,
        },
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print(e.toString());
    }
    return false;
  }
}
