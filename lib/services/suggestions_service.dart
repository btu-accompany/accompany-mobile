import 'dart:io';

import 'package:accompany/models/suggestions_model.dart';
import 'package:dio/dio.dart';

import 'shared_service.dart';

class SuggestionService {
  late final _networkManager;
  SuggestionService() {
    _networkManager = Dio(BaseOptions(baseUrl: "http://10.0.2.2:3000/"));
    initShared();
    _networkManager.options.headers['auth-token'] =
        SharedPrefHelper.prefInstance.getString("token");
  }

  initShared() async {
    await SharedPrefHelper.createInstance();
  }

  Future<List<SuggestionsModel>?> fetchSuggestions() async {
    try {
      final response = await _networkManager.get("/suggestions");
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => SuggestionsModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }

  Future<bool?> postSuggestions(SuggestionsModel model) async {
    try {
      final response = await _networkManager.post("/suggestions", data: model);
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print(e);
    }

    return null;
  }
}
