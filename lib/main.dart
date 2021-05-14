import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gorin/Views/Register.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: Register()
    );
  }
}

