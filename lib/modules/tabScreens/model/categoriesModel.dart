// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    this.categoryName,
    this.image,
  });

  String categoryName;
  String image;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    categoryName: json["categoryName"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "categoryName": categoryName,
    "image": image,
  };
}
