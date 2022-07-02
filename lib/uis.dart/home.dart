import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:login_flow/apis/Access.dart';
import 'package:login_flow/models/CataegoriesRes.dart';

import 'package:login_flow/uis.dart/cart.dart';

import '../models/AllProductRes.dart';
import '../models/carouselProducts.dart';
import '../models/categoriesList.dart';
import '../storage.dart';
import 'categories/category2.dart';
import 'categories_second.dart';
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
  bool loading_cat = true;
  bool loading_featured = true;
  bool loading_cart = true;
  String nonce = "";

  final List<String> imageList = [];

  final PageController _pagecontroller = PageController();

  List categoryItems = [];
  List<AllProductRes> allProductRes = [];
  List<CarouselProducts> carProducts = [];
  List<CategoriesList> categList = [];

  @override
  void initState() {
    super.initState();

    if (loading_cart && !loading_cat && !loading_featured) {
      setState(() {
        loading = false;
        print("nonce:$nonce");
      });
    }

    access().productCarousel().then((value) async {
      setState(() {
        for (Map i in value.data) {
          carProducts.add(CarouselProducts.fromJson(i));
        }
        loading_featured = false;

        print("carousel: $carProducts");
        print(carProducts.length);
      });
    });

    access().categoriesList().then((value) async {
      setState(() {
        final pages = value.headers.value("X-WP-Total") ?? "1";
        Storage.set_categoryTotal(pages.toString());
        print("pages:${Storage.get_categoryTotal()}");
        for (Map i in value.data) {
          categList.add(CategoriesList.fromJson(i));
        }
        loading_cat = false;

        print("carousel: $categList");
        print(categList.length);
      });
    });
    access().getcart().then((value) async {
      nonce = await Storage.get_noncetoken();
      setState(() {
        // cartres = CartModel.fromJson(value);
        loading_cart = false;
        print("done");
        print("nonce:$nonce");
      });
    });
    // if(loading_cart&&!loading_cat&&!loading_featured){
    //   setState((){
    //     loading=false;
    //     print("nonce:$nonce");
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: loading_cart || loading_featured || loading_cat
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 225,
                      child: CarouselSlider.builder(
                          itemCount: carProducts.length,
                          options: CarouselOptions(height: 300),
                          itemBuilder: (ctx, index, realIdx) {
                            return Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(PD(
                                            product_id:
                                                 carProducts[index].id!
                                                ));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            border: Border.all(),
                                            color: const Color(0xFF1f4068),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: carProducts.isEmpty
                                                    ? AssetImage(
                                                        "lib/images/loading.png")
                                                    : NetworkImage(
                                                        carProducts[index]
                                                            .images1![0]
                                                            .src
                                                            .toString(),
                                                      ) as ImageProvider)),
                                      ),
                                    ),
                                  )
                                ]));
                          }),
                    ),

                    //     Container(
                    //       height: 200,
                    //       child:  GFCarousel(
                    //           //autoPlay:true,
                    //           items: imageList.map(
                    //           (url) {
                    //             return Container(
                    //               margin: EdgeInsets.all(4.0),
                    //               child: ClipRRect(
                    //                 borderRadius: BorderRadius.all(Radius.circular(15)),
                    //                 child: Image.network(
                    //                     url,
                    //                     fit: BoxFit.cover,
                    //                     width: 1000.0
                    //                 ),
                    //               ),
                    //             );
                    // } ).toList(),
                    //       )),

                    Padding(
                      padding: const EdgeInsets.all(0),
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
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
                                        "View all",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: HexColor('#B67A4F'),
                                            fontFamily: 'Nunito',
                                            fontSize: 13),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
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
                                        "Categories",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: HexColor('#B67A4F'),
                                            fontFamily: 'Nunito',
                                            fontSize: 11),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
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
                                        "kids",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: HexColor('#B67A4F'),
                                            fontFamily: 'Nunito',
                                            fontSize: 13),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
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
                                        "all",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: HexColor('#B67A4F'),
                                            fontFamily: 'Nunito',
                                            fontSize: 13),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    categList == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.8,
                              crossAxisCount: 4,
                            ),
                            shrinkWrap: true,
                            itemCount: categList.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) => Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  index <= categList.length - 2
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          //mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              //color: Colors.black,
                                              width: 40,
                                              height: 40,

                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,

                                                color: Color(0xffB67A4F)
                                                    .withOpacity(0.5),
                                                // image: DecorationImage(
                                                //   image: NetworkImage(categList[index].image.toString())
                                                // ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              categList[index].name.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 10),
                                            )
                                          ],
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        categoryListComplete()));
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color(0xffB67A4F)
                                                    .withOpacity(0.5)),
                                            child: Center(
                                              child: Text(
                                                "View all",
                                                style: TextStyle(
                                                    color: Color(0xffB67A4F)),
                                              ),
                                            ),
                                          ),
                                        )
                                ],
                              ),
                            ),
                          ),

                    // SizedBox(
                    //   height: 120,
                    //
                    //   child: ListView.builder(
                    //     clipBehavior: Clip.antiAliasWithSaveLayer,
                    //       scrollDirection: Axis.horizontal,
                    //       shrinkWrap: true,
                    //       physics: ScrollPhysics(),
                    //       padding: const EdgeInsets.all(8),
                    //       itemCount: categRes.length,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return TextButton(
                    //             onPressed: () {
                    //               print(categRes[index].name);
                    //               final homeCategId = categRes[index].id;
                    //               print(homeCategId);
                    //               Storage.set_categoryIdHome(homeCategId.toString());
                    //               print(
                    //                   "stored categ id: ${Storage.get_categoryIdHome().toString()}");
                    //             },
                    //             child: Container(
                    //               height:80,
                    //               width:50,
                    //               child: Center(
                    //                 child: Column(
                    //                   mainAxisSize: MainAxisSize.min,
                    //                   children: [
                    //                     CircleAvatar(
                    //                       radius: 25,
                    //                       backgroundColor: Colors.blue.withOpacity(0.2),
                    //                       child: Icon(
                    //                         Icons.local_mall,
                    //                         color: Colors.blue,
                    //                         size: 20,
                    //                       ),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 5,
                    //                     ),
                    //                     Expanded(
                    //                       child: Text(
                    //                         categRes[index].name!,
                    //                         textAlign: TextAlign.center,
                    //                         style: TextStyle(
                    //                             color: HexColor('#B67A4F'),
                    //                             fontFamily: 'Nunito',
                    //                         fontSize: 10),
                    //                       ),
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //             ));
                    //       }),
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Sale Discount',
                    //       style: TextStyle(
                    //           color: HexColor('#B67A4F'),
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 20,
                    //           fontFamily: 'Nunito'),
                    //     ),
                    //     SizedBox(
                    //       width: 117,
                    //     ),
                    //     TextButton(
                    //         onPressed: () {},
                    //         child: Row(
                    //           children: [
                    //             Text(
                    //               'See all',
                    //               style: TextStyle(
                    //                   color: HexColor('#B67A4F').withOpacity(0.4),
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 18,
                    //                   fontFamily: 'Nunito'),
                    //             ),
                    //             Icon(
                    //               Icons.add,
                    //               color: HexColor('#B67A4F').withOpacity(0.4),
                    //               size: 18,
                    //             )
                    //           ],
                    //         ))
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 177,
                    //   child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       shrinkWrap: true,
                    //       physics: ScrollPhysics(),
                    //       padding: const EdgeInsets.all(8),
                    //       itemCount: allProductRes.length,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return Container(
                    //           child: Row(
                    //             children: [
                    //               GestureDetector(
                    //                 onTap: () {
                    //                   Get.to(PD());
                    //                 },
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   children: [
                    //                     Stack(
                    //                         alignment: Alignment.bottomRight,
                    //                         children: [
                    //                           Container(
                    //                             height: 122,
                    //                             width: 115,
                    //                             decoration: BoxDecoration(
                    //                               //image: DecorationImage(image: NetworkImage(allProductRes[index].images![index].src!)),
                    //                                 color: Colors.grey.shade500,
                    //                                 borderRadius: BorderRadius.all(
                    //                                     Radius.circular(5))),
                    //                           ),
                    //                           Positioned(
                    //                             right: 22,
                    //                             bottom: 3,
                    //                             child: GestureDetector(
                    //                               child: _heart,
                    //                               onTap: () {
                    //                                 setState(() {
                    //                                   _heart = _heartfilled;
                    //                                   _heartfilled = _heart;
                    //                                 });
                    //                               },
                    //                             ),
                    //                           ),
                    //                           Positioned(
                    //                             bottom: 3,
                    //                             child: GestureDetector(
                    //                               child: LineIcon(
                    //                                 LineIcons.share,
                    //                                 color: Colors.white,
                    //                               ),
                    //                               onTap: () {
                    //                                 setState(() {
                    //                                   _heart = _heartfilled;
                    //                                   _heartfilled = _heart;
                    //                                 });
                    //                               },
                    //                             ),
                    //                           )
                    //                         ]),
                    //                     Text(
                    //                       "${allProductRes[index].name}",
                    //                       style: TextStyle(
                    //                           fontFamily: 'Nunito',
                    //                           color: HexColor('#B67A4F')),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 20,
                    //                       child: TextButton(
                    //                         onPressed: () {
                    //                           Get.to(secondscreen());
                    //                         },
                    //                         child: Text(
                    //                           'View price',
                    //                           style: TextStyle(),
                    //                         ),
                    //                         style: ButtonStyle(
                    //                             padding: MaterialStateProperty.all(
                    //                                 EdgeInsets.all(0))),
                    //                       ),
                    //                     )
                    //                     // Row(
                    //                     //   mainAxisAlignment: MainAxisAlignment.center,
                    //                     //   children: [
                    //                     //     SizedBox(
                    //                     //       width: 30,
                    //                     //     ),
                    //                     //     Text(
                    //                     //       '\$${curr_price[index]}',
                    //                     //       style: TextStyle(
                    //                     //           color: Colors.red.shade900,
                    //                     //           fontWeight: FontWeight.bold,
                    //                     //           fontSize: 18),
                    //                     //     ),
                    //                     //     SizedBox(
                    //                     //       width: 2,
                    //                     //     ),
                    //                     //     Text(
                    //                     //       '\$${orig_price[index]}',
                    //                     //       style: TextStyle(
                    //                     //           color: Colors.grey.shade500,
                    //                     //           decoration:
                    //                     //               TextDecoration.lineThrough,
                    //                     //           fontSize: 15),
                    //                     //     ),
                    //                     //     SizedBox(
                    //                     //       width: 24,
                    //                     //     ),
                    //                     //   ],
                    //                     // )
                    //                   ],
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 5,
                    //               )
                    //             ],
                    //           ),
                    //         );
                    //       }),
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Popular Items',
                    //       style: TextStyle(
                    //           color: HexColor('#B67A4F'),
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 20,
                    //           fontFamily: 'Nunito'),
                    //     ),
                    //     SizedBox(
                    //       width: 117,
                    //     ),
                    //     TextButton(
                    //         onPressed: () {},
                    //         child: Row(
                    //           children: [
                    //             Text(
                    //               'See all',
                    //               style: TextStyle(
                    //                   color: HexColor('#B67A4F').withOpacity(0.4),
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 18,
                    //                   fontFamily: 'Nunito'),
                    //             ),
                    //             Icon(
                    //               Icons.add,
                    //               color: HexColor('#B67A4F').withOpacity(0.4),
                    //               size: 18,
                    //             )
                    //           ],
                    //         ))
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 205,
                    //   child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       shrinkWrap: true,
                    //       physics: ScrollPhysics(),
                    //       padding: const EdgeInsets.all(8),
                    //       itemCount: product_name.length,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return Container(
                    //           child: Row(
                    //             children: [
                    //               GestureDetector(
                    //                 onTap: () {
                    //                   Get.to(PD());
                    //                 },
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   children: [
                    //                     Stack(
                    //                         alignment: Alignment.bottomRight,
                    //                         children: [
                    //                           Container(
                    //                             height: 150,
                    //                             width: 150,
                    //                             decoration: BoxDecoration(
                    //                                 color: Colors.grey.shade500,
                    //                                 borderRadius: BorderRadius.all(
                    //                                     Radius.circular(5))),
                    //                           ),
                    //                           Positioned(
                    //                             right: 22,
                    //                             bottom: 3,
                    //                             child: GestureDetector(
                    //                               child: _heart,
                    //                               onTap: () {
                    //                                 setState(() {
                    //                                   _heart = _heartfilled;
                    //                                   _heartfilled = _heart;
                    //                                 });
                    //                               },
                    //                             ),
                    //                           ),
                    //                           Positioned(
                    //                             bottom: 3,
                    //                             child: GestureDetector(
                    //                               child: LineIcon(
                    //                                 LineIcons.share,
                    //                                 color: Colors.white,
                    //                               ),
                    //                               onTap: () {
                    //                                 setState(() {
                    //                                   _heart = _heartfilled;
                    //                                   _heartfilled = _heart;
                    //                                 });
                    //                               },
                    //                             ),
                    //                           )
                    //                         ]),
                    //                     Text(
                    //                       "${product_name[index]}",
                    //                       style: TextStyle(
                    //                           fontFamily: 'Nunito',
                    //                           color: HexColor('#B67A4F')),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 20,
                    //                       child: TextButton(
                    //                         onPressed: () {
                    //                           Get.to(secondscreen());
                    //                         },
                    //                         child: Text('View price'),
                    //                         style: ButtonStyle(
                    //                             padding: MaterialStateProperty.all(
                    //                                 EdgeInsets.all(0))),
                    //                       ),
                    //                     )
                    //                     // Row(
                    //                     //   mainAxisAlignment: MainAxisAlignment.center,
                    //                     //   children: [
                    //                     //     SizedBox(
                    //                     //       width: 30,
                    //                     //     ),
                    //                     //     Text(
                    //                     //       '\$${curr_price[index]}',
                    //                     //       style: TextStyle(
                    //                     //           color: Colors.red.shade900,
                    //                     //           fontWeight: FontWeight.bold,
                    //                     //           fontSize: 18),
                    //                     //     ),
                    //                     //     SizedBox(
                    //                     //       width: 2,
                    //                     //     ),
                    //                     //     Text(
                    //                     //       '\$${orig_price[index]}',
                    //                     //       style: TextStyle(
                    //                     //           color: Colors.grey.shade500,
                    //                     //           decoration:
                    //                     //               TextDecoration.lineThrough,
                    //                     //           fontSize: 15),
                    //                     //     ),
                    //                     //     SizedBox(
                    //                     //       width: 24,
                    //                     //     ),
                    //                     //   ],
                    //                     // )
                    //                   ],
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 5,
                    //               )
                    //             ],
                    //           ),
                    //         );
                    //       }),
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Latest Sales',
                    //       style: TextStyle(
                    //           color: HexColor('#B67A4F'),
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 20,
                    //           fontFamily: 'Nunito'),
                    //     ),
                    //     SizedBox(
                    //       width: 117,
                    //     ),
                    //     TextButton(
                    //         onPressed: () {},
                    //         child: Row(
                    //           children: [
                    //             Text(
                    //               'See all',
                    //               style: TextStyle(
                    //                   color: HexColor('#B67A4F').withOpacity(0.4),
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 18,
                    //                   fontFamily: 'Nunito'),
                    //             ),
                    //             Icon(
                    //               Icons.add,
                    //               color: HexColor('#B67A4F').withOpacity(0.4),
                    //               size: 18,
                    //             )
                    //           ],
                    //         ))
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 270,
                    //   child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       shrinkWrap: true,
                    //       padding: const EdgeInsets.all(8),
                    //       itemCount: product_name.length,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return Container(
                    //           child: Row(
                    //             children: [
                    //               Column(
                    //                 children: [
                    //                   Container(
                    //                     height: 128,
                    //                     width: 160,
                    //                     decoration: BoxDecoration(
                    //                         color: Colors.grey.shade500,
                    //                         borderRadius: BorderRadius.all(
                    //                             Radius.circular(18))),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 5,
                    //                   ),
                    //                   Text(
                    //                     "${product_name[index]}",
                    //                     style: TextStyle(
                    //                         fontFamily: 'Nunito',
                    //                         color: HexColor('#B67A4F')),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 5,
                    //                   ),
                    //                   SizedBox(
                    //                     height: 20,
                    //                     child: TextButton(
                    //                       onPressed: () {
                    //                         Get.to(secondscreen());
                    //                       },
                    //                       child: Text('View price'),
                    //                       style: ButtonStyle(
                    //                           padding: MaterialStateProperty.all(
                    //                               EdgeInsets.all(0))),
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     width: 24,
                    //                   ),
                    //                   TextButton(
                    //                     onPressed: () {
                    //                       Get.to(secondscreen());
                    //                     },
                    //                     child: Text(
                    //                       'Add to cart',
                    //                       style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontFamily: 'Nunito'),
                    //                     ),
                    //                     style: ButtonStyle(
                    //                         padding: MaterialStateProperty.all(
                    //                             EdgeInsets.only(
                    //                                 top: 10,
                    //                                 bottom: 10,
                    //                                 left: 50,
                    //                                 right: 50)),
                    //                         backgroundColor:
                    //                             MaterialStateProperty.all(
                    //                                 HexColor('#B67A4F')),
                    //                         shape: MaterialStateProperty.all<
                    //                                 RoundedRectangleBorder>(
                    //                             RoundedRectangleBorder(
                    //                           borderRadius:
                    //                               BorderRadius.circular(18.0),
                    //                         ))),
                    //                   ),
                    //                 ],
                    //               ),
                    //               SizedBox(
                    //                 width: 8,
                    //               )
                    //             ],
                    //           ),
                    //         );
                    //       }),
                    // ),
                    // SizedBox(
                    //   height: 200,
                    //   child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       shrinkWrap: true,
                    //       padding: const EdgeInsets.all(8),
                    //       itemCount: product_name.length,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return Container(
                    //           child: Row(
                    //             children: [
                    //               Container(
                    //                 height: 148,
                    //                 width: 335,
                    //                 decoration: BoxDecoration(
                    //                     color: Colors.grey,
                    //                     borderRadius: BorderRadius.circular(18)),
                    //               ),
                    //               SizedBox(
                    //                 width: 8,
                    //               )
                    //             ],
                    //           ),
                    //         );
                    //       }),
                    // ),
                  ],
                ),
              ),
            ),
    );
  }

  // Widget imageCarousel(BuildContext context){
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     height: 200,
  //     child: CarouselSlider(options: null, items: [],
  //
  //     ),
  //   );
  // }
}
