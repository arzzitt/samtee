import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_flow/models/cartmodel.dart';
import 'package:login_flow/storage.dart';

import 'NetworkHelper.dart';

class access {
  static String base_url = 'https://santee.phaico.com/';
  static String base_url1 = 'https://santee.phaico.com/wp-json/wc/v3/';
  static String base_url2 = 'https://santee.phaico.com/wp-json/wc/store/';

  // Future<dynamic> login(String email, password,) async {
  //   NetworkHelper helper = NetworkHelper(
  //     base_url + "login/email",
  //   );
  //   var data = await helper.login(email, password);

  //   // Profile prof = Profile.fromJson(data);
  //   return data;
  // }

  Future<dynamic> signup(
      String firstname, lastname, email, password, username) async {
    NetworkHelper helper = NetworkHelper(base_url + "wp-json/wc/v3/customers");
    var data =
        await helper.signup(firstname, lastname, email, password, username);
    return data;
  }

  Future<dynamic> login(String username, password) async {
    NetworkHelper helper =
        NetworkHelper("https://santee.phaico.com/wp-json/jwt-auth/v1/token");
    var data = await helper.login(username, password);
    return data;
  }

  Future<dynamic> categories(int start) async {
    NetworkHelper helper = NetworkHelper(base_url1 + "products/categories");
    var data = await helper.categories(start);
    return data;
  }

  Future<dynamic> salesDiscount() async {
    NetworkHelper helper = NetworkHelper(base_url1 + "products");
    var data = await helper.salesDiscount();
    return data;
  }

  Future<dynamic> productdes(String product_id) async {
    NetworkHelper helper = NetworkHelper(base_url1 + "products/$product_id");
    var data = await helper.product_des();
    return data;
  }

  Future<dynamic> productCarousel() async {
    NetworkHelper helper = NetworkHelper(base_url1 + "products");
    var data = await helper.productCarousel();
    return data;
  }

  Future<dynamic> productbycat(int page, int category) async {
    NetworkHelper helper = NetworkHelper(base_url1 + "products");
    var data = await helper.productbycat(page,category);
    return data;
  }

  Future<dynamic> categoriesList() async {
    NetworkHelper helper = NetworkHelper(base_url1 + "products/categories");
    var data = await helper.categoriesList();
    return data;
  }

  Future<dynamic> categoriesList1() async {
    NetworkHelper helper = NetworkHelper(base_url1 + "products/categories");
    var data = await helper.categoriesList1();
    return data;
  }

  Future<dynamic> getcart() async {
    NetworkHelper helper = NetworkHelper(base_url2 + "cart");
    var data = await helper.getcart();
    return data;
  }

  Future<dynamic> addtocart(int id, int quantity) async {
    NetworkHelper helper = NetworkHelper(base_url2 + "cart/add-item");
    var data = await helper.addtocart(id, quantity);
    return data;
  }

  Future<dynamic> removefromcart(String key) async {
    NetworkHelper helper =
        NetworkHelper(base_url2 + "cart/remove-item?key=$key");
    var data = await helper.removefromcart(key);
    return data;
  }

  Future<dynamic> updateitem(String key, int quantity) async {
    NetworkHelper helper = NetworkHelper(
        base_url2 + "cart/update-item?key=$key&quantity=$quantity");
    var data = await helper.updatecart(key, quantity);
    return data;
  }

  Future<dynamic> shippin_add(String custid, firstname, lastname, address1,
      address2, country, city, state, int postcode, int phone) async {
    await Storage.init();
    NetworkHelper helper = NetworkHelper(base_url1 + "customers/$custid");
    var data = helper.ShippingAddress(firstname, lastname, address1, address2,
        country, city, state, postcode, phone);
    return data;
  }

  Future<dynamic> get_address() async {
    NetworkHelper helper = NetworkHelper(base_url2 + "cart");
    var data = helper.get_address();
    return data;
  }

  Future<dynamic> createorder(data1, CartModel cartModel, ) async {
    NetworkHelper helper = NetworkHelper(base_url1 + "orders");
    var data = helper.createorder(data1,cartModel);
    return data;
  }
  
  

}
