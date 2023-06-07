import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const backgroundColor = Color(0xFFBBBBBB);
const black = Color(0xFF000000);
const primaryColor = Color(0xFFCAAB7C);
const secondaryColor = Color(0xFFD9D9D9);
const grey = Color(0xFFCBCBCB);
const blueColor = Color(0xFF2E96CF);

class FirebaseConst {
  static const String users = 'Users';
}

void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: blueColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
