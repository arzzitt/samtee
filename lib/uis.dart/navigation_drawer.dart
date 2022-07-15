import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_flow/uis.dart/categories/category1.dart';

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
                 createDrawerBodyItem(icon: Icons.arrow_right, text: 'Orders', onTap: (){

                 })
                ]),
          ))),
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 7, 48, 81),
        ),
        child: Container(
          height: 0,
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
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 0.5,
                    fontSize: 20)),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
