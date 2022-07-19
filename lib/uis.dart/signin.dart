import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_flow/uis.dart/home.dart';
import 'package:login_flow/uis.dart/signup_page.dart';

import '../apis/Access.dart';
import '../models/login_model.dart';
import '../storage.dart';
import 'Forgot_password.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool valuefirst = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;

  SharedPreferencesInit() async {
    await Storage.init();
  }

  @override
  void initState() {
    super.initState();
    SharedPreferencesInit();
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
          'Sign in',
          style: TextStyle(
              color: HexColor('#B67A4F'),
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito'),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: TextStyle(
                    color: HexColor('#B67A4F'),
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    fontFamily: 'Nunito'),
              ),
              Text(
                'Sign in to continue',
                style: TextStyle(
                    color: Colors.black, fontSize: 20, fontFamily: 'Nunito'),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                //  height: 50,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.grey.shade200),
                child: TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: HexColor('#B67A4F'),
                    ),
                    hintText: 'jhonson52',
                    hintStyle: TextStyle(fontFamily: 'Nunito'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                //  height: 50,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.grey.shade200),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: HexColor('#B67A4F'),
                      ),
                      hintText: '********',
                      hintStyle: TextStyle(fontFamily: 'Nunito'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none)),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () async {
                    if (userNameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      setState(() {
                        loading = true;
                      });
                      access()
                          .login(
                              userNameController.text, passwordController.text)
                          .then((value) async {
                        if (value["success"]) {
                          LoginUsernameResponse loginRes =
                              await LoginUsernameResponse.fromJson(value);
                          final token = loginRes.data.token;
                          final custid = loginRes.data.id;

                          Storage.set_token(token);
                          Storage.set_custid(custid.toString());
                          Storage.set_isLoggedIn(true);
                          Storage.set_custname(loginRes.data.firstName+" "+loginRes.data.lastName);

                         print("tokenId: ${Storage.get_token()}");
                          print("cust_id: ${Storage.get_custid()}");
                          print("logged in : ${Storage.get_isLoggedIn()}");


                          Fluttertoast.showToast(
                              msg: "Login successful",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green.shade400,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          setState(() {
                            loading = false;
                            Get.offAll(()=>Home());
                          });
                        } else {
                          print("invalid credentials");
                          print("failed msg: ${value["message"]}");
                          Fluttertoast.showToast(
                              msg: "Invalid credentials",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red.shade400,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          setState(() {
                            loading = false;
                          });
                        }
                      });
                    } else {
                      Fluttertoast.showToast(
                          msg: "${"Fields cannot be empty"}",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: loading
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.02,
                          width: MediaQuery.of(context).size.height * 0.02,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                      : Text(
                          'Sign in',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Nunito'),
                        ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          top: 10, bottom: 10, left: 90, right: 90)),
                      backgroundColor:
                          MaterialStateProperty.all(HexColor('#B67A4F')),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: HexColor('#00c0e5'),
                    value: this.valuefirst,
                    onChanged: (bool? value) {
                      setState(() {
                        this.valuefirst = value!;
                      });
                    },
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(
                        fontFamily: 'Nunito', fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(forgot_password());
                      },
                      child: Text('Forgot password ?',
                          style: TextStyle(
                              color: HexColor('#B67A4F'),
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold)))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account ?',
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(signup_page());
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: HexColor('#B67A4F')),
                      ))
                ],
              )
            ]),
      ),
    ));
  }
}
