import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summar_me/extras/constants.dart';
import 'package:summar_me/modules/login/controller/loginController.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = Get.find();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final focus = FocusNode();

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
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 16.0),
            child: Column(
              children: [
                Material(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: white,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            welcomeBack,
                            height: 128.0,
                          ),
                        ),
                        SizedBox(
                          height: spacing * 1 / 2,
                        ),
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: textGrey,
                              ),
                        ),
                        SizedBox(
                          height: spacing * 1 / 2,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                textAlign: TextAlign.start,
                                controller: emailController,
                                onSubmitted: (v) {
                                  FocusScope.of(context).requestFocus(focus);
                                },
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
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
                              Obx(
                                () => TextField(
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.text,
                                  focusNode: focus,
                                  controller: passwordController,
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
                                height: spacing * 1 / 2,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "Forgot Password?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: textGrey,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: spacing * 1 / 2,
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: Get.width * 1 / 2,
                                height: 56.0,
                                decoration: new BoxDecoration(
                                  color: green,
                                  border:
                                      new Border.all(color: green, width: 2.0),
                                  borderRadius: new BorderRadius.circular(48.0),
                                ),
                                child: Obx(
                                  () => InkWell(
                                    onTap: () {
                                      !_controller.showLoader.value
                                          ? loginLogic()
                                          : null;
                                    },
                                    child: new Container(
                                      width: Get.width * 0.4,
                                      child: new Center(
                                        child: new Text(
                                          !_controller.showLoader.value
                                              ? "Login"
                                              : "Please wait..",
                                          style: new TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: spacing * 1 / 2,
                              ),
                              Text(
                                "Or connect with",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                      color: textGrey,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: spacing * 1 / 2,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              facebook,
                              height: spacing * 2,
                            ),
                            Image.asset(
                              google,
                              height: spacing * 2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: spacing * 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/signUp');
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: textGrey,
                                    ),
                              ),
                              Text(
                                "Sign Up",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: green,
                                    ),
                              ),
                              SizedBox(
                                height: spacing * 1 / 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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

  /// ------------------------------------------------------------
  /// Method that handles click of login button
  /// ------------------------------------------------------------
  Future<void> loginLogic() async {
    // if (emailController.text.toString().trim().isEmpty) {
    //   Get.snackbar("Error", "Please enter email id");
    //   return;
    // }
    //
    // if (!isEmail(emailController.text.toString().trim())) {
    //   Get.snackbar("Error", "Please enter valid email id");
    //   return;
    // }
    //
    // if (passwordController.text.toString().trim().isEmpty) {
    //   Get.snackbar("Error", "Enter password");
    //   return;
    // }
    // _controller.showLoader.value = true;
    Get.toNamed('/home');
    // UserModel userModel =
    //     await _controller.login(emailController.text, passwordController.text);
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
