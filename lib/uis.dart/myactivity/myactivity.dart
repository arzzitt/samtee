import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class Myactivity extends StatelessWidget {
  const Myactivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {}),
          title: Text(
            'My Activity',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected))
                  return Colors.amberAccent; //<-- SEE HERE
                return null;
              },
            ),
            tabs: <Widget>[
              Tab(
                text: 'Active',
              ),
              Tab(
                text: 'Completed',
              ),
              Tab(text: 'Cancelled')
            ],
            indicator: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28))),
                color: Colors.blue),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 23,
                            child: LineIcon(
                              LineIcons.truck,
                              color: Colors.white,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#270012',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('9 July',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('5 Items',
                                    style: TextStyle(color: Colors.grey))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          height: 28,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Shipped',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 0)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.amber),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28))),
                              )),
                        )
                      ]),
                  Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 23,
                            child: LineIcon(
                              LineIcons.truck,
                              color: Colors.white,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#270012',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('9 July',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('5 Items',
                                    style: TextStyle(color: Colors.grey))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          height: 28,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Shipped',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 0)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.amber),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28))),
                              )),
                        )
                      ]),
                  Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 23,
                            child: LineIcon(
                              LineIcons.truck,
                              color: Colors.white,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#270012',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('9 July',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('5 Items',
                                    style: TextStyle(color: Colors.grey))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          height: 28,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Shipped',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 0)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.amber),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28))),
                              )),
                        )
                      ]),
                  Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 23,
                            child: LineIcon(
                              LineIcons.truck,
                              color: Colors.white,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#270012',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('9 July',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('5 Items',
                                    style: TextStyle(color: Colors.grey))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          height: 28,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Shipped',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 0)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.amber),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28))),
                              )),
                        )
                      ]),
                  Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 23,
                            child: LineIcon(
                              LineIcons.truck,
                              color: Colors.white,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#270012',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('9 July',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('5 Items',
                                    style: TextStyle(color: Colors.grey))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          height: 28,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Shipped',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 0)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.amber),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28))),
                              )),
                        )
                      ]),
                  Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 23,
                            child: LineIcon(
                              LineIcons.truck,
                              color: Colors.white,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#270012',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('9 July',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('5 Items',
                                    style: TextStyle(color: Colors.grey))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          height: 28,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Shipped',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 0)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.amber),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28))),
                              )),
                        )
                      ]),
                  Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 23,
                            child: LineIcon(
                              LineIcons.truck,
                              color: Colors.white,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#270012',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('9 July',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('5 Items',
                                    style: TextStyle(color: Colors.grey))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          height: 28,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Shipped',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 0)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.amber),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28))),
                              )),
                        )
                      ]),
                  Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 23,
                            child: LineIcon(
                              LineIcons.truck,
                              color: Colors.white,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#270012',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('9 July',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('5 Items',
                                    style: TextStyle(color: Colors.grey))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          height: 28,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Shipped',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 0)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.amber),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28))),
                              )),
                        )
                      ]),
                  Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            backgroundColor: HexColor('#1cbe73'),
                            radius: 23,
                            child: LineIcon(
                              LineIcons.check,
                              color: Colors.white,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#270012',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('9 July',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('5 Items',
                                    style: TextStyle(color: Colors.grey))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          height: 28,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Delivered',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 0)),
                                backgroundColor: MaterialStateProperty.all(
                                    HexColor('#1cbe73')),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28))),
                              )),
                        )
                      ]),
                  Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.red.shade700,
                          radius: 23,
                          child: LineIcon(
                            LineIcons.times,
                            color: Colors.white,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('#270012',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text('9 July',
                                  style: TextStyle(color: Colors.grey)),
                              SizedBox(
                                width: 8,
                              ),
                              Text('5 Items',
                                  style: TextStyle(color: Colors.grey))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        height: 28,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0)),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.red.shade700),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28))),
                            )),
                      )
                    ]),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
