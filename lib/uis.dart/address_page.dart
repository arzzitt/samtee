import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class Address_page extends StatefulWidget {
  const Address_page({Key? key}) : super(key: key);

  @override
  State<Address_page> createState() => _Address_pageState();
}

class _Address_pageState extends State<Address_page> {
  final List<String> name = ['Abc', 'efg', 'XYZ'];
  final List<String> address = ['Moti vihar', 'Vijay nagar', 'Ranjhi'];
  final List<int> number = [8617285913, 8617285913, 8617285913];

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
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 2,
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          LineIcon(LineIcons.plus),
                          Text(
                            'Add a new address',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15),
                  child: Text(
                    'SAVED ADDRESS',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8),
                      itemCount: name.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.only(top: 8, left: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Material(
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${name[index]}',
                                          style: TextStyle(fontSize: 22),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          '${address[index]}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(height: 10),
                                        Text('${number[index]}',
                                            style: TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            )));
  }
}
