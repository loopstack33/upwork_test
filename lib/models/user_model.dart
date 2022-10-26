// To parse required this.JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators, prefer_if_null_operators

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.status,
    required this.data,
  });

  bool status;
  Data data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.user,
    required this.portfolioValue,
  });

  List<User> user;
  double? portfolioValue;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
    portfolioValue: json["portfolio_value"]==null?null: json["portfolio_value"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "user": List<dynamic>.from(user.map((x) => x.toJson())),
    "portfolio_value": portfolioValue==null?null:portfolioValue,
  };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.phoneConfirmed,
    required this.isActive,
    required this.gender,
    required this.accessToken,
    required this.referredByCode,
    required this.referralCode,
    required this.cashoutMethod,
    required this.cashoutValue,
  });

  int? id;
  String? name;
  String? phone;
  String? email;
  int? phoneConfirmed;
  int? isActive;
  String? gender;
  String? accessToken;
  String? referredByCode;
  String? referralCode;
  String? cashoutMethod;
  dynamic cashoutValue;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"]==null?null:json["id"],
    name: json["name"]==null?null:json["name"],
    phone: json["phone"]==null?null:json["phone"],
    email: json["email"]==null?null: json["email"],
    phoneConfirmed: json["phone_confirmed"]==null?null:json["phone_confirmed"],
    isActive: json["is_active"]==null?null:json["is_active"],
    gender: json["gender"]==null?null:json["gender"],
    accessToken: json["access_token"]==null?null:json["access_token"],
    referredByCode: json["referred_by_code"]==null?null: json["referred_by_code"],
    referralCode: json["referral_code"]==null?null:json["referral_code"],
    cashoutMethod: json["cashout_method"]==null?null: json["cashout_method"],
    cashoutValue: json["cashout_value"]==null?null:json["cashout_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id==null?null:id,
    "name": name==null?null:name,
    "phone": phone==null?null:phone,
    "email": email==null?null:email,
    "phone_confirmed": phoneConfirmed==null?null:phoneConfirmed,
    "is_active": isActive==null?null:isActive,
    "gender": gender==null?null:gender,
    "access_token": accessToken==null?null:accessToken,
    "referred_by_code": referredByCode==null?null:referredByCode,
    "referral_code": referralCode==null?null:referralCode,
    "cashout_method": cashoutMethod==null?null:cashoutMethod,
    "cashout_value": cashoutValue==null?null:cashoutValue,
  };
}
