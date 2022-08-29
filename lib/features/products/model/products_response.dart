
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../cart/model/cart_response.dart';





class ProductResponse extends   JsonResponseModel {
  String? sTypename;
  Products? products;

  ProductResponse({this.sTypename, this.products});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [sTypename,products];
}
class GridViewItems {
  int? id;
  String? sku;
  String? name;
  String? urlKey;
  String? stockStatus;
  String? sTypename;
  ProductImage? image;

  PriceRange? priceRange;
  double? specialPrice;
  String? specialToDate;
  String? specialFromDate;
  List<Null>? priceTiers;


  GridViewItems(
      {this.id,
        this.sku,
        this.name,
        this.urlKey,
        this.stockStatus,
        this.sTypename,
        this.image,

        this.priceRange,

        this.specialPrice,
        this.specialToDate,
        this.specialFromDate,
        this.priceTiers});

  GridViewItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    name = json['name'];
    urlKey = json['url_key'];
    stockStatus = json['stock_status'];
    sTypename = json['__typename'];
    image =
    json['image'] != null ? new ProductImage.fromJson(json['image']) : null;

    priceRange = json['price_range'] != null
        ? new PriceRange.fromJson(json['price_range'])
        : null;
    specialPrice =
    json['special_price'] != null ? json['special_price'].toDouble() : 0.0;
    specialToDate = json['special_to_date'];
    specialFromDate = json['special_from_date'];
    if (json['price_tiers'] != null) {
      priceTiers = <Null>[];
      json['price_tiers'].forEach((v) {
        // priceTiers.add(new Null.fromJson(v));
      });
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['name'] = this.name;
    data['url_key'] = this.urlKey;
    data['stock_status'] = this.stockStatus;
    data['__typename'] = this.sTypename;
    if (this.image != null) {
      data['image'] = this.image?.toJson();
    }

    if (this.priceRange != null) {
      data['price_range'] = this.priceRange?.toJson();
    }
    data['special_price'] = this.specialPrice;
    data['special_to_date'] = this.specialToDate;
    data['special_from_date'] = this.specialFromDate;
    if (this.priceTiers != null) {
      // data['price_tiers'] = this.priceTiers.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
class Products extends   JsonResponseModel{
  String? sTypename;
  List<GridViewItems>? gridItem;
  List<Items>? items;
  int? totalCount;
  List<Aggregations>? aggregations;
  PageInfo? pageInfo;

  Products(
      {this.sTypename,
        this.items,
        this.gridItem,
        this.totalCount,
        this.aggregations,
        this.pageInfo});

  Products.fromJson(Map<String, dynamic> json) {

    if (json['items'] != null) {
      gridItem = <GridViewItems>[];
      json['items'].forEach((v) {
        gridItem?.add(new GridViewItems.fromJson(v));
      });
    }
    sTypename = json['__typename'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    totalCount = json['total_count'];
    if (json['aggregations'] != null) {
      aggregations = <Aggregations>[];
      json['aggregations'].forEach((v) {
        aggregations!.add(new Aggregations.fromJson(v));
      });
    }
    pageInfo = json['page_info'] != null
        ? new PageInfo.fromJson(json['page_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['total_count'] = this.totalCount;
    if (this.aggregations != null) {
      data['aggregations'] = this.aggregations!.map((v) => v.toJson()).toList();
    }
    if (this.pageInfo != null) {
      data['page_info'] = this.pageInfo!.toJson();
    }
    return data;
  }

  @override

  List<Object?> get props => [items,totalCount];
}

class Items {
  int? id;
  String? sku;
  String? name;
  String? urlKey;
  String? stockStatus;
  String? sTypename;
  Image? image;
  Image? smallImage;
  Image? thumbnail;


  List<String>? priceTiers;

  Items(
      {this.id,
        this.sku,
        this.name,
        this.urlKey,
        this.stockStatus,
        this.sTypename,
        this.image,
        this.smallImage,
        this.thumbnail,


        this.priceTiers});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    name = json['name'];
    urlKey = json['url_key'];
    stockStatus = json['stock_status'];
    sTypename = json['__typename'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    smallImage = json['small_image'] != null
        ? new Image.fromJson(json['small_image'])
        : null;
    thumbnail = json['thumbnail'] != null
        ? new Image.fromJson(json['thumbnail'])
        : null;

    if (json['price_tiers'] != null) {
      priceTiers = <String>[];
      json['price_tiers'].forEach((v) {
        priceTiers!.add("new String.fromJson(v)");
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['name'] = this.name;
    data['url_key'] = this.urlKey;
    data['stock_status'] = this.stockStatus;
    data['__typename'] = this.sTypename;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.smallImage != null) {
      data['small_image'] = this.smallImage!.toJson();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }

    if (this.priceTiers != null) {
      data['price_tiers'] = this.priceTiers!.map((v) => "v.toJson()").toList();
    }
    return data;
  }
}

class Image {
  String? sTypename;
  String? url;
  String? label;
  String? position;

  Image({this.sTypename, this.url, this.label, this.position});

  Image.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    url = json['url'];
    label = json['label'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['url'] = this.url;
    data['label'] = this.label;
    data['position'] = this.position;
    return data;
  }
}

class PriceRange {
  String? sTypename;
  MinimumPrice? minimumPrice;
  MinimumPrice? maximumPrice;

  PriceRange({this.sTypename, this.minimumPrice, this.maximumPrice});

  PriceRange.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    minimumPrice = json['minimum_price'] != null
        ? new MinimumPrice.fromJson(json['minimum_price'])
        : null;
    maximumPrice = json['maximum_price'] != null
        ? new MinimumPrice.fromJson(json['maximum_price'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.minimumPrice != null) {
      data['minimum_price'] = this.minimumPrice!.toJson();
    }
    if (this.maximumPrice != null) {
      data['maximum_price'] = this.maximumPrice!.toJson();
    }
    return data;
  }
}

class MinimumPrice {
  String? sTypename;
  RegularPrice? regularPrice;
  RegularPrice? finalPrice;
  Discount? discount;

  MinimumPrice(
      {this.sTypename, this.regularPrice, this.finalPrice, this.discount});

  MinimumPrice.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    regularPrice = json['regular_price'] != null
        ? new RegularPrice.fromJson(json['regular_price'])
        : null;
    finalPrice = json['final_price'] != null
        ? new RegularPrice.fromJson(json['final_price'])
        : null;
    discount = json['discount'] != null
        ? new Discount.fromJson(json['discount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.regularPrice != null) {
      data['regular_price'] = this.regularPrice!.toJson();
    }
    if (this.finalPrice != null) {
      data['final_price'] = this.finalPrice!.toJson();
    }
    if (this.discount != null) {
      data['discount'] = this.discount!.toJson();
    }
    return data;
  }
}

class RegularPrice {
  String? sTypename;
  int? value;
  String? currency;

  RegularPrice({this.sTypename, this.value, this.currency});

  RegularPrice.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    value = json['value'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['value'] = this.value;
    data['currency'] = this.currency;
    return data;
  }
}

class Discount {
  String? sTypename;
  num? amountOff;
  num? percentOff;

  Discount({this.sTypename, this.amountOff, this.percentOff});

  Discount.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    amountOff = json['amount_off'];
    percentOff = json['percent_off'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['amount_off'] = this.amountOff;
    data['percent_off'] = this.percentOff;
    return data;
  }
}

class Aggregations {
  String? sTypename;
  String? attributeCode;
  String? label;
  int? count;
  List<Options>? options;

  Aggregations(
      {this.sTypename,
        this.attributeCode,
        this.label,
        this.count,
        this.options});

  Aggregations.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    attributeCode = json['attribute_code'];
    label = json['label'];
    count = json['count'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['attribute_code'] = this.attributeCode;
    data['label'] = this.label;
    data['count'] = this.count;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String? sTypename;
  int? count;
  String? label;
  String? value;

  Options({this.sTypename, this.count, this.label, this.value});

  Options.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    count = json['count'];
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['count'] = this.count;
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}

class PageInfo {
  String? sTypename;
  int? pageSize;

  PageInfo({this.sTypename, this.pageSize});

  PageInfo.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    pageSize = json['page_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['page_size'] = this.pageSize;
    return data;
  }
}





/*
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
*/
