import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summar_me/extras/constants.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingPageState();
  }
}

class _SettingPageState extends State<SettingPage> {
  List<String> _options = [
    'Profile/Account Settings',
    'Subscription Setting',
    'Label/Tag Editor',
    'Document Category Editor'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: background,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: spacing,
              ),
              _setUpDocumentsWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _setUpDocumentsWidget() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: _options.length,
          primary: false,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {

                if (index == 0) {
                  Get.toNamed('/profilePage');
                  return;
                }
                if (index == 1) {
                  Get.toNamed('/subscriptionSettingPage');
                  return;
                }
                if (index == 2) {
                  Get.toNamed('/labelPage');
                  return;
                }
                // if (index == 3) {
                //   Get.toNamed('/documentAddPage');
                //   return;
                // }
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                child: new Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: borderBg,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${_options[index]}",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      color: textGrey,
                                      fontWeight: FontWeight.bold),
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
    );
  }
}
