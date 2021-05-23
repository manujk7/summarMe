import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summar_me/extras/constants.dart';
import 'package:summar_me/modules/documentAddPage/view/documentAddPage.dart';
import 'package:summar_me/modules/tabScreens/components/homeController.dart';
import 'package:summar_me/modules/tabScreens/view/components/documentsPage.dart';
import 'package:summar_me/modules/tabScreens/view/components/offerPage.dart';
import 'package:summar_me/modules/tabScreens/view/components/settingsPage.dart';
import 'package:summar_me/services/prefrences.dart';

import 'components/HomePage.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final HomeController _controller = Get.find();

  String pageTitle = brandName;
  String deviceId = "123";
  String deviceType = "";
  final _prefs = SharedPrefs();

  List<Widget> bottomNavList = [
    HomePage(),
    DocumentsPage(),
    DocumentAddPage(),
    OfferPage(),
    SettingPage(),
  ];

  @override
  void initState() {
    super.initState();
    // getProfile();
  }

  // Future<void> getProfile() async {
  //   if (Platform.isIOS) iosPermission();
  //   _firebaseMessaging.getToken().then((token) async {
  //     print("TTTTOOOKKEEENNNZZZZZZZZZZZZ : " + token);
  //     deviceId = token;
  //     if (Platform.isIOS) {
  //       deviceType = "2";
  //     } else {
  //       deviceType = "1";
  //     }
  //     _controller.userModel.value =
  //         await _controller.getProfileApi(deviceType, deviceId);
  //     if (_controller.userModel().status == "true") {
  //       _prefs.saveProfile(jsonEncode(_controller.userModel().profile));
  //     }
  //   });
  //
  //   _controller.getProfileData();
  // }

  /*
  * On Bottom Navigation item click Listener
  * */
  void _onItemTapped(int index) {
    setState(() {
      getPageTitle(index);
      if (index == 1) {
      } else if (index == 2) {
        Constants.openScanner = true;
      } else if (index == 3) {
      } else {}
      _controller.selectedIndex.value = index;
    });
  }

  void getPageTitle(int index) {
    if (index == 0) {
      pageTitle = brandName;
    } else if (index == 1) {
      pageTitle = brandName;
    } else if (index == 2) {
      pageTitle = brandName;
    } else if (index == 3) {
      pageTitle = brandName;
    }
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
        child: Column(
          children: [
            Obx(
              () => Expanded(
                  child: bottomNavList[_controller.selectedIndex.value]),
            ),
          ],
        ),
      ),
      /*
          * Bottom Navigation bar of Dashboard
          * */
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: yellow,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24), topLeft: Radius.circular(24)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Container(
                    height: 40,
                    width: 40,
                    child: Image(
                      image: AssetImage('assets/icons/dashboard.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: new Container(
                    height: 40,
                    width: 40,
                    child: Image(
                      image: AssetImage('assets/icons/docs.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: new Container(
                      height: 45,
                      width: 45,
                      child: Image(
                        image: AssetImage('assets/icons/scan.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 40,
                    width: 40,
                    child: Image(
                      image: AssetImage('assets/icons/offers.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 40,
                    width: 40,
                    child: Image(
                      image: AssetImage('assets/icons/setting.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  label: '',
                ),
              ],
              currentIndex: _controller.selectedIndex.value,
              selectedFontSize: 1,
              unselectedFontSize: 1,
              type: BottomNavigationBarType.fixed,
              // unselectedIconTheme: ColorNames.colorLightGrey,
              selectedItemColor: black,
              unselectedItemColor: black,
              onTap: _onItemTapped,
              backgroundColor: yellow,
            ),
          ),
        ),
      ),
    );
  }
}
