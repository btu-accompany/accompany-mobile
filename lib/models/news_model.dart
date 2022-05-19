class NewsModel {
  String? url;
  String? description;
  String? image;
  String? name;
  String? source;
  String? date;

  NewsModel(
      {this.url,
      this.description,
      this.image,
      this.name,
      this.source,
      this.date});

  NewsModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    description = json['description'];
    image = json['image'];
    name = json['name'];
    source = json['source'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['description'] = description;
    data['image'] = image;
    data['name'] = name;
    data['source'] = source;
    data['date'] = date;
    return data;
  }
}
