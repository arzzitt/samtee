import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:login_flow/models/CustomerEach.dart';

import '../apis/Access.dart';
import '../models/Order.dart';
import '../models/cartmodel.dart';
import '../storage.dart';
import 'address/add_address.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Orders> get_order = [];
  bool loading = true;

  CartModel? cartadd;
  CustomerEach? customerEach;

  SharedPreferencesInit() async {
    await Storage.init();
  }

  @override
  void initState() {
    super.initState();

    SharedPreferencesInit();
    getData();


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
          : Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    child: Text('${customerEach!.firstName!}  ' + '${customerEach!.lastName}',
                        style: TextStyle(
                          color: HexColor('#B67A4F'),
                            fontWeight: FontWeight.bold,
                          fontSize: 22,
                            fontFamily: 'Nunito')),
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
                  customerEach!.shipping!.firstName!.isEmpty?GestureDetector(
                    onTap: (){
                      Get.to(Add_address());
                    },
                    child: Text(
                      "+ Add address",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600),
                    ),
                  ):
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
                              ' ${customerEach!.shipping!.firstName}   ' +
                                  '${customerEach!.shipping!.lastName}',
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
                        '${customerEach!.shipping!.address1},' +
                            '${customerEach!.shipping!.address2},' ,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      Text(
                        '${customerEach!.shipping!.city},' +
                            '${customerEach!.shipping!.state},' +
                            '${customerEach!.shipping!.postcode},' +
                            '${customerEach!.shipping!.country}',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                        ),
                      ),

                      Text(
                        '${customerEach!.shipping!.phone}',
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
                  get_order.length==0?Container():Text('My Orders',
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
    ));
  }

  Future<void> getData() async{

   await access().get_order().then((value) {
      setState(() {
        for (Map<String, dynamic> i in value.data) {
          get_order.add(Orders.fromJson(i));
        }

      });
    });

    await access().customer().then((value) {
      setState(() {
        customerEach = CustomerEach.fromJson(value);

      });
    });
    loading=false;
  }
}
