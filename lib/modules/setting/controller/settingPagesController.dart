import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:summar_me/modules/setting/model/subscriptionPageModel.dart';

class SettingPagesController extends GetxController {
  // var selectedIndex = 1.obs;
  var isSwitched = false.obs;
  var options = List<SubscriptionPageModel>().obs;

  @override
  void onInit() {
    super.onInit();
    String jsonObjectData =
        '{"labelDetails": [{"label": "Subscription", "subLabel": "Fee","switchMode":"1","switchValue":true}, '
        '{"label": "Advanced Mode", "subLabel": "Only for premium users","switchMode":"1","switchValue":true}, '
        '{"label": "Push Notifications", "subLabel": "Enable app Notifications","switchMode":"1","switchValue":false}, '
        ' {"label": "What\'s New", "subLabel": "","switchMode":"0","switchValue":false}]}';

    var categoryJsonObj = jsonDecode(jsonObjectData)['labelDetails'] as List;
    options.assignAll(categoryJsonObj
        .map((tagJson) => SubscriptionPageModel.fromJson(tagJson))
        .toList());
  }

  onSwitchChanged(bool value, int index) {
    options[index].switchValue = !value;
    options[index].obs.value = options[index];
  }
}
