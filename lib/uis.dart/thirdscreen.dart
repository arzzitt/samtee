import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'signup_page.dart';

class thirdscreen extends StatefulWidget {
  const thirdscreen({Key? key}) : super(key: key);

  @override
  State<thirdscreen> createState() => _thirdscreenState();
}

class _thirdscreenState extends State<thirdscreen> {
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
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28), topRight: Radius.circular(28))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Ecommerce',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Deliver your order from around the\n       world without hesitation',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              SizedBox(
                height: 15,
              ),
              TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 5)),
                      backgroundColor:
                          MaterialStateProperty.all(HexColor('#00c0e5')),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(28))))),
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  )),
              TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 5)),
                      backgroundColor: MaterialStateProperty.all(
                          HexColor('#00c0e5').withOpacity(0.2)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(28))))),
                  onPressed: () {
                    Get.to(signup_page());
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  )),
            ],
          ),
        ),
      ],
    )));
  }
}
