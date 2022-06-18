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

  Future<ContactModel?> updateContact(ContactModel model, File file) async {
    try {
      FormData formData = FormData.fromMap({
        "ppUrl": await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last),
        "name": model.name,
        "departmant": model.departmant,
        "phoneNumber": model.phoneNumber,
        "email": model.email,
        "address": model.address,
      });
      print("/contacts/update/" +
          SharedPrefHelper.prefInstance.getString("_id").toString());
      final response = await _networkManager.patch(
          "/contacts/update/" +
              SharedPrefHelper.prefInstance.getString("_id").toString(),
          data: formData);
      return ContactModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return null;
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
