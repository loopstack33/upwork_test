// To parse required this.JSON data, do
//
//     final brandsModel = brandsModelFromJson(jsonString);

import 'dart:convert';

BrandsModel brandsModelFromJson(String str) => BrandsModel.fromJson(json.decode(str));

String brandsModelToJson(BrandsModel data) => json.encode(data.toJson());

class BrandsModel {
  BrandsModel({
    required this.status,
    required this.data,
  });

  bool status;
  StoreData data;

  factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
    status: json["status"],
    data: StoreData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class StoreData {
  StoreData({
    required this.stores,
  });

  List<Store> stores;

  factory StoreData.fromJson(Map<String, dynamic> json) => StoreData(
    stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
  };
}

class Store {
  Store({
    required this.id,
    required this.nameEn,
    required this.nameBn,
    required this.slug,
    required this.url,
    required this.descriptionEn,
    required this.descriptionBn,
    required this.logo,
    required this.rating,
    required this.maxCashback,
    required this.percentNow,
    required this.percentOld,
    required this.notifiedIn,
    required this.cashbackIn,
    required this.isActive,
    required this.priority,
    required this.isTop,
    required this.categoryId,
    required this.name,
    required this.description,
  });

  int id;
  String nameEn;
  dynamic nameBn;
  String slug;
  String url;
  String descriptionEn;
  dynamic descriptionBn;
  String logo;
  int rating;
  String maxCashback;
  String percentNow;
  String percentOld;
  DateTime notifiedIn;
  String cashbackIn;
  int isActive;
  int priority;
  int isTop;
  int categoryId;
  String name;
  String description;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    nameEn: json["name_en"],
    nameBn: json["name_bn"],
    slug: json["slug"],
    url: json["url"],
    descriptionEn: json["description_en"],
    descriptionBn: json["description_bn"],
    logo: json["logo"],
    rating: json["rating"],
    maxCashback: json["max_cashback"],
    percentNow: json["percent_now"],
    percentOld: json["percent_old"],
    notifiedIn: DateTime.parse(json["notified_in"]),
    cashbackIn: json["cashback_in"],
    isActive: json["is_active"],
    priority: json["priority"],
    isTop: json["is_top"],
    categoryId: json["category_id"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "name_bn": nameBn,
    "slug": slug,
    "url": url,
    "description_en": descriptionEn,
    "description_bn": descriptionBn,
    "logo": logo,
    "rating": rating,
    "max_cashback": maxCashback,
    "percent_now": percentNow,
    "percent_old": percentOld,
    "notified_in": notifiedIn.toIso8601String(),
    "cashback_in": cashbackIn,
    "is_active": isActive,
    "priority": priority,
    "is_top": isTop,
    "category_id": categoryId,
    "name": name,
    "description": description,
  };
}


