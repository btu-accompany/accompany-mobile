import 'dart:io';

import 'package:accompany/models/news_model.dart';
import 'package:dio/dio.dart';

import 'shared_service.dart';

class NewsService {
  late final Dio _networkManager;

  // NewsService()
  //     : _networkManager = Dio(BaseOptions(baseUrl: "http://10.0.2.2:3000/"));

  NewsService() {
    _networkManager = Dio(BaseOptions(baseUrl: "http://10.0.2.2:3000/"));
    initShared();
    _networkManager.options.headers['auth-token'] =
        SharedPrefHelper.prefInstance.getString("token");
  }
  initShared() async {
    await SharedPrefHelper.createInstance();
  }

  Future<List<NewsModel>?> fetchNews() async {
    try {
      final response = await _networkManager.get("/news");

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => NewsModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
