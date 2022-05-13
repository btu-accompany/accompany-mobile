import 'dart:convert';

import 'package:accompany/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'foods_view.dart';

abstract class FoodViewModel extends State<FoodListView> {
  final String foodApiUrl = "https://accompany-foods.herokuapp.com/";

  int currentIndex = 0;
  late Future<FoodsModel> foods;
  List<FoodModel> foodList = [];
  Future<FoodsModel> fetchFoods() async {
    final response = await http.get(Uri.parse(foodApiUrl));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return FoodsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load foods');
    }
  }

  void convertFutureToList() async {
    var object = await foods;
    foodList = object.results;
    setState(() {});
  }

  @override
  void initState() {
    foods = fetchFoods();
    convertFutureToList();
    super.initState();
  }
}
