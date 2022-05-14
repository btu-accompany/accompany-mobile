class BusRouteModel {
  String? durakKodu;
  String? durakAdi;
  String? gecisSaati;

  BusRouteModel({this.durakKodu, this.durakAdi, this.gecisSaati});

  BusRouteModel.fromJson(Map<String, dynamic> json) {
    durakKodu = json['DurakKodu'];
    durakAdi = json['DurakAdi'];
    gecisSaati = json['GecisSaati'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DurakKodu'] = durakKodu;
    data['DurakAdi'] = durakAdi;
    data['GecisSaati'] = gecisSaati;
    return data;
  }
}
