import 'dart:convert';

class User {
  User({
    this.name,
    this.email,
    this.password,
    this.uimage,
  });

  String name;
  String email;
  String password;
  String image="";
  String uimage="";

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    uimage: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "image": uimage,
  };

  bool setEmail(String email){
    email = email.trim();
    String temp  = RegExp("[^@]+@[a-zA-Z0-9]+[.][a-zA-Z]+").stringMatch(email);

    if(temp==email){
      this.email=email;
      return true;
    }
    else{
      return false;
    }
  }
  bool setName(String name){
    name = name.trim();
    if(name.length!=0){
      this.name = name;
      return true;
    }
    else{

      return false;
    }
  }
  bool setPass(String pass){
    pass = pass.trim();
    if(pass.length>5){
      this.password = pass;
      return true;
    }
    else{
      return false;
    }
  }

}
