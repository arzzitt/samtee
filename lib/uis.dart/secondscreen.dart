import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_flow/uis.dart/signup_page.dart';

import 'login_phone.dart';
import 'signin.dart';
import 'signup.dart';

class secondscreen extends StatefulWidget {
  const secondscreen({Key? key}) : super(key: key);

  @override
  State<secondscreen> createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height:  MediaQuery.of(context).size.height * 0.6,
                  child: Image(
                    image: AssetImage('lib/images/tick.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: HexColor('#B67A4F'),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28), topRight: Radius.circular(28))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(
                'Welcome to Ecommerce',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'Nunito'),
              ),
              SizedBox(
                height: 45,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
                          MediaQuery.of(context).size.height * 0.05),
                      primary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(28)))),
                  onPressed: () {
                    Get.to(Signin());
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        color: HexColor('#B67A4F'),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Nunito'),
                  )),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
                          MediaQuery.of(context).size.height * 0.05),
                      primary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(28)))),
                  onPressed: () {
                    Get.to(signup_page());
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: HexColor('#B67A4F'),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Nunito'),
                  )),
            ],
          ),
        ),
      ],
    )));
  }
}
