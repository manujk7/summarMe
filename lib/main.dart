import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summar_me/modules/detailSubCategoryList/view/detailSubCategoryScreen.dart';
import 'package:summar_me/modules/documentAddPage/view/documentAddPage.dart';
import 'package:summar_me/modules/documentDetail/view/documentDetailScreen.dart';
import 'package:summar_me/modules/onBoardingScreen/onBoardingScreen.dart';
import 'package:summar_me/modules/setting/controller/settingPagesController.dart';
import 'package:summar_me/modules/setting/view/labelSettingPage.dart';
import 'package:summar_me/modules/setting/view/profileSettingPage.dart';
import 'package:summar_me/modules/setting/view/subscriptionSettingPage.dart';
import 'package:summar_me/modules/subCategories/view/subCategories.dart';
import 'package:summar_me/modules/successPage.dart';
import 'package:summar_me/modules/tabScreens/components/homeController.dart';
import 'package:summar_me/services/prefrences.dart';

import 'modules/login/controller/loginController.dart';
import 'modules/login/view/loginPage.dart';
import 'modules/signUp/controller/signUpController.dart';
import 'modules/signUp/view/signUpPage.dart';
import 'modules/tabScreens/view/home.dart';

SharedPrefs appAuth = new SharedPrefs();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final _controller = Get.put(LoginController());
  final _controllerSignUp = Get.put(SignUpController());
  final _controllerHome = Get.put(HomeController());
  final _controllerSettingPages = Get.put(SettingPagesController());
  // Widget _defaultHome = new LoginPage();
  Widget _defaultHome = new OnBoarding();
  bool _result = await appAuth.login();
  // if (_result) {
  //   _defaultHome = new Home();
  // }
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool _seen = (prefs.getBool('seen') ?? false);

  // if (_seen) {
  //   _defaultHome = new LoginPage();
  // } else {
  //   await prefs.setBool('seen', true);
  //   _defaultHome = new OnBoarding();
  // }
  runApp(
    GetMaterialApp(
      title: 'BRent',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      //when initial Route is given no need to add home widget for initial start point of app
      //full app route structure
      routes: {
        '/': (context) => _defaultHome,
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => Home(),
        '/subCategories': (context) => SubCategories(),
        '/subCategoryDetail': (context) => SubCategoryDetail(),
        '/documentDetailScreen': (context) => DocumentDetailPage(),
        '/labelPage': (context) => LabelPage(),
        '/subscriptionSettingPage': (context) => SubscriptionSettingPage(),
        '/documentAddPage': (context) => DocumentAddPage(),
        '/profilePage': (context) => ProfilePage(),
        '/successPage': (context) => SuccessPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Jura',
        dividerTheme: DividerThemeData(
            color: Colors.grey //  <--- change the divider's color
            ),
      ),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   final _controller = Get.put(LoginController());
//   final _controllerSignUp = Get.put(SignUpController());
//   final _controllerHome = Get.put(HomeController());
//   final _controllerProfile = Get.put(ProfileController());
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'BRent',
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       //when initial Route is given no need to add home widget for initial start point of app
//       //full app route structure
//       routes: {
//         '/': (context) => FirstPage(),
//         '/login': (context) => LoginPage(),
//         '/modules.login.signUp': (context) => SignUpPage(),
//         '/home': (context) => Home(),
//         '/profile': (context) => ProfilePage(),
//         '/shareApp': (context) => ShareAppPage(),
//         '/bookFlightPage': (context) => BookFlightPage(),
//         '/paymentPage': (context) => PaymentPage(),
//         '/invitePage': (context) => ManageInvitePage(),
//         '/changePassword': (context) => ChangePassword()
//       },
//       theme: ThemeData(
//           primarySwatch: Colors.grey,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//           fontFamily: 'Nunito',
//           dividerTheme: DividerThemeData(
//               color: Colors.grey //  <--- change the divider's color
//               )),
//     );
//   }
// }
