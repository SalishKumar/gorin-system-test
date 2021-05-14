import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gorin/Utils/Constants.dart' as util;
import 'package:gorin/Utils/CustomWidgets.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: util.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                    'Users',
                  style: TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        ListTile(
                          leading: Container(
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),
                                fit: BoxFit.contain
                              )
                            ),
                          ),
                          title: Text('Name'),
                        ),
                        index!=4?Divider(
                          thickness: 1,
                        ):Column(
                          children: [
                            SizedBox(height: 10,),
                            MyButton(
                              text: "Logout",onTap: ()=>Get.offAndToNamed('/')
                            ),
                          ],
                        ),
                      ],
                    );
                  }
              ),


            ],
          ),
        ),
      ),
    );
  }
}
