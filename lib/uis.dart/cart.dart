import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:login_flow/apis/Access.dart';
import 'package:login_flow/models/Product_des_model.dart';
import 'package:login_flow/models/cartmodel.dart';
import 'package:login_flow/uis.dart/cart_item.dart';
import 'package:login_flow/uis.dart/track_order.dart';

import '../storage.dart';

class Cart extends StatefulWidget {
  Cart( {Key? key}) : super(key: key);

  late int product_id;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<String> name = ['Bag', 'Vineeta Shoes'];
  List<int> price = [18, 5];
  List<String> color = ['Blue', 'red'];
  List<String> size = ['M', 'L'];

  int _counter = 0;

  void _incrementCount() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCount() {
    setState(() => _counter--);
  }

  int addprice() {
    int final_price = 0;
    for (int i = 0; i <= price.length; i++) {
      final_price += price[i];
    }
    return final_price;
  }

  bool loading = true;
  CartModel? cartres;

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
                height: MediaQuery.of(context).size.height * 0.13,
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
                                fontSize: 20),
                          ),
                        ),
                        Text(
                          '\$${cartres?.totals.total_price}',
                          style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 18,
                              fontFamily: 'Nunito'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(trackOrder59());
                      },
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito'),
                      ),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.only(
                              top: 10, bottom: 10, left: 90, right: 90)),
                          backgroundColor:
                              MaterialStateProperty.all(HexColor('#B67A4F')),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                          ))),
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
                                  image:
                                      cartres!.items[index].images[index].src,
                                  item_name : cartres!.items[index].name,
                                  price: cartres!.items[index].prices.price.toString(),
                                  quantity: cartres!.items[index].quantity.toString(),
                                  Item_key : cartres!
                                      .items[
                                  index]
                                      .key,
                                Index: index
                              );
                            }),
                      )
                    ],
                  )));
  }
  Widget cartitem({required String image,item_name,price,quantity,Item_key,int? Index}){
    return  Padding(
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

                image: NetworkImage(
                    image),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: HexColor('#B67A4F').withOpacity(0.5),
                      width: 0.5
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
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
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
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
                              access()
                                  .removefromcart(
                                Item_key)
                                  .then((value) {
                                if (value[
                                "success"] ==
                                    false) {
                                  Fluttertoast.showToast(
                                      msg:
                                      "${"Can\'t remove product"}",
                                      toastLength: Toast
                                          .LENGTH_SHORT,
                                      gravity:
                                      ToastGravity
                                          .BOTTOM,
                                      timeInSecForIosWeb:
                                      1,
                                      backgroundColor:
                                      Colors.red
                                          .shade400,
                                      textColor:
                                      Colors
                                          .white,
                                      fontSize: 16.0);
                                } else {
                                  Fluttertoast.showToast(
                                      msg:
                                      "${"Product removed"}",
                                      toastLength: Toast
                                          .LENGTH_SHORT,
                                      gravity:
                                      ToastGravity
                                          .BOTTOM,
                                      timeInSecForIosWeb:
                                      1,
                                      backgroundColor:
                                      Colors.green
                                          .shade400,
                                      textColor:
                                      Colors
                                          .white,
                                      fontSize: 16.0);

                                  setState(() {
                                    loading = false;
                                    cartres?.items
                                        .removeAt(
                                        Index!);
                                  });
                                }
                              });
                            },
                            child: Icon(Icons.delete,
                                size: 20,
                                color: Colors.red))),
                    SizedBox(
                      width: MediaQuery.of(context)
                          .size
                          .width *
                          0.3,
                    ),
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      mainAxisAlignment:
                      MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: TextButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty
                                      .all(EdgeInsets
                                      .only(
                                      right:
                                      1)),
                                  backgroundColor: MaterialStateProperty
                                      .all(HexColor(
                                      '#B67A4F')
                                      .withOpacity(
                                      0.2))),
                              onPressed: () async {
                                setState((){
                                  _incrementCount();
                                });
                                access()
                                    .updateitem(
                                    Item_key,
                                    int.parse(quantity))
                                    .then((value) {
                                  if (value[
                                  "success"] ==
                                      false) {
                                    Fluttertoast.showToast(
                                        msg:
                                        "${"Failed"}",
                                        toastLength: Toast
                                            .LENGTH_SHORT,
                                        gravity:
                                        ToastGravity
                                            .BOTTOM,
                                        timeInSecForIosWeb:
                                        1,
                                        backgroundColor:
                                        Colors.red
                                            .shade400,
                                        textColor:
                                        Colors
                                            .white,
                                        fontSize:
                                        16.0);
                                  } else {


                                    if (value[
                                    "success"] ==
                                        true) {
                                      Fluttertoast.showToast(
                                          msg:
                                          "${"Cart updated"}",
                                          toastLength:
                                          Toast
                                              .LENGTH_SHORT,
                                          gravity: ToastGravity
                                              .BOTTOM,
                                          timeInSecForIosWeb:
                                          1,
                                          backgroundColor:
                                          Colors
                                              .red
                                              .shade400,
                                          textColor:
                                          Colors
                                              .white,
                                          fontSize:
                                          16.0);


                                    }


                                  }
                                });
                              },
                              child: LineIcon(
                                LineIcons.plus,
                                color: HexColor(
                                    '#B67A4F'),
                                size: 20,
                              )),
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Center(
                              child: Text(
                               quantity.toString(),
                                style: TextStyle(
                                    color: HexColor(
                                        '#B67A4F')),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: TextButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty
                                      .all(EdgeInsets
                                      .only(
                                      right:
                                      1)),
                                  backgroundColor: MaterialStateProperty
                                      .all(HexColor(
                                      '#B67A4F')
                                      .withOpacity(
                                      0.2))),
                              onPressed: () {
                                _decrementCount();
                                access()
                                    .updateitem(
                                    Item_key,
                                   quantity)
                                    .then((value) {
                                  if (value[
                                  "success"] ==
                                      false) {
                                    Fluttertoast.showToast(
                                        msg:
                                        "${"Failed"}",
                                        toastLength: Toast
                                            .LENGTH_SHORT,
                                        gravity:
                                        ToastGravity
                                            .BOTTOM,
                                        timeInSecForIosWeb:
                                        1,
                                        backgroundColor:
                                        Colors.red
                                            .shade400,
                                        textColor:
                                        Colors
                                            .white,
                                        fontSize:
                                        16.0);
                                  } else {
                                    if (value[
                                    "success"] ==
                                        true) {
                                      Fluttertoast.showToast(
                                          msg:
                                          "${"Cart updated"}",
                                          toastLength:
                                          Toast
                                              .LENGTH_SHORT,
                                          gravity: ToastGravity
                                              .BOTTOM,
                                          timeInSecForIosWeb:
                                          1,
                                          backgroundColor:
                                          Colors
                                              .red
                                              .shade400,
                                          textColor:
                                          Colors
                                              .white,
                                          fontSize:
                                          16.0);
                                    }
                                  }
                                });
                              },
                              child: LineIcon(
                                LineIcons.minus,
                                color: HexColor(
                                    '#B67A4F'),
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
