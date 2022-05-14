import 'package:flutter/material.dart';

import 'foods_view_model.dart';

class FoodListView extends StatefulWidget {
  const FoodListView({Key? key}) : super(key: key);

  @override
  State<FoodListView> createState() => _FoodListViewState();
}

class _FoodListViewState extends FoodViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[400],
                  child: const Text(
                    "23-27 Mayıs 2022 Yemek Listesi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 16, left: 16, right: 16, bottom: 50),
                  child: Column(
                    children: [
                      foodCard(
                        "Çorba",
                        foodList?[currentIndex].corba.toString() ?? "",
                      ),
                      foodCard(
                        "Ana Yemek",
                        foodList?[currentIndex].anaYemek.toString() ?? "",
                      ),
                      foodCard(
                        "Yardımcı Yemek",
                        foodList?[currentIndex].yrdYemek.toString() ?? "",
                      ),
                      foodCard(
                        "Dördüncü Kap",
                        foodList?[currentIndex].kap4.toString() ?? "",
                      ),
                    ],
                  ),
                ),
                Container(
                  child: buttonsRow(),
                ),
              ],
            ),
    );
  }

  Card foodCard(String type, String name) {
    return Card(
      color: Colors.greenAccent,
      child: ListTile(
        title: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            type + ": " + name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Container buttonsRow() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          dayButton("23", 0),
          dayButton("24", 1),
          dayButton("25", 2),
          dayButton("26", 3),
          dayButton("27", 4),
        ],
      ),
    );
  }

  ElevatedButton dayButton(String day, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Text(
        day,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
