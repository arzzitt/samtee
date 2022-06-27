import 'dart:io';

import 'package:flutter/material.dart';

import 'NetworkHelper.dart';

class access {
  static String base_url = 'https://santee.phaico.com/';

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

  // Future<dynamic> employeeList(String name) async {

  //   NetworkHelper helper = NetworkHelper(base_url + "admin/search/employee",);
  //   var data = await helper.employeeList(name);

  //   // Profile prof = Profile.fromJson(data);
  //   return data;
  // }

  // Future<dynamic> uploadVisitorImage(String path) async {
  //   NetworkHelper helper = NetworkHelper(base_url + "upload/img/VisitorImg",);
  //   var data=await helper.uploadVisitorImage(path);
  //   return data;

  // }

  // Future<dynamic> visitor(String visitorName, String visitorEmail, String visitorPhone, String company, int employeeId, String? imageurl) async {
  //   NetworkHelper helper = NetworkHelper(base_url + "visit",);
  //   var data=await helper.visitor(visitorName,visitorEmail,visitorPhone,company,employeeId,imageurl);
  //   return data;
  // }

  // Future<dynamic> delivery(String deliveryPersonName, String deliverPersonPhone, String deliverCompany, int employeeID) async {
  //   NetworkHelper helper = NetworkHelper(base_url + "delivery",);
  //   var data=await helper.delivery(deliveryPersonName,deliverPersonPhone,deliverCompany,employeeID);
  //   return data;
  // }

  // Future<dynamic> contractor(String visitorName, String visitorEmail, String visitorPhone, String company, int employeeId, String? imageurl) async {
  //   NetworkHelper helper = NetworkHelper(base_url + "contractor",);
  //   var data=await helper.contractor(visitorName,visitorEmail,visitorPhone,company,employeeId,imageurl);
  //   return data;
  // }

  // Future<dynamic>signout(String? code) async{
  //   NetworkHelper helper = NetworkHelper(base_url + "signout",);
  //   var data=await helper.signout(code);
  //   return data;
  // }

  // Future<dynamic>attendance(String employeeId, String? imageurl)async {
  //   NetworkHelper helper = NetworkHelper(base_url + "employee/attendance/mark",);
  //   var data=await helper.attendance(employeeId,imageurl);
  //   return data;
  // }

}
