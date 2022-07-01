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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    color: Colors.black,
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Name',
                            style: TextStyle(
                                color: HexColor('#B67A4F'),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mens',
                          style: TextStyle(
                              color: HexColor('#B67A4F'),
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Nunito'),
                        ),
                        SizedBox(
                          height: 160,
                          child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: items.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(Category_1());
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_right,
                                            color: HexColor('#B67A4F'),
                                          ),
                                          Text(
                                            '${items[index]}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Nunito',
                                                color: HexColor('#B67A4F')),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ));
                              }),
                        ),
                        Text(
                          'Womens',
                          style: TextStyle(
                              color: HexColor('#B67A4F'),
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Nunito'),
                        ),
                        SizedBox(
                          height: 160,
                          child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: items.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_right,
                                          color: HexColor('#B67A4F'),
                                        ),
                                        Text(
                                          '${items[index]}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: HexColor('#B67A4F'),
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ));
                              }),
                        ),
                        Text(
                          'Kids',
                          style: TextStyle(
                              color: HexColor('#B67A4F'),
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Nunito'),
                        ),
                        SizedBox(
                          height: 160,
                          child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: items.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_right,
                                          color: HexColor('#B67A4F'),
                                        ),
                                        Text(
                                          '${items[index]}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: HexColor('#B67A4F'),
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ));
                              }),
                        ),
                      ],
                    ),
                  )
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
