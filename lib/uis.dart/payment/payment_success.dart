import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Payment_success extends StatelessWidget {
  const Payment_success({Key? key}) : super(key: key);

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
          'Payment Method',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('lib/images/tick.png')),
            Text(
              'Payment Success',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Tip id #3553',
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '   Thank you for choosing \n     our service and trust \nto help you with your problems',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28)))),
                child: Text(
                  'Find courrier',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ))
          ],
        ),
      ),
    ));
  }
}
