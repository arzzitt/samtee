import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:login_flow/signin.dart';
import 'package:login_flow/signup_page.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

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
            onPressed: () {
              Get.back();
            }),
        title: Text(
          'Sign up',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Sign up with',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
        ),
        Text(
          'email or phone number',
          style: TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 30,
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
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                hintText: 'jhonson@gmail.com',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
        Row(children: <Widget>[
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                child: Divider(
                  color: Colors.black,
                  height: 30,
                )),
          ),
          Text("OR"),
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                child: Divider(
                  color: Colors.black,
                  height: 30,
                )),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 60,
            padding: EdgeInsets.only(left: 18, top: 15, bottom: 18),
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
        TextButton(
          onPressed: () {
            Get.to(signup_page());
          },
          child: Text(
            'Sign up',
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
              'Already have a account ?',
              style: TextStyle(color: Colors.black),
            ),
            TextButton(
                onPressed: () {
                  Get.to(Signin());
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(color: HexColor('#00c0e5')),
                ))
          ],
        )
      ]),
    ));
  }
}
