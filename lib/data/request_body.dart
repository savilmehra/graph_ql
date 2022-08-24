class Thumbnail {
  String? query;

  Thumbnail({this.query});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    query = json['query'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query'] = this.query;
    return data;
  }
}
