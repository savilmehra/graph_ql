import 'package:clean_framework/clean_framework_defaults.dart';

class CartResponse  extends   JsonResponseModel{
  Cart? cart;

  CartResponse({this.cart});

  CartResponse.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart?.toJson();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [cart];
}

class Cart {
  String? id;
  String? email;
  int? totalQuantity;
  List<Items>? items;

  Cart({
    this.id,
    this.email,
    this.totalQuantity,
    this.items,
  });

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    totalQuantity = json['total_quantity'];

    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['total_quantity'] = this.totalQuantity;

    if (this.items != null) {
      data['items'] = this.items?.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Items {
  String? id;

  Product? product;
  int? quantity;

  String? message;
  String? senderName;
  String? senderEmail;
  String? recipientName;
  String? recipientEmail;

  Items(
      {this.id,
      this.product,
      this.quantity,
      this.message,
      this.senderName,
      this.senderEmail,
      this.recipientName,
      this.recipientEmail});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];

    message = json['message'];
    senderName = json['sender_name'];
    senderEmail = json['sender_email'];
    recipientName = json['recipient_name'];
    recipientEmail = json['recipient_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    if (this.product != null) {
      data['product'] = this.product?.toJson();
    }
    data['quantity'] = this.quantity;

    data['message'] = this.message;
    data['sender_name'] = this.senderName;
    data['sender_email'] = this.senderEmail;
    data['recipient_name'] = this.recipientName;
    data['recipient_email'] = this.recipientEmail;
    return data;
  }

  String get senderContent {
    String sender = "";
    if (senderName != null) {
      sender = senderName ?? '';
      if (senderEmail != null) sender += " <${senderEmail}>";
    }
    return sender;
  }

  String get recipient {
    String recipient = "";
    if (senderName != null) {
      recipient = recipientName ?? '';
      if (recipientEmail != null) recipient += " <${recipientEmail}>";
    }
    return recipient;
  }
}

class ProductImage {
  String? url;

  ProductImage({this.url});

  ProductImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class Product {
  String? name;
  String? sku;
  ProductImage? image;
  String? stockStatus;

  Product({
    this.name,
    this.sku,
    this.image,
    this.stockStatus,
  });

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sku = json['sku'];
    image =
        json['image'] != null ? new ProductImage.fromJson(json['image']) : null;
    stockStatus = json['stock_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sku'] = this.sku;
    if (this.image != null) {
      data['image'] = this.image?.toJson();
    }
    data['stock_status'] = this.stockStatus;

    return data;
  }
}
