import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:http_parser/http_parser.dart';

import '../models/categories_model.dart';
import '../models/login_model.dart';
import '../storage.dart';

class NetworkHelper {
  final url;

  NetworkHelper(this.url);

  BaseOptions option1 =
      BaseOptions(connectTimeout: 10000, receiveTimeout: 10000, headers: {
    'Content-Type': 'application/json',
  });

  Dio? dio;
  // BaseOptions option =
  //     BaseOptions(connectTimeout: 10000, receiveTimeout: 10000, headers: {
  //   //'Content-Type': 'application/json',
  //
  //   // 'Authorization': 'Bearer ${Storage.get_accessToken()}',
  // });

  // Future login(String email, password) async {
  //   dio = Dio(option);
  //   try {
  //     Response? response =
  //         await dio?.post(url, data: {'email': email, 'password': password});
  //     LogInApiRes loginApiRes=LogInApiRes.fromJson(response?.data);

  //     if (response?.statusCode == 200 || response?.statusCode == 201) {

  //       // print("access:${loginApiRes.tokens!.accessToken}");
  //       // print("refresh:${loginApiRes.tokens!.refreshToken}");

  //       print(response?.data);

  //       return response?.data;
  //     } else {
  //       return {'success': false, 'message': 'Failed'};
  //     }
  //   } on DioError catch (e) {
  //     print(e.message.toString());
  //     return {'success': false, 'message': e.message};
  //   }
  // }

  Future signup(String firstname, lastname, email, password, username) async {
    dio = Dio();
    try {
      Response? response = await dio?.post(url, data: {
        "first_name": firstname,
        "last_name": lastname,
        "email": email,
        "password": password,
        "username": username
      }, queryParameters: {
        "consumer_key": "ck_994a21efc62a2e77a1a8b645e8c5f3b85d7d37e3",
        "consumer_secret": "cs_cf1a434e7a13a5795b0baacc7e838bcfc3d4e1bc"
      });
      //CustomerModel model = CustomerModel.fromJson(response?.data);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print(response?.data);

        return response!.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print("error: ${e.message.toString()}");
      return {'success': false, 'message': e.message};
    }
  }

  SharedPreferencesInit() async {
    await Storage.init();
  }

  Future login(String username, password) async {
    dio = Dio(option1);
    try {
      Response? response = await dio
          ?.post(url, data: {'username': username, 'password': password});
      LoginUsernameResponse loginRes =
          LoginUsernameResponse.fromJson(response?.data);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future categories() async {
    dio = Dio(option1);
    List data = [];
    try {
      var queryParams = {
        "consumer_key": "ck_994a21efc62a2e77a1a8b645e8c5f3b85d7d37e3",
        "consumer_secret": "cs_cf1a434e7a13a5795b0baacc7e838bcfc3d4e1bc"
      };

      Response? response = await dio?.get(url, queryParameters: queryParams);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        List<CategoriesResponse> categRes = [];
        //print("categRes: $categRes");

        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future addtocart(String id, product_name, price, quantity) async {
    dio = Dio();
    try {
      Response? response = await dio?.post(url, data: {
        "id": id,
        "regular_price": product_name,
        "sale_price": price,
        "quantity": quantity
      }, queryParameters: {
        "consumer_key": "ck_994a21efc62a2e77a1a8b645e8c5f3b85d7d37e3",
        "consumer_secret": "cs_cf1a434e7a13a5795b0baacc7e838bcfc3d4e1bc"
      });

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print(response?.data);

        return response!.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print("error: ${e.message.toString()}");
      return {'success': false, 'message': e.message};
    }
  }
}
