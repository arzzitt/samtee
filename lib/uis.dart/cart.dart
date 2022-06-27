import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:login_flow/uis.dart/track_order.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

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
                                color: Colors.black,
                                fontSize: 20),
                          ),
                        ),
                        Text(
                          '\$23',
                          style: TextStyle(
                              color: Colors.red.shade700, fontSize: 18),
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
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.only(
                              top: 10, bottom: 10, left: 90, right: 90)),
                          backgroundColor:
                              MaterialStateProperty.all(HexColor('#00c0e5')),
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
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();
                  }),
              title: Text(
                'Shopping Cart',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 1,
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: HexColor('#00c0e5'),
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
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Text(
                      '${name.length}',
                      style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: name.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 100,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${name[index]}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '\$${price[index]}',
                                      style: TextStyle(
                                          color: Colors.red.shade700,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Size ${color[index]} ${size[index]}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                        ),
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: TextButton(
                                              style: ButtonStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.only(
                                                              right: 1)),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors
                                                              .grey.shade300)),
                                              onPressed: () {
                                                _incrementCount();
                                              },
                                              child: LineIcon(
                                                LineIcons.plus,
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                size: 20,
                                              )),
                                        ),
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child:
                                              Center(child: Text('$_counter')),
                                        ),
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: TextButton(
                                              style: ButtonStyle(
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.only(
                                                              right: 1)),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors
                                                              .grey.shade300)),
                                              onPressed: () {
                                                _decrementCount();
                                              },
                                              child: LineIcon(
                                                LineIcons.minus,
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                size: 20,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            )));
  }
}
