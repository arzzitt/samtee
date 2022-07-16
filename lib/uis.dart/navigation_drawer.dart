import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:hexcolor/hexcolor.dart';

import 'order_page.dart';

class navigationDrawer extends StatefulWidget {
  @override
  State<navigationDrawer> createState() => _navigationDrawerState();
}

class _navigationDrawerState extends State<navigationDrawer> {
  List<String> items = [
    'T-shirts',
    'shirts',
    'Jackets',
    'Sweatshirts',
    'Winter wear'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
          backgroundColor: Colors.white,
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  createDrawerHeader(),
                  createDrawerBodyItem(
                      icon: Icons.arrow_right,
                      text: 'Orders',
                      onTap: () {
                        Get.to(MyOrders());
                      })
                ]),
          ))),
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 7, 48, 81),
        ),
        child: Container(
          height: 0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
              ),
              Text(
                '   Name',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
            ],
          ),
        ));
  }

  Widget createDrawerBodyItem(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: HexColor('#B67A4F'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: HexColor('#B67A4F'),
                    fontFamily: 'Nunito',
                    letterSpacing: 0.5,
                    fontSize: 20)),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
