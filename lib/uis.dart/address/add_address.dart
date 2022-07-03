import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_flow/apis/Access.dart';
import 'package:login_flow/storage.dart';
import 'package:login_flow/uis.dart/address_page.dart';

class Add_address extends StatefulWidget {
  const Add_address({Key? key}) : super(key: key);

  @override
  State<Add_address> createState() => _Add_addressState();
}

class _Add_addressState extends State<Add_address> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController postcode = TextEditingController();
  TextEditingController phone_number = TextEditingController();
  bool loading1 = false;
  final custid = Storage.get_custid();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomAppBar(child:  Padding(
        padding: const EdgeInsets.only(bottom: 8,right: 20,left: 20),
        child: TextButton(
          onPressed: () async {
            setState(() {
              loading1 = true;
              print('Id: $custid');
            });

            access()
                .shippin_add(
                custid,
                firstname.text,
                lastname.text,
                address1.text,
                address2.text,
                country.text,
                city.text,
                state.text,
                int.parse(postcode.text),
                int.parse(phone_number.text))
                .then((value) {
              if (value["success"] == false) {
                Fluttertoast.showToast(
                    msg: "${"Failed"}",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red.shade400,
                    textColor: Colors.white,
                    fontSize: 16.0);

                setState(() {
                  loading1 = false;
                });
              } else {
                Fluttertoast.showToast(
                    msg: "${"Address added successfully"}",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green.shade400,
                    textColor: Colors.white,
                    fontSize: 16.0);

                setState(() {
                  loading1 = false;
                  Get.to(Address_page());
                });
              }
            });
          },
          child: loading1
              ? Container(
            height: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.height * 0.02,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
              : Text(
            'Finished',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Nunito'),
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.only(top: 12, bottom: 12, left: 90, right: 90)),
              backgroundColor: MaterialStateProperty.all(HexColor('#B67A4F')),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
        ),
      )),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {}),
        title: Text(
          'Add Address',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                field('First name', firstname),
                field('Last name',lastname),
                field('Address 1',address1),
                field('Address 2',address2),
                field('Phone no.', phone_number),
                field('Country',country),
                field('State', state),
                field('City',city),
                field('Postcode',postcode),


              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget field(String text, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.grey, fontSize: 18,fontFamily: 'Nunito',fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 8),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.only( left: 30,bottom: 10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                    width: 0.4, color: Colors.black.withOpacity(0.2))),
          )
        ],
      ),
    );
  }
}
