import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_flow/uis.dart/home.dart';

import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class phone_verification extends StatefulWidget {
  const phone_verification({Key? key}) : super(key: key);

  @override
  _phone_verificationState createState() => _phone_verificationState();
}

class _phone_verificationState extends State<phone_verification> {
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  // This is the entered code
  // It will be displayed in a Text widget
  String? _otp;

  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(3),
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
    onStop: () {
      print('onStop');
    },
    onEnded: () {
      print('onEnded');
    },
  );

  OtpTimerButtonController controller = OtpTimerButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {}),
        title: Text(
          'Phone Verification',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'OTP Verification',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
          ),
          Text(
            'An authentication code has been sent to',
            style: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
          ),
          Text(
            '(+880) 111 222 333',
            style: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 30,
          ),
          // Implement 4 input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpInput(_fieldOne, true),
              OtpInput(_fieldTwo, false),
              OtpInput(_fieldThree, false),
              OtpInput(_fieldFour, false)
            ],
          ),

          // Display the entered OTP code
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('I didin\'t recieve code :'),
            ],
          ),
          OtpTimerButton(
            controller: controller,
            height: 60,
            text: Text(
              'Resend OTP',
            ),
            duration: 10,
            radius: 30,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            buttonType: ButtonType.text_button, // or ButtonType.outlined_button
            loadingIndicator: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.red,
            ),
            loadingIndicatorColor: Colors.red,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Center(
                        child: Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Have not recieved Verification code',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Text('An authentication code has been sent to',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text('(+880) 111 222 3333',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  horizontal: 50)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.blue.withOpacity(0.1)),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28)))),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color: HexColor('#00c0e5')),
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  TextButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  horizontal: 50)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  HexColor('#00c0e5')),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28)))),
                                      onPressed: () {},
                                      child: Text(
                                        'Call',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(Home());

              setState(() {
                _otp = _fieldOne.text +
                    _fieldTwo.text +
                    _fieldThree.text +
                    _fieldFour.text;
              });
            },
            child: const Text('Verify now'),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28)))),
          ),
        ],
      ),
    );
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
