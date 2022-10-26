// To parse required this.JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.status,
    required this.data,
  });

  bool status;
  Categories data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    status: json["status"],
    data: Categories.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Categories {
  Categories({
    required this.categories,
  });

  List<Category> categories;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    required this.id,
    required this.nameEn,
    required this.nameBn,
    required this.slug,
    required this.icon,
    required this.color,
    required this.isTop,
    required this.isActive,
    required this.priority,
    required this.name,
  });

  int id;
  String nameEn;
  String nameBn;
  String slug;
  String icon;
  String color;
  int isTop;
  int isActive;
  int priority;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    nameEn: json["name_en"],
    nameBn: json["name_bn"],
    slug: json["slug"],
    icon: json["icon"],
    color: json["color"],
    isTop: json["is_top"],
    isActive: json["is_active"],
    priority: json["priority"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "name_bn": nameBn,
    "slug": slug,
    "icon": icon,
    "color": color,
    "is_top": isTop,
    "is_active": isActive,
    "priority": priority,
    "name": name,
  };
}
