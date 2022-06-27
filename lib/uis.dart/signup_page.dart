import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:login_flow/uis.dart/signin.dart';

import '../apis/Access.dart';
import 'succes_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: signup_page());
  }
}

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
          'Sign up',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 45,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: TextField(
              controller: firstname,
              decoration: InputDecoration(
                  hintText: 'first name',
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
                  'By creating an account you agree to \nour terms of service and privacy policy'),
            ],
          ),
          TextButton(
              onPressed: () {
                if (email.text.isNotEmpty && password.text.isNotEmpty) {
                  access()
                      .signup(firstname.text, lastname.text, email.text,
                          password.text, username.text)
                      .then(
                    (value) async {
                      if (value["success"]) {
                        Fluttertoast.showToast(
                            msg: "${"Logged in successfully"}",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green.shade400,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        setState(() {});
                        print("logged in successfully");
                      } else {
                        Fluttertoast.showToast(
                            msg: "${"Incorrect Email Or Password"}",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red.shade400,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        setState(() {});
                      }
                    },
                  );
                }

                //  Get.to(Signin());
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 70)),
                  backgroundColor:
                      MaterialStateProperty.all(HexColor('#00c0e5')),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28)))),
              child: Text(
                'Sign up',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have a account ?',
              ),
              TextButton(onPressed: () {}, child: Text('Sign in'))
            ],
          )
        ],
      ),
    ));
  }
}
