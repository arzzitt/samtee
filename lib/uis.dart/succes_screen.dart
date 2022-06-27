import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class success_acc_created extends StatelessWidget {
  const success_acc_created({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 500,
            ),
            Text(
              'Account Created !',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Your account has been created\n            successfully'),
            SizedBox(
              height: 3,
            ),
            Text(
                'Please sign in to use your account \n                and enjoy'),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                // Get.to(Signin());
              },
              child: Text(
                'Take me to sign in',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                      top: 10, bottom: 10, left: 70, right: 70)),
                  backgroundColor:
                      MaterialStateProperty.all(HexColor('#00c0e5')),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
            )
          ],
        ),
      ),
    ));
  }
}
