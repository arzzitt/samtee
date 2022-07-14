import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:login_flow/apis/Access.dart';

import 'package:login_flow/models/cartmodel.dart';

import '../models/Product_des_model.dart';
import '../models/login_model.dart';
import '../storage.dart';

class Checkout extends StatefulWidget {
  Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int _counter = 0;

  void _incrementCount() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCount() {
    setState(() => _counter--);
  }

  bool loading = true;
  bool variation = false;
  CartModel? cartres;
  LoginUsernameResponse? loginmodel;
  ProductDescription? productDescription;
  var data;
  List<Map<String, dynamic>> listItem = <Map<String, dynamic>>[];

  SharedPreferencesInit() async {
    await Storage.init();
  }

  @override
  void initState() {
    super.initState();
    SharedPreferencesInit();
    access().getcart().then((value) {
      setState(() {
        cartres = CartModel.fromJson(value);

        for (var element in cartres!.items) {
          Map<String, dynamic> val = {
            'product_id': element.id,
            'quantity': element.quantity
          };
          listItem.add(val);
        }
        data = {
          'payment_method': "bacs",
          'payment_method_title': "Direct Bank Transfer",
          'set_paid': true,
          "billing[first_name]": cartres!.shippingAddress.firstName,
          "billing[last_name]": cartres!.shippingAddress.lastName,
          "billing[address1]": cartres!.shippingAddress.address_1,
          "billing[address2]": cartres!.shippingAddress.address_2,
          "billing[city]": cartres!.shippingAddress.city,
          "billing[state]":cartres!.shippingAddress.state,
          "billing[postcode]": cartres!.shippingAddress.postcode,
          "billing[country]": cartres!.shippingAddress.country,
          "billing[email]": cartres!.billingAddress.email,
          "billing[phone]":cartres!.shippingAddress.phone,
          "shipping[first_name]": cartres!.shippingAddress.firstName,
          "shipping[last_name]": cartres!.shippingAddress.lastName,
          "shipping[address1]": cartres!.shippingAddress.address_1,
          "shipping[address2]":cartres!.shippingAddress.address_2,

          "shipping[city]": cartres!.shippingAddress.city,
          "shipping[state]": cartres!.shippingAddress.state,
          "shipping[postcode]": cartres!.shippingAddress.postcode,
          "shipping[country]": cartres!.shippingAddress.country,
          'line_items': listItem,
          'shipping_lines': [
            {
              'method_id': "flat_rate",
              'method_title': "Flat Rate",
              'total': "10.00"
            }
          ]
        };

        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: BottomAppBar(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Total Amount :',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor('#B67A4F'),
                                fontFamily: 'Nunito',
                                fontSize: 18),
                          ),
                        ),
                        Text(
                          '\$${cartres?.totals.total_price ?? 0}',
                          style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 18,
                              fontFamily: 'Nunito'),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.23),
                        GestureDetector(
                          child: Container(
                            height: 35,
                            width: 80,
                            child: Center(
                              child: Text('Checkout',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: HexColor('#B67A4F')),
                          ),
                          onTap: () {
                            access()
                                .createorder(
                                    listItem,
                                    cartres!.shippingAddress.firstName,
                                    cartres!.shippingAddress.lastName,
                                    cartres!.shippingAddress.address_1,
                                    cartres!.shippingAddress.address_2,
                                    cartres!.shippingAddress.city,
                                    cartres!.shippingAddress.state,
                               cartres!.shippingAddress.postcode.toString(),
                                    cartres!.shippingAddress.country,
                                    cartres!.billingAddress.email,
                                   cartres!.shippingAddress.phone.toString())
                                .then((value) async {
                              if (value["success"] == false) {
                                Fluttertoast.showToast(
                                    msg: "${"Failed"}",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red.shade400,
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                                setState(() {
                                  loading = false;
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: "${"Order Confirmed"}",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green.shade400,
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                                setState(() {
                                  loading = false;
                                });
                              }
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: HexColor('#B67A4F'),
                  ),
                  onPressed: () {
                    Get.back();
                  }),
              title: Text(
                'Shopping Cart',
                style: TextStyle(
                    color: HexColor('#B67A4F'),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito'),
              ),
              centerTitle: true,
              elevation: 1,
            ),
            body: loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 15,
                        width: MediaQuery.of(context).size.height * 0.7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: HexColor('#B67A4F'),
                            radius: 20,
                            child: LineIcon(
                              LineIcons.shoppingCart,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('In your Cart',
                              style: TextStyle(
                                  color: HexColor('#B67A4F'),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Nunito')),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                          ),
                          Text(
                            '${cartres?.items.length}',
                            style: TextStyle(
                                color: Colors.red.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Nunito'),
                          )
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: cartres?.items.length,
                            itemBuilder: (BuildContext context, int index) {
                              // return Cart_item(
                              //   image:
                              //       cartres!.items[index].images[index].src,
                              //   item_name : cartres!.items[index].name,
                              //   price: cartres!.items[index].prices.price,
                              //   quantity: cartres!.items[index].quantity,
                              //   Item_key : cartres!
                              //       .items[
                              //   index]
                              //       .key,
                              //
                              // );
                              return cartitem(
                                  image: cartres!.items[index].images[0].src,
                                  item_name: cartres!.items[index].name,
                                  price: cartres!.items[index].prices.price
                                      .toString(),
                                  quantity:
                                      cartres!.items[index].quantity.toString(),
                                  Item_key: cartres!.items[index].key,
                                  Index: index);
                            }),
                      )
                    ],
                  )));
  }

  Widget cartitem(
      {required String image,
      item_name,
      price,
      quantity,
      Item_key,
      int? Index}) {
    int itemcount = int.parse(quantity);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Row(
          children: [
            Container(
              height: 80,
              width: 100,
              clipBehavior: Clip.antiAlias,
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(image),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: HexColor('#B67A4F').withOpacity(0.5), width: 0.5)),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item_name,
                  style: TextStyle(
                      color: HexColor('#B67A4F'),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'Nunito'),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '\$$price',
                  style: TextStyle(
                      color: Colors.red.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'Nunito'),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(
                    //   'Size ${color[index]} ${size[index]}',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontFamily: 'Nunito',
                    //       color: HexColor('#B67A4F')),
                    // ),
                    SizedBox(
                        child: GestureDetector(
                            onTap: () {
                              cartres?.items.removeAt(Index!);
                              access().removefromcart(Item_key).then((value) {
                                if (value["success"] == false) {
                                  Get.back();
                                  Get.to(() => Checkout());
                                  Fluttertoast.showToast(
                                      msg: "${"Can\'t remove product"}",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red.shade400,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  Get.back();
                                  Get.to(() => Checkout());
                                  Fluttertoast.showToast(
                                      msg: "${"Product removed"}",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.green.shade400,
                                      textColor: Colors.white,
                                      fontSize: 16.0);

                                  setState(() {
                                    loading = false;
                                  });
                                }
                              });
                            },
                            child: Icon(Icons.delete,
                                size: 20, color: Colors.red))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: TextButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.only(right: 1)),
                                  backgroundColor: MaterialStateProperty.all(
                                      HexColor('#B67A4F').withOpacity(0.2))),
                              onPressed: () async {
                                setState(() {
                                  Get.appUpdate();
                                  itemcount++;
                                });
                                access()
                                    .updateitem(Item_key, itemcount)
                                    .then((value) {
                                  if (value["success"] == false) {
                                    Fluttertoast.showToast(
                                        msg: "${"Failed"}",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red.shade400,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    Get.back();
                                    Get.to(() => Checkout());

                                    Fluttertoast.showToast(
                                        msg: "${"Cart updated"}",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red.shade400,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                });
                              },
                              child: LineIcon(
                                LineIcons.plus,
                                color: HexColor('#B67A4F'),
                                size: 20,
                              )),
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Center(
                              child: Text(
                            itemcount.toString(),
                            style: TextStyle(color: HexColor('#B67A4F')),
                          )),
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: TextButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.only(right: 1)),
                                  backgroundColor: MaterialStateProperty.all(
                                      HexColor('#B67A4F').withOpacity(0.2))),
                              onPressed: () {
                                setState(() {
                                  itemcount--;
                                });
                                access()
                                    .updateitem(Item_key, itemcount)
                                    .then((value) {
                                  if (value["success"] == false) {
                                    Fluttertoast.showToast(
                                        msg: "${"Failed"}",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red.shade400,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    Get.back();
                                    Get.to(() => Checkout());

                                    Fluttertoast.showToast(
                                        msg: "${"Cart updated"}",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red.shade400,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                });
                              },
                              child: LineIcon(
                                LineIcons.minus,
                                color: HexColor('#B67A4F'),
                                size: 20,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
