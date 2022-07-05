import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:http_parser/http_parser.dart';
import 'package:login_flow/models/AllProductRes.dart';
import 'package:login_flow/models/CataegoriesRes.dart';
import 'package:login_flow/models/Product_des_model.dart';
import 'package:login_flow/models/carouselProducts.dart';
import 'package:login_flow/models/cartmodel.dart';
import 'package:login_flow/models/cartmodel.dart';

import '../models/cartmodel.dart';
import '../models/cartmodel.dart';

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

  Future<List<CataegoriesRes>> categories(int start) async {
    dio = Dio(option1);
    List data = [];
    try {
      var queryParams = {
        "consumer_key": "ck_994a21efc62a2e77a1a8b645e8c5f3b85d7d37e3",
        "consumer_secret": "cs_cf1a434e7a13a5795b0baacc7e838bcfc3d4e1bc",
        "per_page": 10,
        "page":start,

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
        "per_page": "20"
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

  Future productbycat(int page, int category) async {
    dio = Dio(option1);
    List data = [];
    try {
      var queryParams = {
        "consumer_key": "ck_994a21efc62a2e77a1a8b645e8c5f3b85d7d37e3",
        "consumer_secret": "cs_cf1a434e7a13a5795b0baacc7e838bcfc3d4e1bc",
        "status": "publish",
        "per_page": "20",
        "page":page,
        "category":category
      };

      Response? response = await dio?.get(url, queryParameters: queryParams);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print(response?.data);
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

  Future ShippingAddress(String firstname, lastname, address1, address2,
      country, city, state, int postcode, int phone) async {
    dio = Dio(option1);
    try {
      Response? response = await dio?.put(url, data: {
        "phone": phone
      }, queryParameters: {
        "consumer_key": "ck_994a21efc62a2e77a1a8b645e8c5f3b85d7d37e3",
        "consumer_secret": "cs_cf1a434e7a13a5795b0baacc7e838bcfc3d4e1bc",
        "shipping[first_name]": firstname,
        "shipping[last_name]": lastname,
        "shipping[address1]": address1,
        "shipping[address2]": address2,
        "shipping[country]": country,
        "shipping[city]": city,
        "shipping[state]": state,
        "shipping[postcode]": postcode,
        "shipping[phone]": phone
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

  Future get_address() async {
    dio = Dio(option1);
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

  Future<dynamic> createorder(data1, CartModel cartModel, ) async {
    dio = Dio(option1);
    try {
      Response? response = await dio?.post(url, data:  {
        'payment_method': "bacs",
        'payment_method_title': "Direct Bank Transfer",
        'set_paid': true,

        "billing": {
          'first_name': cartModel.billingAddress.firstName,
          'last_name':  cartModel.billingAddress.lastName,
          'address_1':  cartModel.billingAddress.address_1,
          'address_2':  cartModel.billingAddress.address_2,
          'city':  cartModel.billingAddress.city,
          'state': cartModel.billingAddress.state,
          'postcode':  cartModel.billingAddress.postcode,
          'country':  cartModel.billingAddress.country,
          'email': cartModel.billingAddress.email,
          'phone': cartModel.billingAddress.phone
        },
        'shipping': {
          'first_name': cartModel.shippingAddress.firstName,
          'last_name': cartModel.shippingAddress.lastName,
          'address_1':cartModel.shippingAddress.address_1,
          'address_2': cartModel.shippingAddress.address_2,
          'city': cartModel.shippingAddress.city,
          'state':cartModel.shippingAddress.state,
          'postcode': cartModel.shippingAddress.postcode,
          'country': cartModel.shippingAddress.country
        },
        'line_items': data1,


        'shipping_lines': [
          {
            'method_id': "flat_rate",
            'method_title': "Flat Rate",
            'total': "10.00"
          }
        ]
      },
          queryParameters: {
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


}
