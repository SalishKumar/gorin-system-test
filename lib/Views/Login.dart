import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gorin/Controller/loginController.dart';
import 'package:gorin/Utils/Constants.dart' as util;
import 'package:gorin/Utils/CustomWidgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class Login extends StatelessWidget {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.clear,color: Colors.grey,)),
                    SizedBox(height: (Get.height/10)*2,),
                    Text(
                      "Login with email",
                      style: TextStyle(
                          color: util.circularAvtarColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(height: 10,),
                    myField(hintText: "Email",controller: controller.emailCon,),
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
                    Text(
                      'Forget Password?',
                      style: TextStyle(
                          color: util.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16

                      ),
                    ),
                    SizedBox(height: 20,),
                    MyButton(
                      text: "Login",onTap: ()=>controller.login(),
                    ),
                    SizedBox(height: 35,),
                    Text(
                      "Don't Have an account?",
                      style: TextStyle(
                          color: util.circularAvtarColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 15,),
                    GestureDetector(
                      onTap: ()=>Get.toNamed('/register'),
                      child: Text(
                        'Sign Up',
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


