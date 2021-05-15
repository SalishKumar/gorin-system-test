import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gorin/Models/User.dart';
import 'package:gorin/Database/FirebaseLogic.dart' as fire;


class LoginController extends GetxController{
  User user = User();
  TextEditingController passCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  @override
  void dispose() {
    passCon.dispose();
    emailCon.dispose();
    super.dispose();
  }
  var hidePass = true.obs;
  var load = false.obs;
  login()async{
    emailCon.text = emailCon.text.trim();
    if(emailCon.text.isEmpty){
      Get.snackbar("Error", "Email is empty",duration: Duration(seconds: 1),snackPosition: SnackPosition.BOTTOM);

    }
    else  if(passCon.text.isEmpty){
      Get.snackbar("Error", "Password is empty",duration: Duration(seconds: 1),snackPosition: SnackPosition.BOTTOM);

    }
    else{
      user.email = emailCon.text;
      user.password = passCon.text;
      load.value = true;
      bool status = await fire.loginUser(user);
      print("**(");
      print(user.email);
      if(status)
        Get.offAllNamed('/home_screen',arguments:user.email);
      load.value = false;
    }
  }
  @override
  void onInit() {
    print("**");

    fire.autoLogin();
    super.onInit();
  }
}