import 'package:clean_framework/clean_framework_defaults.dart';

class ProductsResponse {
  ProdustsData? data;
  Extensions? extensions;

  ProductsResponse({this.data, this.extensions});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ProdustsData.fromJson(json['data']) : null;
    extensions = json['extensions'] != null
        ? new Extensions.fromJson(json['extensions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.extensions != null) {
      data['extensions'] = this.extensions!.toJson();
    }
    return data;
  }
}

class ProdustsData extends JsonResponseModel  {
  Products? products;

  ProdustsData({this.products});

  ProdustsData.fromJson(Map<String, dynamic> json) {
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}

class Products {
  List<Edges>? edges;

  Products({this.edges});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['edges'] != null) {
      edges = <Edges>[];
      json['edges'].forEach((v) {
        edges!.add(new Edges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.edges != null) {
      data['edges'] = this.edges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Edges {
  Node? node;

  Edges({this.node});

  Edges.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? new Node.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node!.toJson();
    }
    return data;
  }
}

class Node {
  String? id;
  String? name;
  String? description;
  Thumbnail? thumbnail;

  Node({this.id, this.name, this.description, this.thumbnail});

  Node.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    return data;
  }
}

class Thumbnail {
  String? url;

  Thumbnail({this.url});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class Extensions {
  Cost? cost;

  Extensions({this.cost});

  Extensions.fromJson(Map<String, dynamic> json) {
    cost = json['cost'] != null ? new Cost.fromJson(json['cost']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cost != null) {
      data['cost'] = this.cost!.toJson();
    }
    return data;
  }
}

class Cost {
  int? requestedQueryCost;
  int? maximumAvailable;

  Cost({this.requestedQueryCost, this.maximumAvailable});

  Cost.fromJson(Map<String, dynamic> json) {
    requestedQueryCost = json['requestedQueryCost'];
    maximumAvailable = json['maximumAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestedQueryCost'] = this.requestedQueryCost;
    data['maximumAvailable'] = this.maximumAvailable;
    return data;
  }
}
