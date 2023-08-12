// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'package:easy_money/app/data/models/user_model.dart';


List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.isSold,
    required this.createdAt,
    required this.updatedAt,
    required this.productImages,
    required this.user,
  });

  String id;
  String title;
  String price;
  String category;
  String description;
  bool isSold;
  DateTime createdAt;
  DateTime updatedAt;
  List<ProductImage> productImages;
  User user;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"].toString(),
    title: json["title"].toString(),
    price: json["price"].toString(),
    category: json["category"].toString(),
    description: json["description"].toString(),
    isSold: json["is_sold"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    productImages: List<ProductImage>.from(json["product_images"].map((x) => ProductImage.fromJson(x))),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "category": category,
    "description": description,
    "is_sold": isSold,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "product_images": List<dynamic>.from(productImages.map((x) => x.toJson())),
    "user": user.toJson(),
  };
}

List<ProductImage> productImageFromJson(String str) => List<ProductImage>.from(json.decode(str).map((x) => ProductImage.fromJson(x)));

class ProductImage {
  ProductImage({
    required this.path,
  });

  String path;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
  };
}