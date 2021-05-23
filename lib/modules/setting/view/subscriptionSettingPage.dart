import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:summar_me/extras/constants.dart';
import 'package:summar_me/modules/setting/controller/settingPagesController.dart';

class SubscriptionSettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubscriptionSettingPageState();
  }
}

class _SubscriptionSettingPageState extends State<SubscriptionSettingPage> {
  final SettingPagesController _controller = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: background,
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
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: yellow,
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    "Document label/tags",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: textGrey, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: spacing,
              ),
              _controller.options.isNotEmpty
                  ? _setUpDocumentsWidget()
                  : Container(),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              Center(
                child: Text(
                  "Payment Method",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: black, fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                Icons.credit_card,
                size: 200,
                color: black,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: spacing * 2, right: spacing * 2, bottom: 16),
                padding: EdgeInsets.all(8),
                decoration: new BoxDecoration(
                  color: green,
                  border: new Border.all(color: green, width: 2.0),
                  borderRadius: new BorderRadius.circular(6.0),
                ),
                child: Center(
                  child: Text(
                    "Activate",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: white, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _setUpDocumentsWidget() {
    return new Obx(
      () => Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: _controller.options.length,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0.0),
                  child: new Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: borderBg,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${_controller.options[index].label}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                            color: textGrey,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${_controller.options[index].subLabel}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .copyWith(
                                            color: textGrey,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              _controller.options[index].switchMode == "1"
                                  ? FlutterSwitch(
                                      width: 50.0,
                                      height: 25.0,
                                      valueFontSize: 0.0,
                                      toggleSize: 15.0,
                                      activeColor: red,
                                      value: _controller
                                          .options[index].switchValue,
                                      borderRadius: 30.0,
                                      showOnOff: true,
                                      onToggle: (val) {
                                        print(val);
                                        setState(() {
                                          _controller
                                                  .options[index].switchValue =
                                              !_controller
                                                  .options[index].switchValue;
                                        });
                                      },
                                    )
                                  : Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      size: 30,
                                      color: black,
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
