import 'package:accompany/models/food_model.dart';
import 'package:accompany/services/food_service.dart';
import 'package:flutter/material.dart';
import 'foods_view.dart';

abstract class FoodViewModel extends State<FoodListView> {
  int currentIndex = 0;
  bool _isLoading = false;
  List<FoodModel>? _foodList;
  late final IFoodService _foodService;

  @override
  void initState() {
    _foodService = FoodService();
    fetchFoods();
    super.initState();
  }

  //foodList Getter
  List<FoodModel>? get foodList {
    return _foodList;
  }

  //isLoading Getter
  bool get isLoading {
    return _isLoading;
  }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchFoods() async {
    _toggleLoading();
    _foodList = await _foodService.fetchFoods();
    _toggleLoading();
  }
}
