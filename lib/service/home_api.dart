import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../enums/api_constants.dart';
import '../models/brands_model.dart';
import '../models/categories_model.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class HomeService {

  //GET USER API
  Future<Data> getUser() async {
    final url = Uri.parse("${ApiConstants.baseUrl}/userinfo/7");
    try {
      http.Response response = await http.get(url, headers: ApiConstants.headers);
      Map<String, dynamic> jsonResponse = Map<String, dynamic>.from(json.decode(response.body));

      if (response.statusCode == 200 && json.decode(response.body)['status'].toString()=="true") {
        return Data.fromJson(jsonResponse['data']);
      }
      else{
        Get.snackbar("Error", "Error Occurred, Can't Fetch Data.",
            colorText: Colors.white,backgroundColor: Colors.red);
      }
    } catch (e) {
      log(e.toString());
    }
    return throw Exception("No Data Found");
  }

  ///GET BRANDS API
  Future<List<Store>>? getBrands() async {
    try {
      final response = await http.get(
          Uri.parse("${ApiConstants.baseUrl}/storelist/en"),
          headers: ApiConstants.headers);

      Map<String, dynamic> jsonResponse = Map<String, dynamic>.from(json.decode(response.body));
      List<dynamic> data = jsonResponse["data"]["stores"];

      if (response.statusCode == 200  && json.decode(response.body)['status'].toString()=="true") {
        return data.map((data) => Store.fromJson(data)).toList();
      } else {
        throw Exception('Unexpected error occurred!');
      }
    } on SocketException {
      log("No Internet");
    } on HttpException {
      log("Http Exception");
    } on FormatException {
      log("Format Exception");
    }
    return throw Exception("No Data Found");
  }

  ///GET CATEGORIES API
  Future<List<Category>>? getCategories() async {
    try {
      final response = await http.get(
          Uri.parse("${ApiConstants.baseUrl}/gettopcategories/en"),
          headers: ApiConstants.headers);

      Map<String, dynamic> jsonResponse = Map<String, dynamic>.from(json.decode(response.body));
      List<dynamic> data = jsonResponse["data"]["categories"];

      if (response.statusCode == 200  && json.decode(response.body)['status'].toString()=="true") {
        return data.map((data) => Category.fromJson(data)).toList();
      } else {
        throw Exception('Unexpected error occurred!');
      }
    } on SocketException {
      log("No Internet");
    } on HttpException {
      log("Http Exception");
    } on FormatException {
      log("Format Exception");
    }
    return throw Exception("No Data Found");
  }

}