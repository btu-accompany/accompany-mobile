class FoodModel {
  String? id;
  String? date;
  String? anaYemek;
  String? corba;
  String? yrdYemek;
  String? kap4;

  FoodModel(
      {this.id,
      this.date,
      this.anaYemek,
      this.corba,
      this.yrdYemek,
      this.kap4});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    date = json['date'];
    anaYemek = json['AnaYemek'];
    corba = json['Corba'];
    yrdYemek = json['YrdYemek'];
    kap4 = json['Kap_4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['date'] = date;
    data['AnaYemek'] = anaYemek;
    data['Corba'] = corba;
    data['YrdYemek'] = yrdYemek;
    data['Kap_4'] = kap4;
    return data;
  }
}
