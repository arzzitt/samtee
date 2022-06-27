import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class Category_1 extends StatefulWidget {
  const Category_1({Key? key}) : super(key: key);

  @override
  State<Category_1> createState() => _Category_1State();
}

class _Category_1State extends State<Category_1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              TextButton(
                  onPressed: () {},
                  child: LineIcon(
                    LineIcons.home,
                    color: Colors.grey.shade500,
                    size: 35,
                  )),
              TextButton(
                  onPressed: () {},
                  child: LineIcon(
                    LineIcons.clipboardList,
                    color: Colors.grey.shade500,
                    size: 35,
                  )),
            ],
          ),
          TextButton(
              onPressed: () {},
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blue,
                child: LineIcon(
                  LineIcons.plus,
                  color: Colors.white,
                  size: 38,
                ),
              )),
          Row(
            children: [
              TextButton(
                  onPressed: () {},
                  child: LineIcon(
                    LineIcons.envelope,
                    color: Colors.grey.shade500,
                    size: 35,
                  )),
              TextButton(
                  onPressed: () {},
                  child: LineIcon(
                    LineIcons.user,
                    color: Colors.grey.shade500,
                    size: 35,
                  ))
            ],
          )
        ],
      )),
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
          'Women Bag',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search, color: Colors.black))
        ],
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text('Categories',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400)),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.expand_more,
                      color: Colors.black,
                    )
                  ],
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.swap_vert,
                      color: Colors.black,
                    ),
                    Text('Sort',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400)),
                  ],
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.filter_alt, color: Colors.black, size: 18),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Filter',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400)),
                  ],
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 128,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Women leather Bag'),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '\$ 69',
                            style: TextStyle(color: Colors.pink, fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.pink.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.heartAlt,
                                    size: 15,
                                    color: Colors.pink,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor:
                                      Colors.purple.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.eye,
                                    size: 18,
                                    color: Colors.purple,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.blue.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.shoppingCart,
                                    size: 18,
                                    color: Colors.blue,
                                  )),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 128,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Women leather Bag'),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '\$ 69',
                            style: TextStyle(color: Colors.pink, fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.pink.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.heartAlt,
                                    size: 15,
                                    color: Colors.pink,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor:
                                      Colors.purple.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.eye,
                                    size: 18,
                                    color: Colors.purple,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.blue.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.shoppingCart,
                                    size: 18,
                                    color: Colors.blue,
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 128,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Women leather Bag'),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '\$ 69',
                            style: TextStyle(color: Colors.pink, fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.pink.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.heartAlt,
                                    size: 15,
                                    color: Colors.pink,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor:
                                      Colors.purple.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.eye,
                                    size: 18,
                                    color: Colors.purple,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.blue.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.shoppingCart,
                                    size: 18,
                                    color: Colors.blue,
                                  )),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 128,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Women leather Bag'),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '\$ 69',
                            style: TextStyle(color: Colors.pink, fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.pink.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.heartAlt,
                                    size: 15,
                                    color: Colors.pink,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor:
                                      Colors.purple.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.eye,
                                    size: 18,
                                    color: Colors.purple,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.blue.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.shoppingCart,
                                    size: 18,
                                    color: Colors.blue,
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 128,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Women leather Bag'),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '\$ 69',
                            style: TextStyle(color: Colors.pink, fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.pink.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.heartAlt,
                                    size: 15,
                                    color: Colors.pink,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor:
                                      Colors.purple.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.eye,
                                    size: 18,
                                    color: Colors.purple,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.blue.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.shoppingCart,
                                    size: 18,
                                    color: Colors.blue,
                                  )),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 128,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Women leather Bag'),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '\$ 69',
                            style: TextStyle(color: Colors.pink, fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.pink.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.heartAlt,
                                    size: 15,
                                    color: Colors.pink,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor:
                                      Colors.purple.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.eye,
                                    size: 18,
                                    color: Colors.purple,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.blue.withOpacity(0.2),
                                  child: LineIcon(
                                    LineIcons.shoppingCart,
                                    size: 18,
                                    color: Colors.blue,
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
