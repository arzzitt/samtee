import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:login_flow/uis.dart/signin.dart';

import '../apis/Access.dart';
import 'succes_screen.dart';

class signup_page extends StatefulWidget {
  const signup_page({Key? key}) : super(key: key);

  @override
  State<signup_page> createState() => _signup_pageState();
}

class _signup_pageState extends State<signup_page> {
  bool valuefirst = false;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isapicallprocess = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  bool _obsecure = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Sign up',
          style: TextStyle(
              color: HexColor('#B67A4F'), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CircleAvatar(
              radius: 45,
              child: Icon(Icons.person),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: TextField(
                controller: firstname,
                decoration: InputDecoration(
                    hintText: 'first name',
                    hintStyle: TextStyle(fontFamily: 'Nunito'),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: TextField(
                controller: lastname,
                decoration: InputDecoration(
                    hintText: 'last name',
                    filled: true,
                    hintStyle: TextStyle(fontFamily: 'Nunito'),
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                    hintText: 'username',
                    hintStyle: TextStyle(fontFamily: 'Nunito'),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(fontFamily: 'Nunito'),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: TextField(
                controller: password,
                obscureText: _obsecure,
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(fontFamily: 'Nunito'),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obsecure = !_obsecure;
                        });
                      },
                      child: new Icon(
                          _obsecure ? Icons.visibility : Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this.valuefirst,
                  onChanged: (bool? value) {
                    setState(() {
                      this.valuefirst = value!;
                    });
                  },
                ),
                Text(
                    'By creating an account you agree to \nour terms of service and privacy policy',
                    style: TextStyle(
                        fontFamily: 'Nunito', color: HexColor('#B67A4F'))),
              ],
            ),
            TextButton(
                onPressed: () async {
                  if (email.text.isNotEmpty && password.text.isNotEmpty) {
                    setState(() {
                      loading = true;
                    });
                    access()
                        .signup(firstname.text, lastname.text, email.text,
                            password.text, username.text)
                        .then(
                      (value) async {
                        if (value["success"] == false) {
                          Fluttertoast.showToast(
                              msg: "${"Incorrect Email"}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red.shade400,
                              textColor: Colors.white,
                              fontSize: 16.0);

                          setState(() {
                            loading = false;
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "${"Signed up successfully"}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green.shade400,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          print("logged in successfully");

                          setState(() {
                            loading = false;
                            Get.to(Signin());
                          });
                        }
                      },
                    );
                  } else {
                    Fluttertoast.showToast(
                        msg: "${"Field cannot be empty"}",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red.shade400,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 70)),
                    backgroundColor:
                        MaterialStateProperty.all(HexColor('#B67A4F')),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28)))),
                child: loading
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.02,
                        width: MediaQuery.of(context).size.height * 0.02,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito'),
                      )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have a account ?',
                  style: TextStyle(
                      color: HexColor('#B67A4F'),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Nunito'),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: HexColor('#B67A4F'),
                          fontFamily: 'Nunito'),
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
