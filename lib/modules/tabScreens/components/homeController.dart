import 'dart:io';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var isLoggedIn = true.obs;

  // var selectedIndex = 1.obs;
  var isSwitched = false.obs;
  var expandFlag = false.obs;

  onLayoutCollapsed(bool value) {
    expandFlag.value = !value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // getProfileData();
    // getSelectedFlight("");
  }

  void changeRoute() {
    selectedIndex.value = 0;
  }

  // getProfileData() async {
  //   getProfile.value = await _prefs.getProfile();
  //   if (getProfile.value != null) {
  //     print(getProfile().name);
  //   }
  // }

  // Future<StatusMessageModel> logout() async {
  //   String auth = await _prefs.getAuthCode();
  //   return logoutModel.value = await ApiController().logout(auth);
  // }
}
