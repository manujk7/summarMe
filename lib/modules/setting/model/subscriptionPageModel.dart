// To parse this JSON data, do
//
//     final subscriptionPageModel = subscriptionPageModelFromJson(jsonString);

import 'dart:convert';

SubscriptionPageModel subscriptionPageModelFromJson(String str) => SubscriptionPageModel.fromJson(json.decode(str));

String subscriptionPageModelToJson(SubscriptionPageModel data) => json.encode(data.toJson());

class SubscriptionPageModel {
  SubscriptionPageModel({
    this.label,
    this.subLabel,
    this.switchMode,
    this.switchValue,
  });

  String label;
  String subLabel;
  String switchMode;
  bool switchValue;

  factory SubscriptionPageModel.fromJson(Map<String, dynamic> json) => SubscriptionPageModel(
    label: json["label"],
    subLabel: json["subLabel"],
    switchMode: json["switchMode"],
    switchValue: json["switchValue"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "subLabel": subLabel,
    "switchMode": switchMode,
    "switchValue": switchValue,
  };
}
