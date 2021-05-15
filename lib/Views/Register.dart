import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gorin/Controller/registerController.dart';
import 'package:gorin/Utils/Constants.dart' as util;
import 'package:gorin/Utils/CustomWidgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class Register extends StatelessWidget {
  ImagePicker gal = ImagePicker();
  RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: util.backgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.grey,),
            onPressed: ()=>Get.back(),
          ),
        ),
        backgroundColor: util.backgroundColor,
        body: Obx(
          ()=> ModalProgressHUD(
            inAsyncCall: controller.load.value,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: (Get.height/10)*1,),
                    Text(
                        "Sign Up with email",
                      style: TextStyle(
                        color: util.circularAvtarColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 30,),
                    controller.user.value.image==""||controller.user.value.image==null?
                    GestureDetector(
                      onTap: (){
                        Get.dialog(
                          AlertDialog(
                            title: Text('Message'),
                            content: Text("Choose method"),
                            actions: [
                              RaisedButton(onPressed: ()=>controller.cameraCover(),child: Text("Camera"),),
                              RaisedButton(onPressed: ()=>controller.galleryCover(),child: Text("Gallery"),),
                            ],

                          )
                        );
                      },
                      child: CircleAvatar(

                        backgroundColor: util.circularAvtarColor,
                        radius: 45,
                        child: Icon(Icons.person,color: Colors.white,size: 30,),
                      ),
                    ):
                    Stack(
                      children: [
                        Container(

                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: FileImage(File(controller.user.value.image)),
                              fit: BoxFit.contain
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: -10,
                            right: -15,
                            child: IconButton(icon: Icon(Icons.clear), onPressed: (){
                              controller.user.update((val) {
                                val.image = "";
                              });
                            } ))
                      ],
                    ),
                    SizedBox(height: 20,),
                    myField(hintText: "Name",controller: controller.nameCon,),
                    SizedBox(height: 10,),
                    myField(hintText: "Email",controller: controller.emailCon),
                    SizedBox(height: 10,),
                    myField(
                        hintText: "Password",
                          obscureText: controller.hidePass.value,
                          controller: controller.passCon,
                        suffixIcon: IconButton(
                          onPressed: (){
                            controller.hidePass.value = !controller.hidePass.value;
                          },
                          icon: Icon(Icons.remove_red_eye,color: Colors.grey,)
                        ),
                      ),

                    SizedBox(height: 30,),
                    MyButton(
                        text: 'Sign Up',
                        onTap: ()async{
                          // print(controller.user.value.image);
                          // return;
                          controller.load.value=true;
                          await controller.signUp();
                          controller.load.value=false;
                        }
                    ),
                    SizedBox(height: 35,),
                    Text(
                      "Already Have an account?",
                      style: TextStyle(
                          color: util.circularAvtarColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 15,),
                    GestureDetector(
                      onTap: ()=>Get.back(),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: util.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16

                        ),
                      ),
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

}

