// ignore_for_file: deprecated_member_use

import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:login_flow/apis/Access.dart';
import 'package:login_flow/models/Product_des_model.dart';

class PD extends StatefulWidget {
  const PD({Key? key, required this.product_id}) : super(key: key);

  final int product_id;


  @override
  State<PD> createState() => _PDState();
}

class _PDState extends State<PD> {
  int value = 0;
  Widget CustomRadioButton(String text, int index) {
    return SizedBox(
      height: 50,
      width: 50,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            value = index;
          });
        },
        child: Text(
          text,
          style: TextStyle(
            color: (value == index) ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.all((value == index)
                ? HexColor('#00c0e5')
                : HexColor('#00c0e5').withOpacity(0.2)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(80))))),
      ),
    );
  }

  int _counter = 0;

  void _incrementCount() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCount() {
    setState(() => _counter--);
  }

  // List<String> name = ['Alexa', 'Bixby'];
  // List<String> review = ['Its good', 'Best product'];
  // List<double> rating = [1, 3.5];
  // List<Image> image = [];

//  List<ProductDescription> product_des = [];

  bool loading = true;
  ProductDescription? productDescription;

  @override
  void initState() {
    super.initState();

    access().productdes(widget.product_id.toString()).then((value) async {
      setState(() {
        productDescription = ProductDescription.fromJson(value);
        loading = false;
      });
    });
  }

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
            onPressed: () {
              Get.back();
            }),
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 2, bottom: 0, left: 40, right: 40),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Shop now',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.only(top: 15, bottom: 15, left: 90, right: 90)),
                backgroundColor: MaterialStateProperty.all(HexColor('#00c0e5')),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ))),
          ),
        ),
      ),
      backgroundColor: Colors.grey,
      body: loading
          ? Center(child: CircularProgressIndicator(color: HexColor('#B67A4F')))
          : SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: 526,
                  width: 375,
                  child: Image(
                      image:
                          NetworkImage('${productDescription?.images[0].src}')),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${productDescription?.name}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text('\$${productDescription?.price}',
                                style: TextStyle(
                                    color: Colors.red.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                            SizedBox(
                              width: 179,
                            ),
                            SizedBox(
                              height: 35,
                              width: 35,
                              child: TextButton(
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.only(right: 1)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.grey.shade300)),
                                  onPressed: () {
                                    _incrementCount();
                                  },
                                  child: LineIcon(
                                    LineIcons.plus,
                                    color: Colors.black.withOpacity(0.5),
                                  )),
                            ),
                            Container(
                                height: 35,
                                width: 45,
                                child: Center(child: Text('$_counter'))),
                            SizedBox(
                              height: 35,
                              width: 35,
                              child: TextButton(
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.only(right: 1)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.grey.shade300)),
                                  onPressed: () {
                                    _decrementCount();
                                  },
                                  child: LineIcon(
                                    LineIcons.minus,
                                    color: Colors.black.withOpacity(0.5),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Size:',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6),
                            Text(
                              'Size Guide',
                              style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomRadioButton('XS', 1),
                            CustomRadioButton('S', 2),
                            CustomRadioButton('M', 3),
                            CustomRadioButton('L', 4),
                            CustomRadioButton('XL', 5),
                            CustomRadioButton('XXL', 6),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Color:',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Product Description',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('${productDescription?.description}'),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text('Reviews (${review.length})',
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 18)),
                        //     TextButton(
                        //       onPressed: () {},
                        //       child: Text(
                        //         'See all reviews',
                        //         style: TextStyle(
                        //             color: Colors.grey.shade500,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 14),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.5,
                        //   child: ListView.builder(
                        //       padding: const EdgeInsets.all(8),
                        //       itemCount: name.length,
                        //       itemBuilder: (BuildContext context, int index) {
                        //         return Padding(
                        //           padding: const EdgeInsets.only(top: 5, bottom: 10),
                        //           child: Container(
                        //             child: Row(
                        //               children: [
                        //                 Container(
                        //                   height: 43,
                        //                   width: 43,
                        //                   decoration: BoxDecoration(
                        //                       color: Colors.grey,
                        //                       borderRadius:
                        //                           BorderRadius.circular(18)),
                        //                 ),
                        //                 SizedBox(
                        //                   width: MediaQuery.of(context).size.width *
                        //                       0.03,
                        //                 ),
                        //                 Column(
                        //                   crossAxisAlignment:
                        //                       CrossAxisAlignment.start,
                        //                   children: [
                        //                     Row(
                        //                       children: [
                        //                         Text(
                        //                           '${name[index]}',
                        //                           style: TextStyle(fontSize: 15),
                        //                         ),
                        //                         SizedBox(
                        //                             width: MediaQuery.of(context)
                        //                                     .size
                        //                                     .width *
                        //                                 0.35),
                        //                         RatingBar.builder(
                        //                           initialRating: 3,
                        //                           minRating: 1,
                        //                           direction: Axis.horizontal,
                        //                           allowHalfRating: true,
                        //                           itemCount: 5,
                        //                           itemSize: 18,
                        //                           itemPadding: EdgeInsets.symmetric(
                        //                               horizontal: 1.0),
                        //                           itemBuilder: (context, _) => Icon(
                        //                             Icons.star,
                        //                             color: Colors.amber,
                        //                           ),
                        //                           onRatingUpdate: (rating) {
                        //                             print(rating);
                        //                           },
                        //                         )
                        //                       ],
                        //                     ),
                        //                     SizedBox(
                        //                       height: 10,
                        //                     ),
                        //                     Text(
                        //                       '${review[index]}',
                        //                       style: TextStyle(
                        //                           color: Colors.grey.shade700),
                        //                     )
                        //                   ],
                        //                 )
                        //               ],
                        //             ),
                        //           ),
                        //         );
                        //       }),
                        // )
                      ],
                    ),
                  ),
                )
              ]),
            ),
    ));
  }
}
