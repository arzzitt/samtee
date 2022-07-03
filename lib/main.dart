import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:login_flow/uis.dart/productgrid%20view/routes/app_pages.dart';
import 'package:login_flow/uis.dart/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
