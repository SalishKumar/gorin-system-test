import 'package:flutter/material.dart';
import 'package:gorin/Utils/Constants.dart' as util;
class myField extends StatelessWidget {
  const myField({
    Key key,
    @required this.hintText,
    this.suffixIcon
  }) : super(key: key);
  final hintText,suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)

          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: util.circularAvtarColor)

          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)

          ),
        ),

      ),
    );
  }
}
class MyButton extends StatelessWidget {
  const MyButton({
    Key key,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);
  final text,onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
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
            text,
            style: TextStyle(
                color: util.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16

            ),
          ),
        ),
      ),
    );
  }
}

