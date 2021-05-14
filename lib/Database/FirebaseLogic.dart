import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:gorin/Models/User.dart' as myUser;
import 'dart:io';
import 'package:path/path.dart';
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final CollectionReference users =
Firestore.instance.collection('users');

registerUser(myUser.User user)async{
  bool status = await writeInDocument(user);
  if(status){
    print("!1");
    try {
      AuthResult userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email:user.email,
        password: user.password,
      );
      print("!2");
      return true;
    }  catch (e) {
      print(e);
      Get.snackbar("Error", e,duration: Duration(seconds: 1),snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }
  else{
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