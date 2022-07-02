import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:http_parser/http_parser.dart';
import 'package:login_flow/models/AllProductRes.dart';
import 'package:login_flow/models/CataegoriesRes.dart';
import 'package:login_flow/models/Product_des_model.dart';
import 'package:login_flow/models/carouselProducts.dart';

import '../models/categoriesList.dart';
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
  BaseOptions option =
      BaseOptions(connectTimeout: 10000, receiveTimeout: 10000, headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_token()}',
  });

  Dio? dio1;
  BaseOptions option2 = BaseOptions(headers: {
    //'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_token()}',
    'X-Headless-CMS': true,
    'Nonce': '${Storage.get_noncetoken()}'
  });

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
  // BaseOptions option =
  //     BaseOptions(connectTimeout: 10000, receiveTimeout: 10000, headers: {
  //   'Content-Type': 'application/json',
  //   'Authorization': 'Bearer ${Storage.get_token()}',
  // });

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

  List<CataegoriesRes> cataegoriesres = [];

  Future<List<CataegoriesRes>> categories() async {
    dio = Dio(option1);
    List data = [];
    try {
      var queryParams = {
        "consumer_key": "ck_994a21efc62a2e77a1a8b645e8c5f3b85d7d37e3",
        "consumer_secret": "cs_cf1a434e7a13a5795b0baacc7e838bcfc3d4e1bc"
      };

      Response? response = await dio?.get(url, queryParameters: queryParams);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        for (Map i in response?.data) {
          cataegoriesres.add(CataegoriesRes.fromJson(i));
        }

        print(response?.data);

        return cataegoriesres;
      } else {
        return cataegoriesres;
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return cataegoriesres;
    }
  }

  Future product_des() async {
    dio = Dio(option1);
    try {
      Response? response = await dio?.get(url, queryParameters: {
        "consumer_key": "ck_994a21efc62a2e77a1a8b645e8c5f3b85d7d37e3",
        "consumer_secret": "cs_cf1a434e7a13a5795b0baacc7e838bcfc3d4e1bc"
      });

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print(response?.data);

        return response!.data;
      } else {
        return {'success': false, ' message': 'Failed'};
      }
    } on DioError catch (e) {
      print("error : ${e.message.toString()}");

      return {'success': false, 'message': e.message};
    }
  }

  List<AllProductRes> allProductres = [];

  Future<Object> salesDiscount() async {
    dio = Dio(option1);

    try {
      var queryParams = {
        "consumer_key": "ck_994a21efc62a2e77a1a8b645e8c5f3b85d7d37e3",
        "consumer_secret": "cs_cf1a434e7a13a5795b0baacc7e838bcfc3d4e1bc",
        "status": "publish",
        "per_page": "60"
      };

      Response? response = await dio?.get(url, queryParameters: queryParams);
      String page = response!.headers.value("X-WP-TotalPages") ?? "1";
      //print("no of pages:${page}");

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print(response?.data);

        return response;
      } else {
        return allProductres;
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return allProductres;
    }
  }

  List<CarouselProducts> carouselProductsRes = [];

  Future productCarousel() async {
    dio = Dio(option1);
    List data = [];
    try {
      var queryParams = {
        "consumer_key": "ck_994a21efc62a2e77a1a8b645e8c5f3b85d7d37e3",
        "consumer_secret": "cs_cf1a434e7a13a5795b0baacc7e838bcfc3d4e1bc",
        "featured": "true",
        "status": "publish",
        "per_page": "61"
      };

      Response? response = await dio?.get(url, queryParameters: queryParams);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print(response?.data);

        return response;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print("error: ${e.message.toString()}");
      return {'success': false, 'message': e.message};
    }
  }

  Future categoriesList() async {
    dio = Dio(option1);
    List data = [];
    try {
      var queryParams = {
        "consumer_key": "ck_994a21efc62a2e77a1a8b645e8c5f3b85d7d37e3",
        "consumer_secret": "cs_cf1a434e7a13a5795b0baacc7e838bcfc3d4e1bc",
        "status": "publish",
        "per_page": 30
      };

      Response? response = await dio?.get(url, queryParameters: queryParams);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print(response?.data);

        return response;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print("error: ${e.message.toString()}");
      return {'success': false, 'message': e.message};
    }
  }

  Future categoriesList1() async {
    dio = Dio(option1);
    List data = [];
    try {
      var queryParams = {
        "consumer_key": "ck_994a21efc62a2e77a1a8b645e8c5f3b85d7d37e3",
        "consumer_secret": "cs_cf1a434e7a13a5795b0baacc7e838bcfc3d4e1bc",
        "status": "publish",
        "per_page": "61"
      };

      Response? response = await dio?.get(url, queryParameters: queryParams);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print(response?.data);

        return response;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print("error: ${e.message.toString()}");
      return {'success': false, 'message': e.message};
    }
  }

  Future getcart() async {
    dio = Dio(option);
    try {
      Response? response = await dio?.get(url, queryParameters: {
        "consumer_key": "ck_994a21efc62a2e77a1a8b645e8c5f3b85d7d37e3",
        "consumer_secret": "cs_cf1a434e7a13a5795b0baacc7e838bcfc3d4e1bc"
      });

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print(response?.data);
        await Storage.init();
        String? nonce = response!.headers.value("Nonce");
        Storage.set_noncetoken(nonce ?? "");

        return response!.data;
      } else {
        return {'success': false, ' message': 'Failed'};
      }
    } on DioError catch (e) {
      print("error : ${e.message.toString()}");

      return {'success': false, 'message': e.message};
    }
  }

  Future addtocart(int id, int quantity) async {
    dio = Dio(option2);
    try {
      Response? response = await dio?.post(url, data: {
        "id": id,
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

  Future removefromcart(String key) async {
    dio = Dio(option2);
    try {
      Response? response = await dio?.post(url, data: {
        "key": key
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

  Future updatecart(String key, int quantity) async {
    dio = Dio(option2);
    try {
      Response? response = await dio?.post(url, data: {
        "key": key,
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
