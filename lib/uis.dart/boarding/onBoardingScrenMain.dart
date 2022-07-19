import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_flow/uis.dart/boarding/onboarding1.dart';
import 'package:login_flow/uis.dart/boarding/onboarding2.dart';
import 'package:login_flow/uis.dart/boarding/onboarding3.dart';
import 'package:login_flow/uis.dart/secondscreen.dart';

import '../../storage.dart';



class OnBoardingScreenMain extends StatefulWidget {
  const OnBoardingScreenMain({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreenMain> createState() => _OnBoardingScreenMainState();
}

class _OnBoardingScreenMainState extends State<OnBoardingScreenMain> {
  int _currentIndex = 0;
  PageController? _pageController;
  bool isloggedin = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  List<Widget> pages = [Page1(), Page2(), Page3()];
  onChanged(int index) {
    setState(() {
      _currentIndex = index;
      print("Current index:${_currentIndex}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: pages.length,
              onPageChanged: onChanged,
              itemBuilder: (BuildContext context, int index) {
                return pages[index];
              },
            ),
          ),
          Positioned(
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(pages.length, (index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 10,
                          width: (index == _currentIndex) ? 30 : 10,
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ((index == _currentIndex)
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.3))),
                        );
                      })),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        fixedSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width - 40, 45)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () async{

                      if (_currentIndex < 2) {
                        _pageController!.animateToPage(_currentIndex + 1,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn);
                      } else {
                        await Storage.init();
                        await Storage.set_isFirst(false);
                         Get.to(secondscreen());
                      }
                    },
                    child: Text(
                      _currentIndex < 2 ? 'Next' : 'Get Started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: HexColor('#B67A4F'),
                        letterSpacing: 2.0,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
