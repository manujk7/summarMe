import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color blue = Color(0xFF1FB6FC);
const Color yellow = Color(0xFFF7F5BD);
const Color black = Colors.black87;
const Color green = Color(0xFF4DA880);
const Color lightGrey = Color(0xFFbdbfc2);
const Color lightGreen = Color(0xFF90ceb0);
const Color textGrey = Color(0xFF656565);
const Color orange = Color(0xFFFD7238);
const Color red = Color(0xFFDE746F);
const Color white = Colors.white;
const Color grey = Colors.blueGrey;
const Color background = Color(0xFFF7F7F7);
const Color borderBg = Color(0xFFF5F5F5);
const double spacing = 24.0;
const String brandName = 'Brand_Name';
const String logoImage = 'assets/images/logo.png';
const String welcomeBack = 'assets/images/welcomeBack.png';
const String facebook = 'assets/icons/facebook.png';
const String google = 'assets/icons/google.png';
const String firstPagePattern = 'assets/images/firstPagePattern.png';
const String dummyPlane = 'assets/images/planeDummy.jpg';
const String dummyPlaneHome = 'assets/images/imagePlane.png';
const String document = 'assets/images/policyIcon.png';
const String documentInvoice = 'assets/images/invoiceIcon.png';
const String brandNameLogo = 'assets/images/brandName.png';
const String fontFamily = 'Jura';
var placeholder = AssetImage('assets/images/placeholder.jpg');


class Constants {
  static DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  static DateFormat dateFormatParse = DateFormat("yyyy-MM-dd");
  static String imagePath = '';
  static bool openScanner = true;

  //Function to hide KeyBoard--------------------
  //---------------------------------------------
  static hideKeyBoard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static getFormattedDate(date) {
    return Constants.dateFormat.format(Constants.dateFormatParse.parse(date));
  }
}

const textInputDecorationRect = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    horizontal: spacing / 2,
    vertical: 0,
  ),
  hintText: "Currency code (INR, USD, EUR, ...)",
  hintStyle: TextStyle(color: Colors.black26),
  fillColor: white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white24,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white24,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  ),
  /*focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColor,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColor,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  ),*/
);

Widget inputField(BuildContext context, String hintText, bool obscureText,
    TextInputType textInputType) {
  return TextField(
    textAlign: TextAlign.start,
    keyboardType: textInputType,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          width: 0.1,
          style: BorderStyle.solid,
          color: borderBg,
        ),
      ),
      contentPadding: EdgeInsets.all(20),
    ),
  );
}

Widget inputFieldNoCurvedBorder(BuildContext context, String hintText,
    bool obscureText, TextInputType textInputType) {
  return TextField(
    textAlign: TextAlign.start,
    keyboardType: textInputType,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(
          width: 0.5,
          style: BorderStyle.none,
        ),
      ),
      contentPadding: EdgeInsets.all(16),
    ),
  );
}

Widget customButton(BuildContext context, String title, Color color,
    double width, String route) {
  return Container(
    width: Get.width * width,
    height: 56.0,
    decoration: new BoxDecoration(
      color: blue,
      border: new Border.all(color: color, width: 2.0),
      borderRadius: new BorderRadius.circular(6.0),
    ),
    child: InkWell(
      onTap: () {
        print(route.toString());
        Get.toNamed(route);
      },
      child: new Container(
        width: Get.width * 0.4,
        child: new Center(
          child: new Text(
            title,
            style: new TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      ),
    ),
  );
}

Widget homeListView(BuildContext context, int index) {
  return Container(
    padding: EdgeInsets.all(12.0),
    color: blue,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        new Container(
          width: 60.0,
          height: 60.0,
          decoration: new BoxDecoration(
            color: const Color(0xff7c94b6),
            image: new DecorationImage(
              image: new NetworkImage(
                  'https://miro.medium.com/max/560/1*MccriYX-ciBniUzRKAUsAw.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
            border: new Border.all(
              color: white,
              width: 4.0,
            ),
          ),
        ),
        Text(
          "Mr Devanur",
          style: Theme.of(context).textTheme.headline5.copyWith(
                color: white,
              ),
        ),
        SizedBox(
          width: spacing * 3,
        ),
        Icon(
          Icons.settings,
          size: 24.0,
          color: white,
        ),
      ],
    ),
  );
}

storeString(String value, String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<String> getStrng(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final value = await prefs.get(key);
  if (value != null) {
    return value;
  } else {
    return "";
  }
}

//This is the common function which works whole application, which set Text with different font and color.
setCommonText(String title, dynamic color, dynamic fontSize, dynamic fontweight,
    dynamic noOfLine) {
  return new Text(
    title,
    style: new TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontweight,
    ),
    maxLines: noOfLine,
    overflow: TextOverflow.ellipsis,
  );
}

//set space
setWithSpace(double width) {
  return SizedBox(
    width: width,
  );
}

