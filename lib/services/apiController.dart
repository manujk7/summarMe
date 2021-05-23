import 'dart:io';
import 'package:get/get.dart';
import 'commonMessageStatusModel.dart';

class ApiController extends GetConnect {
  final baseUrl = "http://gendeep.com/dev/brent/Data_v1/";

  /// API call to login
  // Future<UserModel> loginUser(String email, String password) async {
  //   final form = FormData({
  //     'email': email,
  //     'password': password,
  //   });
  //   var response = await post("login", form);
  //   if (!response.status.isOk) {
  //     return Future.error("Something went wrong");
  //   } else {
  //     var data = response.body;
  //     print(data.toString());
  //     return userModelFromJson(response.body.toString());
  //   }
  // }


}
