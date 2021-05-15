import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gorin/Database/FirebaseLogic.dart'as fire;
class HomeSceenController extends GetxController{
  Stream collectionStream = Firestore.instance.collection('users').snapshots();
  logout(){
    fire.logout();
  }
  @override
  void dispose() {
    super.dispose();
  }
}