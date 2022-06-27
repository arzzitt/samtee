import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:login_flow/uis.dart/home.dart';
import 'package:login_flow/uis.dart/onboarding_1.dart';
import 'package:hexcolor/hexcolor.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: new EasySplashScreen(
        logo: Image.asset('lib/images/logo.png'),
        backgroundColor: HexColor('#00c0e5'),
        showLoader: false,
        navigator: boarding1(),
        durationInSeconds: 5,
        logoSize: 100,
      )),
    );
  }
}
