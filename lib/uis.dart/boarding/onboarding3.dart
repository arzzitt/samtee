import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hexcolor/hexcolor.dart';

import '../secondscreen.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.579,
            child: Image(
              image: AssetImage('lib/images/tick.png'),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.375,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: HexColor('#B67A4F'),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Welcome to Emart',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Nunito'),
                ),
                Text(
                  'Lorem ipsum giving refrence origin \n as well as a random',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      fontFamily: 'Nunito'),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
