import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'pass_change.dart';

class forgot_password extends StatefulWidget {
  const forgot_password({Key? key}) : super(key: key);

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  final _email = TextEditingController();
  bool send = false;
  late Text text = Text('email sent to $_email');

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
          'Forgot Password',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'We will send an mail to',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
        ),
        Text(
          'the registered email address',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
        ),
        Text(
          'to regain your password',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
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
              controller: _email,
              decoration: InputDecoration(
                hintText: 'email address',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
        Visibility(
            visible: send,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('email sent to : '), Text(_email.text)],
            )),
        TextButton(
          onPressed: () async {
            setState(() {
              send = true;
            });
            showDialog(
                context: context,
                builder: (context) {
                  return Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Center(
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22)),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: HexColor('#00c0e5'),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(22),
                                      topRight: Radius.circular(22))),
                              child: Center(
                                child: Text(
                                  'Password reset email sent',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            Container(
                              height: 140,
                              color: Colors.white,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'An email has been sent to \n   follow instructions to \n    reset your password',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.to(Pass_change());
                                        },
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.only(
                                                    left: 50, right: 50)),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    HexColor('#00c0e5')),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28)))),
                                        child: Text(
                                          'OK',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ))
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          child: Text(
            'Send',
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
      ]),
    ));
  }
}
