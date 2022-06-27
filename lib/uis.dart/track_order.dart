import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class trackOrder59 extends StatefulWidget {
  const trackOrder59({Key? key}) : super(key: key);
  @override
  State<trackOrder59> createState() => _trackOrder59State();
}

class _trackOrder59State extends State<trackOrder59> {
  int current_step = 0;
  List<Step> steps = const [
    Step(
      title: Text('Step 1'),
      content: Text('Hello!'),
      isActive: true,
    ),
    Step(
      title: Text('Step 2'),
      content: Text('World!'),
      isActive: true,
    ),
    Step(
      title: Text('Step 3'),
      content: Text('Hello World!'),
      state: StepState.complete,
      isActive: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9FF),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("Women Bag"),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.book))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffF9FAFB)),
                      child: Column(
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Your order code:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' #800715',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xff01C1E5))),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: "3 items-",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: "\$270.79",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xffFE2121))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color(0xff01C1E5), width: 2)),
                              // child: Icon(Icons.check, color:  Color(0xff01C1E5),),
                            ),
                            Container(
                                height: 60,
                                child: const VerticalDivider(
                                  color: Color(0xff01C1E5),
                                  thickness: 2,
                                )),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color(0xff01C1E5), width: 2)),
                              // child: Icon(Icons.check, color:  Color(0xff01C1E5),),
                            ),
                            Container(
                                height: 60,
                                child: const VerticalDivider(
                                  color: Color(0xff01C1E5),
                                  thickness: 2,
                                )),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff01C1E5),
                                  border: Border.all(
                                      color: Color(0xff01C1E5), width: 2)),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                                height: 60,
                                child: VerticalDivider(
                                  color: Color(0xff01C1E5),
                                  thickness: 2,
                                )),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff01C1E5),
                                  border: Border.all(
                                      color: Color(0xff01C1E5), width: 2)),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                                height: 60,
                                child: const VerticalDivider(
                                  color: Color(0xff01C1E5),
                                  thickness: 2,
                                )),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff01C1E5),
                                  border: Border.all(
                                      color: Color(0xff01C1E5), width: 2)),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Delivered",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "Estimated for 7 July, 2021",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 53,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Out for delivery",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "Estimated for 5 July, 2021",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 53,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Order shipped",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "Estimated for 02 July, 2021",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 53,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Confirmed",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "Your order has been confirmed",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 53,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Order placed",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "We have received your order",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.055,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Back to Home",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xff01C1E5),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
