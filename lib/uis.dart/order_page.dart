import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../apis/Access.dart';
import '../models/Order.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<Orders> get_order = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();

    access().get_order().then((value) {
      setState(() {
        for (Map<String, dynamic> i in value.data) {
          get_order.add(Orders.fromJson(i));
        }
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
                'My Orders',
                style: TextStyle(
                    color: HexColor('#B67A4F'),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito'),
              ),
              centerTitle: true,
              elevation: 2,
            ),
            body: loading ? Center(child: CircularProgressIndicator(color:  HexColor('#B67A4F'))) : SingleChildScrollView(
      child: Container(
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: get_order.length,
              itemBuilder: (BuildContext context, int index) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    itemCount: get_order[index].lineItems.length,
                    itemBuilder: (BuildContext context, int index1) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
                        child: Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.green.shade100,
                                        child: CircleAvatar(
                                            radius: 10,
                                            child: LineIcon(
                                              LineIcons.dollarSign,
                                              size: 15,
                                            ),
                                            backgroundColor: Colors.green)),
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
                                              color: HexColor('#B67A4F'),
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito',
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Status :${get_order[index].status}',
                                          style: TextStyle(
                                              fontFamily: 'Nunito',
                                              color: HexColor('#B67A4F')
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '-\$${get_order[index].lineItems[index1].price}',
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          color: Colors.red.shade700,
                                          fontWeight: FontWeight.bold,
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
              })),
    )));
  }
}
