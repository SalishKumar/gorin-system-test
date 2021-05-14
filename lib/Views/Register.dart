import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gorin/Utils/Constants.dart' as util;
import 'package:gorin/Views/CustomWidgets.dart';
class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: util.backgroundColor,
        body: SingleChildScrollView(
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
                CircleAvatar(
                  backgroundColor: util.circularAvtarColor,
                  radius: 45,
                  child: Icon(Icons.person,color: Colors.white,size: 30,),
                ),
                SizedBox(height: 20,),
                myField(hintText: "Name",),
                SizedBox(height: 10,),
                myField(hintText: "Email",),
                SizedBox(height: 10,),
                myField(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.remove_red_eye)
                  ),
                ),
                SizedBox(height: 30,),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: util.buttonColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.all(20),
                    child: Text(
                        'Sign Up',
                      style: TextStyle(
                        color: util.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16

                      ),
                    ),
                    ),
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
                Text(
                  'Login',
                  style: TextStyle(
                      color: util.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16

                  ),
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }
}

