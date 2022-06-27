import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class Edit_address extends StatefulWidget {
  const Edit_address({Key? key}) : super(key: key);

  @override
  State<Edit_address> createState() => _Edit_addressState();
}

class _Edit_addressState extends State<Edit_address> {
  bool isSwitched = false;
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
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
              color: Colors.black,
            ),
            onPressed: () {}),
        title: Text(
          'Edit Address',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Center(
                          child: Container(
                            height: 100,
                            width: 272,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 10),
                                  child: Text(
                                      'Do you want to delete this address ?',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 0.2,
                                  height: 1,
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          style: ButtonStyle(),
                                          child: Text(
                                            'No',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          )),
                                      VerticalDivider(
                                          thickness: 0.2,
                                          width: 1,
                                          color: Colors.black),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Yes',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              icon: LineIcon(
                LineIcons.trash,
                color: Colors.red,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
            child: Text('Full Name',
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Container(
              //  height: 50,
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.grey.shade200),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Full name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Text('Telephone number',
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Container(
              //  height: 50,
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.grey.shade200),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Telephone number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Text('Address',
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Container(
              //  height: 50,
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.grey.shade200),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  'Set as default address',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Switch(
                  onChanged: toggleSwitch,
                  value: isSwitched,
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.blue.withOpacity(0.2),
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey.shade300,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 80),
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text('Add new address',
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 15)),
                  SizedBox(
                    width: 15,
                  ),
                  LineIcon(
                    LineIcons.plus,
                    color: Colors.blue,
                    size: 18,
                  )
                ],
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(5)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 75, top: 20),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Save',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                      top: 10, bottom: 10, left: 90, right: 90)),
                  backgroundColor:
                      MaterialStateProperty.all(HexColor('#00c0e5')),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
            ),
          ),
        ],
      ),
    ));
  }
}
