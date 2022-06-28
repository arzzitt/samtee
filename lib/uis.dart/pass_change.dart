import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'signin.dart';

class Pass_change extends StatefulWidget {
  const Pass_change({Key? key}) : super(key: key);

  @override
  State<Pass_change> createState() => _Pass_changeState();
}

class _Pass_changeState extends State<Pass_change> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: HexColor('#B67A4F'),
            ),
            onPressed: () {
              Get.back();
            }),
        title: Text(
          'Change Password',
          style: TextStyle(
              color: HexColor('#B67A4F'),
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito'),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            //  height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Colors.grey.shade200),
            child: TextField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: 'Old password',
                hintStyle: TextStyle(fontFamily: 'Nunito'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide.none),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            //  height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Colors.grey.shade200),
            child: TextField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: 'New password',
                hintStyle: TextStyle(fontFamily: 'Nunito'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide.none),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            //  height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Colors.grey.shade200),
            child: TextField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: 'Confirm password',
                hintStyle: TextStyle(fontFamily: 'Nunito'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide.none),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        TextButton(
          onPressed: () {
            Get.to(Signin());
          },
          child: Text(
            'Save now',
            style: TextStyle(color: Colors.white, fontFamily: 'Nunito'),
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.only(top: 10, bottom: 10, left: 90, right: 90)),
              backgroundColor: MaterialStateProperty.all(HexColor('#B67A4F')),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
        ),
      ]),
    ));
  }
}
