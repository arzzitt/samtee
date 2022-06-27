import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Finger_print extends StatefulWidget {
  const Finger_print({Key? key}) : super(key: key);

  @override
  State<Finger_print> createState() => _Finger_printState();
}

class _Finger_printState extends State<Finger_print> {
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
          'Sign up for Finger',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 70,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Please lift and rest your finger',
            style: TextStyle(color: Colors.grey.shade400),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Sign up by Finger',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.only(top: 10, bottom: 10, left: 70, right: 70)),
                backgroundColor: MaterialStateProperty.all(HexColor('#00c0e5')),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this.valuefirst,
                  onChanged: (bool? value) {
                    setState(() {
                      this.valuefirst = value!;
                    });
                  },
                ),
                Text('By Signing up you agree to our'),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Terms and Conditions',
              style: TextStyle(color: HexColor('#00c0e5')),
            ),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
          )
        ],
      ),
    ));
  }
}
