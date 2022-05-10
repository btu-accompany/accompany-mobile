class NearMissesModel {
  // bu nearmissleri içeren liste
  final List<NearMissModel> results;

  NearMissesModel({required this.results});

  factory NearMissesModel.fromJson(List<dynamic> json) => NearMissesModel(
        results: List<NearMissModel>.from(
            json.map((x) => NearMissModel.fromJson(x))),
      );
}

class NearMissModel {
  final String id;
  final String dateTime;
  final String title;
  final String description;
  final String? imageUrl;
  final String? ppUrl;

  NearMissModel(
      {required this.id,
      required this.dateTime,
      required this.title,
      required this.description,
      this.imageUrl,
      this.ppUrl});

  factory NearMissModel.fromJson(Map<String, dynamic> json) {
    return NearMissModel(
      id: json['_id'],
      dateTime: json['date'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['img'],
      ppUrl: json['ppUrl'],
    );
  }
}
