import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

enum cards { visa, razor_pay, upi }

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  cards _value = cards.visa;

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
            onPressed: () {
              Get.back();
            }),
        title: Text(
          'Payment Method',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    height: 200,
                    child: Image(
                      image: AssetImage('lib/images/visa.png'),
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Image(
                    image: AssetImage('lib/images/master.png'),
                    height: 200,
                  )
                ],
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(
              'Visa *******250',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'change',
                  style: TextStyle(color: Colors.pink),
                ))
          ]),
          ListTile(
            title: const Text('Credit/debit card'),
            leading: Radio(
              value: cards.visa,
              groupValue: _value,
              onChanged: (cards? value) {
                setState(() {
                  _value = value!;
                });
              },
            ),
            trailing: IconButton(
                onPressed: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: 200,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28)),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LineIcon(
                              LineIcons.dinerSClubCreditCard,
                              color: Colors.blue,
                            ),
                            Text('Jennefir jhonson',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18)),
                            Text('xxxxxxxx075',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18))
                          ],
                        ),
                        Divider(
                          thickness: 0.2,
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LineIcon(
                              LineIcons.visaCreditCard,
                              color: Colors.blue,
                            ),
                            Text('Jennefir jhonson',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18)),
                            Text('xxxxxxxx075',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18))
                          ],
                        ),
                        Divider(
                          thickness: 0.2,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ListTile(
                            leading: LineIcon(
                              LineIcons.creditCard,
                              color: Colors.blue,
                              size: 20,
                            ),
                            title: Text(
                              'Add a new card',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: TextButton(
                              child: LineIcon(
                                LineIcons.plus,
                                color: Colors.blue,
                              ),
                              onPressed: () {},
                            ),
                            horizontalTitleGap: 0,
                          ),
                        )
                      ]),
                    ),
                  );
                },
                icon: LineIcon(
                  LineIcons.angleRight,
                  color: Colors.grey,
                )),
          ),
          ListTile(
            title: const Text('Razor pay'),
            leading: Radio(
              value: cards.razor_pay,
              groupValue: _value,
              onChanged: (cards? value) {
                setState(() {
                  _value = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('UPI'),
            leading: Radio(
              value: cards.upi,
              groupValue: _value,
              onChanged: (cards? value) {
                setState(() {
                  _value = value!;
                });
              },
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(HexColor('#00c0e5')),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)))),
              onPressed: () {},
              child: Text(
                'Proceed to checkout',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ))
        ],
      ),
    ));
  }
}
