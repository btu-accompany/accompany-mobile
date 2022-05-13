class FoodsModel {
  // bu nearmissleri içeren liste
  final List<FoodModel> results;

  FoodsModel({required this.results});

  factory FoodsModel.fromJson(List<dynamic> json) => FoodsModel(
        results: List<FoodModel>.from(
          json.map(
            (x) => FoodModel.fromJson(x),
          ),
        ),
      );
}

class FoodModel {
  final String id;
  final String dateTime;
  final String anaYemek;
  final String corba;
  final String yrdYemek;
  final String kap4;

  FoodModel(
      {required this.id,
      required this.dateTime,
      required this.anaYemek,
      required this.corba,
      required this.yrdYemek,
      required this.kap4});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
        id: json["_id"],
        dateTime: json["date"],
        anaYemek: json["AnaYemek"],
        corba: json["Corba"],
        yrdYemek: json["YrdYemek"],
        kap4: json["Kap_4"]);
  }
}
