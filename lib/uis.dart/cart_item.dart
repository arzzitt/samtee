import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../apis/Access.dart';

class Cart_item extends StatefulWidget {
  final String Item_key; final int quantity; final String item_name; final String image; final String price;


   Cart_item({Key? key,  required this.Item_key, required this.quantity, required this.item_name, required this.image, required this.price}) : super(key: key);

  @override
  State<Cart_item> createState() => _Cart_itemState();
}

class _Cart_itemState extends State<Cart_item> {

  int _counter = 1;
  bool loading = false;

  void _incrementCount() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCount() {
    setState(() => _counter--);
  }

  @override
  Widget build(BuildContext context) {
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

                image: NetworkImage(
                    widget.image),
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
                  widget.item_name,
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
                  '\$${widget.price}',
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
                                      widget.Item_key)
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

                                  // setState(() {
                                  //   loading = false;
                                  //   cartres?.items
                                  //       .removeAt(
                                  //       index);
                                  // });
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
                                   widget.Item_key,
                                   widget.quantity)
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
                                widget.quantity.toString(),
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
                                    widget.Item_key,
                                    widget.quantity)
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
