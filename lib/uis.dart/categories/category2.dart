import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../signup.dart';

class Category2 extends StatefulWidget {
  const Category2({Key? key}) : super(key: key);

  @override
  State<Category2> createState() => _Category2State();
}

class _Category2State extends State<Category2> {
  LineIcon _heart = LineIcon(
    LineIcons.heart,
    color: Colors.grey,
  );
  LineIcon _heartfilled = LineIcon(
    LineIcons.heartAlt,
    color: Colors.red,
  );
  List<String> product_name = [
    'American Heels',
    'German Heels',
    'Indonesian Heels'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor('#01c0e4'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 30),
            child: Row(children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.sort,
                    color: Colors.white,
                    size: 30,
                  )),
              Container(
                height: 35,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none)),
              ),
              IconButton(
                  onPressed: () {},
                  icon: LineIcon(
                    LineIcons.shoppingCart,
                    color: Colors.white,
                    size: 35,
                  ))
            ]),
          ),
          Container(
            height: 670,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28))),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Container(
                      height: 118,
                      width: 305,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 118,
                      width: 305,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 118,
                      width: 305,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                    ),
                  ]),
                ),
                Row(
                  children: [
                    Text(
                      'Sale Discount',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Nunito'),
                    ),
                    SizedBox(
                      width: 117,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'See all',
                              style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Nunito'),
                            ),
                            Icon(
                              Icons.add,
                              color: Colors.grey.shade500,
                              size: 18,
                            )
                          ],
                        ))
                  ],
                ),
                SizedBox(
                  height: 207,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: product_name.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade500,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                  ),
                                  Text(
                                    'American Heels',
                                    style: TextStyle(fontFamily: 'Nunito'),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        child: TextButton(
                                          onPressed: () {
                                            Get.to(Signup());
                                          },
                                          child: Text('View price'),
                                          style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(0))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      GestureDetector(
                                        child: _heart,
                                        onTap: () {
                                          setState(() {
                                            _heart = _heartfilled;
                                            _heartfilled = _heart;
                                          });
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Row(
                  children: [
                    Text(
                      'Popular Sales',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Nunito'),
                    ),
                    SizedBox(
                      width: 117,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'See all',
                              style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Nunito'),
                            ),
                            Icon(
                              Icons.add,
                              color: Colors.grey.shade500,
                              size: 18,
                            )
                          ],
                        ))
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 105,
                      height: 102,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Vinita backpack',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Nunito')),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 20,
                          child: TextButton(
                            onPressed: () {
                              Get.to(Signup());
                            },
                            child: Text('View price'),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(0))),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            padding: EdgeInsets.only(left: 50),
                            onPressed: () {},
                            icon: LineIcon(
                              LineIcons.heart,
                              size: 20,
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            height: 20,
                            width: 40,
                            decoration: BoxDecoration(
                                color: HexColor('#01c0e4'),
                                borderRadius: BorderRadius.circular(18)),
                            child: IconButton(
                                padding: EdgeInsets.only(bottom: 30),
                                onPressed: () {},
                                icon: LineIcon(
                                  LineIcons.shoppingCart,
                                  color: Colors.white,
                                  size: 20,
                                )))
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

      // Column(
                      //   children: [
                      //     Container(
                      //       height: 150,
                      //       width: 150,
                      //       decoration: BoxDecoration(
                      //           color: Colors.grey.shade500,
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(18))),
                      //     ),
                      //     Text('American Heels'),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       children: [
                      //         SizedBox(
                      //           height: 20,
                      //           child: TextButton(
                      //             onPressed: () {
                      //               Get.to(Signup());
                      //             },
                      //             child: Text('View price'),
                      //             style: ButtonStyle(
                      //                 padding: MaterialStateProperty.all(
                      //                     EdgeInsets.all(0))),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           width: 24,
                      //         ),
                      //         GestureDetector(
                      //           child: _heart,
                      //           onTap: () {
                      //             setState(() {
                      //               _heart = _heartfilled;
                      //               _heartfilled = _heart;
                      //             });
                      //           },
                      //         )
                      //       ],
                      //     )
                      //   ],
                      // ),