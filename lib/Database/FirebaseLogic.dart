import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gorin/Models/User.dart' as myUser;
import 'dart:io';
import 'package:path/path.dart';
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final CollectionReference users =
Firestore.instance.collection('users');

registerUser(myUser.User user)async{
  print("!1");
  try {
    AuthResult userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email:user.email,
      password: user.password,
    );
    print("!2");
    return writeInDocument(user);
    ;
  } on PlatformException catch(e){
    Get.snackbar("Error", e.message,duration: Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
    return false;

  }
  catch (e) {
    print(e);
    Get.snackbar("Error", e,duration: Duration(seconds: 1),snackPosition: SnackPosition.BOTTOM);
    return false;
  }


}
writeInDocument(myUser.User user)async{

  String image = await upload(user);
  if(image==null)
    return false;
  try {
    user.uimage = image;
    await users.add(user.toJson());
    return true;
  }
  catch(e){
    Get.snackbar("Error", e,duration: Duration(seconds: 1),snackPosition: SnackPosition.BOTTOM);
    return false;
  }

}
Future upload(myUser.User user) async {
  String file1 = basename(user.image);

  StorageReference ref = FirebaseStorage.instance
      .ref()
      .child(file1);
  StorageUploadTask sut = ref.putFile(File(user.image));
  StorageTaskSnapshot storageSnapshot = await sut.onComplete;
  //sleep(Duration(seconds: time));
  return ref.getDownloadURL();
}

loginUser(myUser.User user)async{
  print("!1");
  try {
    AuthResult userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email:user.email,
      password: user.password,
    );
    print(userCredential.user.email);
    return true;
  }on PlatformException catch(e){
    Get.snackbar("Error", e.message,duration: Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
    return false;
  }
  catch (e) {
    Get.snackbar("Error", e,duration: Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
    return false;
  }



}
logout(){
  firebaseAuth.signOut();
  Get.offAndToNamed('/');

}

_userFromFirebaseUser(FirebaseUser user) {
  if(user!=null){
    Get.offAllNamed('/home_screen',arguments:user.email);
  }

}

// Stream<User> get user {
//   return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
// }
autoLogin()async{
  print("%%^^&");
  // firebaseAuth.onAuthStateChanged.map(_userFromFirebaseUser);
  FirebaseUser user = await firebaseAuth.currentUser();
  if(user!=null){
    Get.offAllNamed('/home_screen',arguments:user.email);
  }
}