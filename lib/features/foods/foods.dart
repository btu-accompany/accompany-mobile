import 'package:flutter/material.dart';

class FoodListView extends StatefulWidget {
  const FoodListView({Key? key}) : super(key: key);

  @override
  State<FoodListView> createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Yemek Listesi/Nav Bar'ı test etmek için yazildi"),
      ),
    );
  }
}
