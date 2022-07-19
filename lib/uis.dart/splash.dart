import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flow/uis.dart/boarding/onBoardingScrenMain.dart';
import 'package:login_flow/uis.dart/home.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_flow/uis.dart/login_phone.dart';
import 'package:login_flow/uis.dart/secondscreen.dart';

import '../storage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

 bool? isloggedin ;
 bool? isFirst;

 @override
  void initState() {
   getPref();
    // TODO: implement initState
    super.initState();
    _navigatetoHome();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: new EasySplashScreen(
        logo: Image.asset('lib/images/logo.png'),
        backgroundColor: HexColor('#B67A4F'),
        showLoader: true,



        logoSize: 100,
      )),
    );
  }

  Future<void> getPref()async {
   await Storage.init();
    isloggedin  =await  Storage.get_isLoggedIn()! ;
    isFirst=await Storage.get_isFirst()!;
  }
 _navigatetoHome()async {
   await Future.delayed(Duration(milliseconds: 3000), () {});


   Get.offAll(()=>isloggedin!?Home():isFirst!?OnBoardingScreenMain():secondscreen(),);



 }

}
