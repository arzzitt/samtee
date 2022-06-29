import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:login_flow/apis/Access.dart';
import 'package:login_flow/models/CataegoriesRes.dart';

import 'package:login_flow/uis.dart/cart.dart';

import '../models/AllProductRes.dart';
import '../models/categories_model.dart';
import '../storage.dart';
import 'categories/category2.dart';
import 'navigation_drawer.dart';
import 'product_description.dart';
import 'profile.dart';
import 'secondscreen.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = true;
  LineIcon _heart = LineIcon(
    LineIcons.heart,
    color: Colors.white,
  );
  LineIcon _heartfilled = LineIcon(
    LineIcons.heartAlt,
    color: Colors.red,
  );

  final PageController _pagecontroller = PageController();

  List<String> product_name = [
    'American Heels',
    'German Heels',
    'Indonesian Heels'
  ];
  List<int> orig_price = [125, 100, 125];
  List<int> curr_price = [64, 55, 64];

  List categoryItems = [];
  // CategoriesResponse? categRes;
  List<CataegoriesRes> categRes = [];
  List<AllProductRes> allProductRes = [];

  @override
  void initState() {
    super.initState();
    access().categories().then((value) async {
      setState(() {
        // print(value);
        //loading=false;
        categRes = value;
        //categRes = (value as List).map((e) => CategoriesResponse.fromJson(e),).toList();
        //categRes = CategoriesResponse.fromJson(value);
        print("category response: $categRes");
        print(categRes.length);
      });
    });
    access().salesDiscount().then((value) async {
      setState(() {
        // print(value);
        var pages = value.headers.value("X-WP-TotalPages") ?? "1";
        for (Map i in value.data) {
          allProductRes.add(AllProductRes.fromJson(i));
        }
        print("no of pages:${pages}");

        //allProductRes = value;
        loading = false;
        //categRes = (value as List).map((e) => CategoriesResponse.fromJson(e),).toList();
        //categRes = CategoriesResponse.fromJson(value);
        print("all product response: $allProductRes");
        print(allProductRes.length);
      });
    });
    //loading=false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: navigationDrawer(),
      appBar: AppBar(
        backgroundColor: HexColor('#B67A4F'),
        elevation: 0,
        actions: [
          GestureDetector(
            child: LineIcon(
              LineIcons.bell,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            child: LineIcon(
              LineIcons.shoppingCart,
              color: Colors.white,
              size: 30,
            ),
            onTap: () {
              Get.to(Cart());
            },
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.sort,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () {},
              child: LineIcon(
                LineIcons.home,
                color: Colors.grey.shade500,
                size: 30,
              )),
          TextButton(
              onPressed: () {},
              child: LineIcon(
                LineIcons.clipboardList,
                color: Colors.grey.shade500,
                size: 30,
              )),
          TextButton(
              onPressed: () {
                Get.to(Category2());
              },
              child: LineIcon(
                LineIcons.search,
                color: Colors.grey.shade500,
                size: 30,
              )),
          TextButton(
              onPressed: () {},
              child: LineIcon(
                LineIcons.shoppingBag,
                color: Colors.grey.shade500,
                size: 30,
              )),
          TextButton(
              onPressed: () {
                Get.to(Profile());
              },
              child: LineIcon(
                LineIcons.user,
                color: Colors.grey.shade500,
                size: 30,
              ))
        ],
      )),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                    child: Text(
                      'What are you looking for today ?',
                      style: TextStyle(
                          color: HexColor('#B67A4F'),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        padding: const EdgeInsets.all(8),
                        itemCount: categRes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TextButton(
                              onPressed: () {
                                print(categRes[index].name);
                                int homeCategId = categoryItems[index]["id"];
                                Storage.set_categoryIdHome(
                                    homeCategId.toString());
                                print(
                                    "stored categ id: ${Storage.get_categoryIdHome().toString()}");
                              },
                              child: Container(
                                height: 80,
                                width: 50,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor:
                                            Colors.blue.withOpacity(0.2),
                                        child: Icon(
                                          Icons.local_mall,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          categRes[index].name!,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: HexColor('#B67A4F'),
                                              fontFamily: 'Nunito',
                                              fontSize: 10),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        }),
                  ),
                  Row(
                    children: [
                      Text(
                        'Sale Discount',
                        style: TextStyle(
                            color: HexColor('#B67A4F'),
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
                                    color: HexColor('#B67A4F').withOpacity(0.4),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'Nunito'),
                              ),
                              Icon(
                                Icons.add,
                                color: HexColor('#B67A4F').withOpacity(0.4),
                                size: 18,
                              )
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 177,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        padding: const EdgeInsets.all(8),
                        itemCount: allProductRes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(PD(
                                        product_id: allProductRes[index].id!));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Container(
                                              height: 122,
                                              width: 115,
                                              decoration: BoxDecoration(
                                                  //image: DecorationImage(image: NetworkImage(allProductRes[index].images![index].src!)),
                                                  color: Colors.grey.shade500,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Positioned(
                                              right: 22,
                                              bottom: 3,
                                              child: GestureDetector(
                                                child: _heart,
                                                onTap: () {
                                                  setState(() {
                                                    _heart = _heartfilled;
                                                    _heartfilled = _heart;
                                                  });
                                                },
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 3,
                                              child: GestureDetector(
                                                child: LineIcon(
                                                  LineIcons.share,
                                                  color: Colors.white,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    _heart = _heartfilled;
                                                    _heartfilled = _heart;
                                                  });
                                                },
                                              ),
                                            )
                                          ]),
                                      Text(
                                        "${allProductRes[index].name}",
                                        style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: HexColor('#B67A4F')),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        child: TextButton(
                                          onPressed: () {
                                            Get.to(secondscreen());
                                          },
                                          child: Text(
                                            allProductRes[index]
                                                .price
                                                .toString(),
                                            style: TextStyle(),
                                          ),
                                          style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(0))),
                                        ),
                                      )
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   children: [
                                      //     SizedBox(
                                      //       width: 30,
                                      //     ),
                                      //     Text(
                                      //       '\$${curr_price[index]}',
                                      //       style: TextStyle(
                                      //           color: Colors.red.shade900,
                                      //           fontWeight: FontWeight.bold,
                                      //           fontSize: 18),
                                      //     ),
                                      //     SizedBox(
                                      //       width: 2,
                                      //     ),
                                      //     Text(
                                      //       '\$${orig_price[index]}',
                                      //       style: TextStyle(
                                      //           color: Colors.grey.shade500,
                                      //           decoration:
                                      //               TextDecoration.lineThrough,
                                      //           fontSize: 15),
                                      //     ),
                                      //     SizedBox(
                                      //       width: 24,
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Row(
                    children: [
                      Text(
                        'Popular Items',
                        style: TextStyle(
                            color: HexColor('#B67A4F'),
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
                                    color: HexColor('#B67A4F').withOpacity(0.4),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'Nunito'),
                              ),
                              Icon(
                                Icons.add,
                                color: HexColor('#B67A4F').withOpacity(0.4),
                                size: 18,
                              )
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 205,
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
                                GestureDetector(
                                  onTap: () {
                                    Get.to(PD(product_id: 5234));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Container(
                                              height: 150,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade500,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Positioned(
                                              right: 22,
                                              bottom: 3,
                                              child: GestureDetector(
                                                child: _heart,
                                                onTap: () {
                                                  setState(() {
                                                    _heart = _heartfilled;
                                                    _heartfilled = _heart;
                                                  });
                                                },
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 3,
                                              child: GestureDetector(
                                                child: LineIcon(
                                                  LineIcons.share,
                                                  color: Colors.white,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    _heart = _heartfilled;
                                                    _heartfilled = _heart;
                                                  });
                                                },
                                              ),
                                            )
                                          ]),
                                      Text(
                                        "${product_name[index]}",
                                        style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: HexColor('#B67A4F')),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        child: TextButton(
                                          onPressed: () {
                                            Get.to(secondscreen());
                                          },
                                          child: Text('View price'),
                                          style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(0))),
                                        ),
                                      )
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   children: [
                                      //     SizedBox(
                                      //       width: 30,
                                      //     ),
                                      //     Text(
                                      //       '\$${curr_price[index]}',
                                      //       style: TextStyle(
                                      //           color: Colors.red.shade900,
                                      //           fontWeight: FontWeight.bold,
                                      //           fontSize: 18),
                                      //     ),
                                      //     SizedBox(
                                      //       width: 2,
                                      //     ),
                                      //     Text(
                                      //       '\$${orig_price[index]}',
                                      //       style: TextStyle(
                                      //           color: Colors.grey.shade500,
                                      //           decoration:
                                      //               TextDecoration.lineThrough,
                                      //           fontSize: 15),
                                      //     ),
                                      //     SizedBox(
                                      //       width: 24,
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Row(
                    children: [
                      Text(
                        'Latest Sales',
                        style: TextStyle(
                            color: HexColor('#B67A4F'),
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
                                    color: HexColor('#B67A4F').withOpacity(0.4),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'Nunito'),
                              ),
                              Icon(
                                Icons.add,
                                color: HexColor('#B67A4F').withOpacity(0.4),
                                size: 18,
                              )
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 270,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: product_name.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 128,
                                      width: 160,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade500,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18))),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${product_name[index]}",
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          color: HexColor('#B67A4F')),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 20,
                                      child: TextButton(
                                        onPressed: () {
                                          Get.to(secondscreen());
                                        },
                                        child: Text('View price'),
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(0))),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 24,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(secondscreen());
                                      },
                                      child: Text(
                                        'Add to cart',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Nunito'),
                                      ),
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 10,
                                                  left: 50,
                                                  right: 50)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  HexColor('#B67A4F')),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ))),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: product_name.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 148,
                                  width: 335,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
    ));
  }
}
