import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gorin/Models/User.dart';
import 'package:gorin/Database/FirebaseLogic.dart' as fire;
import 'package:image_picker/image_picker.dart';
class RegisterController extends GetxController{
  TextEditingController nameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  var user = User().obs;
  ImagePicker imagePicker = ImagePicker();
  var load = false.obs;
  TextEditingController passCon = TextEditingController();
  var hidePass = true.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  signUp()async{
    if(user.value.image==""){
      Get.snackbar("Error", "Choose profile picture",duration: Duration(seconds: 1),snackPosition: SnackPosition.BOTTOM);
    }
    else if(!user.value.setEmail(emailCon.text)){
      Get.snackbar("Error", "Email format is not valid",duration: Duration(seconds: 1),snackPosition: SnackPosition.BOTTOM);
    }
    else if(!user.value.setName(nameCon.text)){
      Get.snackbar("Error", "name can't be empty",duration: Duration(seconds: 1),snackPosition: SnackPosition.BOTTOM);
    }
    else if(!user.value.setPass(passCon.text)){
      Get.snackbar("Error", "password must be greater than 5 length",duration: Duration(seconds: 1),snackPosition: SnackPosition.BOTTOM);
    }
    else{
      print("Iam here");
     bool status = await fire.registerUser(user.value);
      print("Iam here1");
      if(status){
        Get.offAllNamed('/home_screen',arguments:user.value.email);
     }
    }

  }
  cameraCover()async{
    Get.back();
    try {
      var choosedimage = await imagePicker.getImage(source: ImageSource.camera,imageQuality: 50);
      user.value.image =choosedimage.path;

    } catch (e) {
      print(e);
      user.value.image = "";
    }
  }
  galleryCover()async{
    Get.back();
    try {
      var choosedimage = await imagePicker.getImage(source: ImageSource.gallery,imageQuality: 50);
      user.value.image =choosedimage.path;
      user.update((val) {
        val.image = choosedimage.path;
      });

    } catch (e) {
      print(e);
      user.value.image = "";

      user.update((val) {
        val.image = "";
      });
    }
  }

}