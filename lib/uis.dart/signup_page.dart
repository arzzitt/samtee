import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_flow/succes_screen.dart';

class signup_page extends StatefulWidget {
  const signup_page({Key? key}) : super(key: key);

  @override
  State<signup_page> createState() => _signup_pageState();
}

class _signup_pageState extends State<signup_page> {
  bool valuefirst = false;

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
              decoration: InputDecoration(
                  hintText: 'Full name',
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
              decoration: InputDecoration(
                  hintText: 'Phone number',
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
              decoration: InputDecoration(
                  hintText: 'Password',
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
              decoration: InputDecoration(
                  hintText: 'Confirm password',
                  filled: true,
                  fillColor: Colors.grey.shade200,
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
                Get.to(success_acc_created());
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
