import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';

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
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        SizedBox(
          height: 463,
        ),
        Container(
          height: 300,
          width: 400,
          decoration: BoxDecoration(
              color: HexColor('#00c0e5'),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28), topRight: Radius.circular(28))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Welcome to Ecommerce',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 25,
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
                    'Continue with Email',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
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
                    Get.to(login_phone());
                  },
                  child: Text(
                    'Continue with Phone number',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  )),
              TextButton(
                  onPressed: () {
                    Get.to(Signup());
                  },
                  child: Text(
                    'Don\'t have an account ? Register',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ],
    )));
  }
}
