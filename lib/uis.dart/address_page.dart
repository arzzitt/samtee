import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:login_flow/uis.dart/address/add_address.dart';
import 'package:login_flow/uis.dart/place_order.dart';

import '../apis/Access.dart';
import '../models/cartmodel.dart';
import '../storage.dart';

class Address_page extends StatefulWidget {
  const Address_page({Key? key}) : super(key: key);

  @override
  State<Address_page> createState() => _Address_pageState();
}

class _Address_pageState extends State<Address_page> {
  bool loading = true;
  CartModel? cartadd;

  SharedPreferencesInit() async {
    await Storage.init();
  }

  @override
  void initState() {
    SharedPreferencesInit();
    access().get_address().then((value) {
      setState(() {
        cartadd = CartModel.fromJson(value);
        loading = false;
      });
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  Get.back();
                },
              ),
              title: Text(
                'My Address',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            body: loading
                ? Center(
                  child: CircularProgressIndicator(
                  color: HexColor('#B67A4F')),
                )
                : Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text('Billing Address',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 30,
                            color: HexColor('#B67A4F'))),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    cartadd!.shippingAddress.firstName.isEmpty ||
                        cartadd!.shippingAddress.lastName.isEmpty ||
                        cartadd!.shippingAddress.address_1.isEmpty ||
                        cartadd!.shippingAddress.address_2.isEmpty ||
                        cartadd!.shippingAddress.phone.isEmpty ||
                        cartadd!.shippingAddress.country.isEmpty ||
                        cartadd!.shippingAddress.postcode.isEmpty ||
                        cartadd!.shippingAddress.state.isEmpty ||
                        cartadd!.shippingAddress.city.isEmpty?GestureDetector(
                      onTap: (){
                        Get.to(Add_address())?.then((value) {
                          initState();
                        });
                      },
                      child: Text(
                        "+ Add address",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600),
                      ),
                    ):Material(
                      borderRadius: BorderRadius.circular(12),
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 2,
                        padding: EdgeInsets.only(top: 12, left: 12),
                        child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          '${cartadd?.shippingAddress.firstName}   ' +
                                              '${cartadd?.shippingAddress.lastName}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.42),
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                            child: LineIcon(
                                              LineIcons.edit,
                                              color: HexColor('#B67A4F'),
                                              size: 25,
                                            ),
                                            onTap: () async {
                                             final result= await Get.to(()=>Add_address());
                                             if(result!=null){
                                               setState((){
                                                 initState();
                                               });
                                             }
                                            }),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${cartadd?.shippingAddress.address_1},',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                      Text(
                                        '${cartadd?.shippingAddress.address_2}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${cartadd?.shippingAddress.city},',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                      Text(
                                        '${cartadd?.shippingAddress.state},',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                      Text(
                                        '${cartadd?.shippingAddress.postcode},',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                      Text(
                                        '${cartadd?.shippingAddress.country}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${cartadd?.shippingAddress.phone}',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    cartadd!.shippingAddress.firstName.isEmpty ||
                        cartadd!.shippingAddress.lastName.isEmpty ||
                        cartadd!.shippingAddress.address_1.isEmpty ||
                        cartadd!.shippingAddress.address_2.isEmpty ||
                        cartadd!.shippingAddress.phone.isEmpty ||
                        cartadd!.shippingAddress.country.isEmpty ||
                        cartadd!.shippingAddress.postcode.isEmpty ||
                        cartadd!.shippingAddress.state.isEmpty ||
                        cartadd!.shippingAddress.city.isEmpty?Container():TextButton(
                      onPressed: () {
                        Get.to(Checkout());
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600),
                      ),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.only(
                              top: 12, bottom: 12, left: 90, right: 90)),
                          backgroundColor:
                              MaterialStateProperty.all(HexColor('#B67A4F')),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                    ),
                  ],
                ),
              ),
            )));
  }
}
