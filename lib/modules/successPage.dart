import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summar_me/extras/constants.dart';
import 'package:summar_me/modules/tabScreens/components/homeController.dart';
import 'package:summar_me/modules/tabScreens/view/home.dart';

class SuccessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SuccessPageState();
  }
}

class _SuccessPageState extends State<SuccessPage> {
  final HomeController _controller = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Image.asset(
          brandNameLogo,
          fit: BoxFit.scaleDown,
          width: 160,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: grey),
      ),
      // backgroundColor: background,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline_sharp,
                        size: 80,
                        color: green,
                      ),
                      Text(
                        "Successfully Saved!",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: green, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: Get.width * 3 / 4,
                height: 56.0,
                decoration: new BoxDecoration(
                  color: green,
                  border: new Border.all(color: green, width: 2.0),
                  borderRadius: new BorderRadius.circular(48.0),
                ),
                child: InkWell(
                  onTap: () {
                    _controller.selectedIndex.value = 0;
                    Get.offAll(() => Home());
                  },
                  child: new Container(
                    width: Get.width * 0.4,
                    child: new Center(
                      child: new Text(
                        "Upload more documents",
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
