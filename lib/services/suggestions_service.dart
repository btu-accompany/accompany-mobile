import 'dart:io';

import 'package:accompany/models/suggestions_model.dart';
import 'package:dio/dio.dart';

class SuggestionService {
  late final _networkManager;
  SuggestionService() {
    _networkManager = Dio(BaseOptions(baseUrl: "http://10.0.2.2:3000/"));
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
}
