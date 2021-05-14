import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gorin/Views/HomeScreen.dart';
import 'package:gorin/Views/Login.dart';
import 'package:gorin/Views/Register.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/':(context)=>Login(),
        '/register':(context)=>Register(),
        '/home_screen':(context)=>HomeScreen(),


      }
    );
  }
}

