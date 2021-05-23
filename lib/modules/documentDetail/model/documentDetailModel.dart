// To parse this JSON data, do
//
//     final documentDetailModel = documentDetailModelFromJson(jsonString);

import 'dart:convert';

DocumentDetailModel documentDetailModelFromJson(String str) => DocumentDetailModel.fromJson(json.decode(str));

String documentDetailModelToJson(DocumentDetailModel data) => json.encode(data.toJson());

class DocumentDetailModel {
  DocumentDetailModel({
    this.documentInfo,
    this.infoNo,
  });

  String documentInfo;
  String infoNo;

  factory DocumentDetailModel.fromJson(Map<String, dynamic> json) => DocumentDetailModel(
    documentInfo: json["documentInfo"],
    infoNo: json["infoNo"],
  );

  Map<String, dynamic> toJson() => {
    "documentInfo": documentInfo,
    "infoNo": infoNo,
  };
}
