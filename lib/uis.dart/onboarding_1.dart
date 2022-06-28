import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';

import 'package:login_flow/uis.dart/home.dart';

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class boarding1 extends StatefulWidget {
  @override
  State createState() => new boarding1State();
}

class boarding1State extends State<boarding1> {
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  final List<Widget> _pages = <Widget>[
    Column(
      children: [
        SizedBox(
          height: 500,
          child: Image(
            image: AssetImage('lib/images/tick.png'),
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: 300,
          width: 400,
          decoration: BoxDecoration(
              color: HexColor('#B67A4F'),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28), topRight: Radius.circular(28))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Easy track Order',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'Nunito'),
              ),
              Text(
                'Lorem ipsum giving refrence origin \n as well as a random',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: 'Nunito'),
              ),
            ],
          ),
        ),
      ],
    ),
    Column(
      children: [
        SizedBox(
          height: 500,
          child: Image(
            image: AssetImage('lib/images/tick.png'),
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: 300,
          width: 400,
          decoration: BoxDecoration(
              color: HexColor('#B67A4F'),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28), topRight: Radius.circular(28))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Door to Door Delivery',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'Nunito'),
              ),
              Text(
                'Lorem ipsum giving refrence origin \n as well as a random',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: 'Nunito'),
              ),
            ],
          ),
        ),
      ],
    ),
    Column(
      children: [
        SizedBox(
          height: 500,
          child: Image(
            image: AssetImage('lib/images/tick.png'),
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: 300,
          width: 400,
          decoration: BoxDecoration(
              color: HexColor('#B67A4F'),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28), topRight: Radius.circular(28))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Welcome to Emart',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'Nunito'),
              ),
              Text(
                'Lorem ipsum giving refrence origin \n as well as a random',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: 'Nunito'),
              ),
              TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 5)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(28))))),
                  onPressed: () {
                    Get.to(Home());
                  },
                  child: Text(
                    'Get started',
                    style: TextStyle(
                        color: HexColor('#B67A4F'),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Nunito'),
                  )),
            ],
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: new Stack(
          children: <Widget>[
            new PageView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
            ),
            new Positioned(
              bottom: 10.0,
              left: 0.0,
              right: 0.0,
              child: new Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(20.0),
                child: new Center(
                  child: new DotsIndicator(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 5,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
