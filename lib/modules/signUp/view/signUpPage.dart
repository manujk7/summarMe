import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:summar_me/extras/constants.dart';
import 'package:summar_me/modules/signUp/controller/signUpController.dart';
import 'package:summar_me/modules/tabScreens/view/home.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController _controller = Get.find();
  final nameController = new TextEditingController();
  final subscriptionController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final confirmPasswordController = new TextEditingController();
  final dateOfBirthController = new TextEditingController();
  final focusEmail = FocusNode();
  final focusPass = FocusNode();
  final focusConfirmPass = FocusNode();
  DateTime _dateOfBirth;

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
      backgroundColor: background,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Container(
            color: background,
            width: Get.width,
            margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 16.0),
            child: Material(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: white,
              child: Container(
                margin: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                child: Column(
                  children: [
                    Text(
                      "Let's get started!",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    Text(
                      "Create an account to get all features.",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: textGrey,
                          ),
                    ),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      controller: nameController,
                      onSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusEmail);
                      },
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        filled: true,
                        fillColor: borderBg,
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      controller: emailController,
                      focusNode: focusEmail,
                      onSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusPass);
                      },
                      decoration: InputDecoration(
                        hintText: "Email address",
                        filled: true,
                        fillColor: borderBg,
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.datetime,
                      obscureText: false,
                      controller: dateOfBirthController,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        _selectDateDeparture(context);
                      },
                      decoration: InputDecoration(
                        hintText: "Date of birth",
                        filled: true,
                        fillColor: borderBg,
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    Obx(
                      () => TextField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        focusNode: focusPass,
                        onSubmitted: (v) {
                          FocusScope.of(context).requestFocus(focusConfirmPass);
                        },
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: _controller.isHidden.value,
                        decoration: InputDecoration(
                          hintText: "Password",
                          filled: true,
                          fillColor: borderBg,
                          hintStyle: TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          suffixIcon: InkWell(
                            onTap: _controller.togglePasswordView,
                            child: Icon(
                              _controller.isHidden.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_rounded,
                              color: blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    Obx(
                      () => TextField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        focusNode: focusConfirmPass,
                        onSubmitted: (v) {},
                        textAlignVertical: TextAlignVertical.center,
                        controller: confirmPasswordController,
                        obscureText: _controller.isHiddenConfirm.value,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          filled: true,
                          fillColor: borderBg,
                          hintStyle: TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          suffixIcon: InkWell(
                            onTap: _controller.toggleConfirmPasswordView,
                            child: Icon(
                              _controller.isHiddenConfirm.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_rounded,
                              color: blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      controller: subscriptionController,
                      onSubmitted: (v) {},
                      decoration: InputDecoration(
                        hintText: "Subscription",
                        filled: true,
                        fillColor: borderBg,
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        suffixIcon: Icon(
                          Icons.arrow_forward_ios,
                          color: grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    Text(
                      "By creating an account, you automatically agree with our Privacy Policy.",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: textGrey,
                          ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    Container(
                      width: Get.width * 3 / 4,
                      height: 56.0,
                      decoration: new BoxDecoration(
                        color: green,
                        border: new Border.all(color: green, width: 2.0),
                        borderRadius: new BorderRadius.circular(48.0),
                      ),
                      child: Obx(
                        () => InkWell(
                          onTap: () {
                            !_controller.showLoader.value
                                ? registerLogic()
                                : null;
                          },
                          child: new Container(
                            width: Get.width * 0.4,
                            child: new Center(
                              child: new Text(
                                !_controller.showLoader.value
                                    ? "Create an account"
                                    : "Please wait..",
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  _selectDateDeparture(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _dateOfBirth != null ? _dateOfBirth : DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: blue,
                onPrimary: white,
                surface: grey,
                onSurface: white,
              ),
              dialogBackgroundColor: textGrey,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _dateOfBirth = newSelectedDate;
      dateOfBirthController
        ..text = DateFormat("MM/dd/yyyy").format(_dateOfBirth)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateOfBirthController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  /// ------------------------------------------------------------
  /// Method that handles click of register button
  /// ------------------------------------------------------------
  Future<void> registerLogic() async {
    if (emailController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter email id");
      return;
    }

    if (nameController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter name");
      return;
    }

    if (!isEmail(emailController.text.toString().trim())) {
      Get.snackbar("Error", "Please enter valid email id");
      return;
    }

    if (dateOfBirthController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter departture date");
      return;
    }

    if (passwordController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Enter password");
      return;
    }

    if (passwordController.text.toString().trim() !=
        confirmPasswordController.text.toString().trim()) {
      Get.snackbar("Error", "Enter enter the same password");
      return;
    }
    Get.offAll(() => Home());
    // _controller.showLoader.value = true;

    // UserModel userModel = await _controller.registerUser(
    //     nameController.text,
    //     emailController.text,
    //     numberController.text,
    //     passwordController.text,
    //     confirmPasswordController.text,
    //     addressController.text,
    //     cityController.text,
    //     stateValue,
    //     zipCodeController.text,
    //     referCodeController.text);
    //
    // if (userModel.status == "true") {
    //   _controller.showLoader.value = false;
    //   Get.snackbar("Success", userModel.msg);
    //   final _prefs = SharedPrefs();
    //   _prefs.setAuthCode(userModel.authCode);
    //   _prefs.saveProfile(jsonEncode(userModel.profile));
    //   Get.offAll(() => Home());
    // } else {
    //   _controller.showLoader.value = false;
    //   Get.snackbar("Error", userModel.msg);
    // }
  }
}
