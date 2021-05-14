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
