import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'otp.dart';

class login_phone extends StatelessWidget {
  const login_phone({Key? key}) : super(key: key);

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
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Login',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
        ),
        Text(
          'with your phone number',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 60,
            padding: EdgeInsets.only(left: 20, top: 15, bottom: 18),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(28)),
            child: IntlPhoneField(
              showDropdownIcon: false,
              decoration: InputDecoration(
                counterText: '',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (phone) {
                print(phone.completeNumber);
              },
              onCountryChanged: (country) {
                print('Country changed to: ' + country.name);
              },
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: () {
            Get.to(phone_verification());
          },
          child: Text(
            'Sign in',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.only(top: 10, bottom: 10, left: 90, right: 90)),
              backgroundColor: MaterialStateProperty.all(HexColor('#00c0e5')),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
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
                onPressed: () {},
                child: Text(
                  'Sign up',
                  style: TextStyle(color: HexColor('#00c0e5')),
                ))
          ],
        )
      ]),
    ));
  }
}
