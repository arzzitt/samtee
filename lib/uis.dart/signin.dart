import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:login_flow/uis.dart/home.dart';

import 'Forgot_password.dart';
import 'signup.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {}),
        title: Text(
          'Sign in',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: TextStyle(
                    color: HexColor('#00c0e5'),
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
              Text(
                'Sign in to continue',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                //  height: 50,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.grey.shade200),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: HexColor('#00c0e5'),
                    ),
                    hintText: 'jhonson@gmail.com',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                //  height: 50,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.grey.shade200),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: HexColor('#00c0e5'),
                      ),
                      hintText: '+91 xxxxxx3675',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none)),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.to(Home());
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          top: 10, bottom: 10, left: 90, right: 90)),
                      backgroundColor:
                          MaterialStateProperty.all(HexColor('#00c0e5')),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: HexColor('#00c0e5'),
                    value: this.valuefirst,
                    onChanged: (bool? value) {
                      setState(() {
                        this.valuefirst = value!;
                      });
                    },
                  ),
                  Text('Remember me'),
                  SizedBox(
                    width: 70,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(forgot_password());
                      },
                      child: Text('Forgot password ?',
                          style: TextStyle(color: HexColor('#00c0e5'))))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account ?',
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(Signup());
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: HexColor('#00c0e5')),
                      ))
                ],
              )
            ]),
      ),
    ));
  }
}
