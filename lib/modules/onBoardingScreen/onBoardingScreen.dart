import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summar_me/extras/constants.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List<String> images = [
    "assets/images/welcomeScreen1.png",
    "assets/images/welcomeScreen2.png",
  ];
  int slideIndex = 0;
  final IndexController controller = IndexController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TransformerPageView transformerPageView = TransformerPageView(
        onPageChanged: (value) {
          print("Value:$value");
          setState(() {
            slideIndex = value;
          });
        },
        loop: false,
        controller: controller,
        index: slideIndex,
        pageSnapping: false,
        transformer: new PageTransformerBuilder(
            builder: (Widget child, TransformInfo info) {
          return new Material(
            color: white,
            textStyle: new TextStyle(color: white),
            borderRadius: new BorderRadius.circular(12.0),
            child: Stack(
              children: [
                new Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(images[slideIndex]),
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 100,
                  child: Row(
                    children: [
                      DotsIndicator(
                        dotsCount: images.length,
                        position: slideIndex,
                        decorator: DotsDecorator(
                          size: Size.square(8.0),
                          activeSize: Size.square(8.0),
                          color: white,
                          activeColor: red,
                          spacing: EdgeInsets.symmetric(horizontal: 8),
                        ),
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (slideIndex < images.length - 1) {
                            print("slide index: " + slideIndex.toString());
                            setState(() {
                              slideIndex = slideIndex + 1;
                            });
                          } else {
                            await storeString("no", "isLoogedIn");
                            Get.toNamed('/login');
                          }
                        },
                        child: Image(
                          width: 50,
                          height: 50,
                          image: AssetImage('assets/icons/nextScreen.png'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
        itemCount: images.length);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: new Stack(
            children: <Widget>[
              transformerPageView,
              new Positioned(
                top: 0,
                right: 10,
                child: new Chip(
                  backgroundColor: green,
                  label: (this.slideIndex == 1)
                      ? new GestureDetector(
                          onTap: () async {
                            await storeString("no", "isLoogedIn");
                            Get.toNamed('/home');
                          },
                          child: new Text(
                            'Home',
                            style: new TextStyle(color: white),
                          ),
                        )
                      : new GestureDetector(
                          onTap: () async {
                            await storeString("no", "isLoogedIn");
                            Get.toNamed('/home');
                          },
                          child: new Text(
                            'Skip',
                            style: new TextStyle(color: white),
                          ),
                        ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Image.asset(
                      brandNameLogo,
                      fit: BoxFit.scaleDown,
                      width: 160,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
