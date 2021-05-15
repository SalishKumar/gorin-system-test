import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gorin/Controller/homeScreenController.dart';
import 'package:gorin/Utils/Constants.dart' as util;
import 'package:gorin/Utils/CustomWidgets.dart';
class HomeScreen extends StatelessWidget {
  HomeSceenController controller = Get.put(HomeSceenController());
  String email = Get.arguments;
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
              StreamBuilder<QuerySnapshot>(
                  stream: controller.collectionStream,
                  builder: (context,snapshot){
                    print(snapshot.data.documents.length);
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    if(snapshot.data.documents.length==1){
                      return Column(
                        children: [
                          Center(child: Text("No User Found")),
                          SizedBox(height: 20,),
                          MyButton(
                              text: "Logout",onTap: (){
                                controller.logout();

                          }
                          ),
                        ],
                      );
                    }

                    print(snapshot.data.documents[0].data);
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context,index){
                          print("" +snapshot.data.documents[index].data["email"]);
                          if(snapshot.data.documents[index].data["email"]==email && snapshot.data.documents.length==index+1){
                            return Column(
                              children: [
                                Container(),
                                MyButton(
                                    text: "Logout",onTap: ()=>controller.logout()
                                ),
                              ],
                            );

                          }
                          if(snapshot.data.documents[index].data["email"]==email){
                            return Container();

                          }

                            return Column(
                            children: [

                              ListTile(
                                leading: Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot.data.documents[index].data["image"]),
                                          fit: BoxFit.contain
                                      )
                                  ),
                                ),
                                title: Text(snapshot.data.documents[index].data["name"]),
                              ),
                              index!=snapshot.data.documents.length-1?Divider(
                                thickness: 1,
                              ):
                              Column(
                                children: [
                                  SizedBox(height: 10,),
                                  MyButton(
                                      text: "Logout",onTap: ()=>controller.logout()
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
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
