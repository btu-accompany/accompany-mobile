import 'dart:io';
import 'package:accompany/models/contact_model.dart';
import 'package:dio/dio.dart';

import 'shared_service.dart';

class ContactService {
  late final Dio _networkManager;
  ContactService() {
    _networkManager = Dio(BaseOptions(baseUrl: "http://10.0.2.2:3000/"));
    _networkManager.options.headers['auth-token'] =
        SharedPrefHelper.prefInstance.getString("token");
  }

  Future<List<ContactModel>?> fetchContacts() async {
    try {
      final response = await _networkManager.get("/contacts");

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => ContactModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<ContactModel?> fetchByPhoneNumber(String phoneNumber) async {
    try {
      final response = await _networkManager
          .get("/contacts/getbyphonenumber/" + phoneNumber.toString());
      if (response.statusCode == HttpStatus.ok) {
        return ContactModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
