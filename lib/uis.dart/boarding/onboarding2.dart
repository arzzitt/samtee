import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        SizedBox(
          height: 463,
          child: Image(
            image: AssetImage('lib/images/tick.png'),
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: 300,
          width: 400,
          decoration: BoxDecoration(
              color: HexColor('#B67A4F'),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28), topRight: Radius.circular(28))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Door to Door Delivery',
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
                height: 20,
              )
            ],
          ),
        ),
      ],
    )));
  }
}
