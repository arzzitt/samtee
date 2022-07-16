import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../apis/Access.dart';
import '../models/Order.dart';
import '../models/cartmodel.dart';
import '../storage.dart';
import 'address/add_address.dart';
import 'address_page.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Orders> get_order = [];
  bool loading = true;

  CartModel? cartadd;

  SharedPreferencesInit() async {
    await Storage.init();
  }

  @override
  void initState() {
    super.initState();

    SharedPreferencesInit();

    access().get_order().then((value) {
      setState(() {
        for (Map<String, dynamic> i in value.data) {
          get_order.add(Orders.fromJson(i));
        }
        loading = false;
      });
    });

    access().get_address().then((value) {
      setState(() {
        cartadd = CartModel.fromJson(value);
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
              color: HexColor('#B67A4F'),
            ),
            onPressed: () {
              Get.back();
            }),
        title: Text(
          'Profile',
          style: TextStyle(
              color: HexColor('#B67A4F'),
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito'),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
              color: HexColor('#B67A4F'),
            ))
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 80,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Center(
                        child: Text('Alexa Smith',
                            style: TextStyle(
                                color: HexColor('#B67A4F'),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Nunito')),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 10,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15,
                              ),
                              backgroundColor: HexColor('#B67A4F'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Verified',
                              style: TextStyle(color: HexColor('#B67A4F')),
                            )
                          ]),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: HexColor('#00c0e5'),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Shared',
                                style: TextStyle(color: HexColor('#B67A4F')),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.red,
                                child: LineIcon(
                                  LineIcons.heartAlt,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Wish List',
                                  style: TextStyle(color: HexColor('#B67A4F')))
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.amber,
                                child: LineIcon(
                                  LineIcons.clock,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Viewed',
                                  style: TextStyle(color: HexColor('#B67A4F')))
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text('My Address',
                          style: TextStyle(
                              color: HexColor('#B67A4F').withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Nunito')),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(
                                  '${cartadd?.shippingAddress.firstName}   ' +
                                      '${cartadd?.shippingAddress.lastName}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                    child: LineIcon(
                                      LineIcons.edit,
                                      color: HexColor('#B67A4F'),
                                      size: 20,
                                    ),
                                    onTap: () {
                                      Get.to(Add_address());
                                    }),
                              )
                            ],
                          ),
                          // Text(
                          //   '${cartadd?.shippingAddress.address_1},' +
                          //       '${cartadd?.shippingAddress.address_2}',
                          //   style: TextStyle(
                          //     fontSize: 16,
                          //     fontFamily: 'Nunito',
                          //   ),
                          // ),
                          Text(
                            '${cartadd?.shippingAddress.city},' +
                                '${cartadd?.shippingAddress.state},' +
                                '${cartadd?.shippingAddress.postcode},' +
                                '${cartadd?.shippingAddress.country}',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Nunito',
                            ),
                          ),

                          Text(
                            '${cartadd?.shippingAddress.phone}',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text('My Orders',
                          style: TextStyle(
                              color: HexColor('#B67A4F').withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Nunito')),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: get_order.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(8),
                                itemCount: get_order[index].lineItems.length,
                                itemBuilder:
                                    (BuildContext context, int index1) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, top: 10),
                                    child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor:
                                                        Colors.green.shade100,
                                                    child: CircleAvatar(
                                                        radius: 10,
                                                        child: LineIcon(
                                                          LineIcons.dollarSign,
                                                          size: 15,
                                                        ),
                                                        backgroundColor:
                                                            Colors.green)),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${get_order[index].lineItems[index1].name}',
                                                      style: TextStyle(
                                                          fontFamily: 'Nunito',
                                                          color: HexColor(
                                                              '#B67A4F'),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Status :${get_order[index].status}',
                                                      style: TextStyle(
                                                          fontFamily: 'Nunito',
                                                          color: HexColor(
                                                                  '#B67A4F')
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 15),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '-\$${get_order[index].lineItems[index1].price}',
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito',
                                                      color:
                                                          Colors.red.shade700,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                // Text(
                                                //   '${status[index]}',
                                                //   style: TextStyle(
                                                //       color: Colors.green.shade700),
                                                // )
                                              ],
                                            )
                                          ]),
                                    ),
                                  );
                                });
                          })
                    ],
                  ),
                ),
              ),
            ),
    ));
  }
}
