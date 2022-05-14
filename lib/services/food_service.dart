import 'dart:io';

import 'package:dio/dio.dart';

import '../models/food_model.dart';

abstract class IFoodService {
  Future<List<FoodModel>?> fetchFoods();
}

class FoodService implements IFoodService {
  final String _foodApiUrl = "https://accompany-foods.herokuapp.com/";
  final Dio _networkManager;

  FoodService() : _networkManager = Dio();

  @override
  Future<List<FoodModel>?> fetchFoods() async {
    try {
      final response = await _networkManager.get(_foodApiUrl);
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => FoodModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
