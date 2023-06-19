import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const white = Color(0xFFFEFEFF);
const green = Color(0xFF769656);
const grey = Color(0xFFCBCBCB);
const black = Color(0xFF363636);
const primaryColor = Color(0xFF7B583D);
const secondaryColor = Color(0xFFD9D9D9);
const secondaryBlack = Color(0xFF3F3F3F);
const backgroundColor = Color(0xFFBBBBBB);
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

class Screens {
  static const String editProfileScreen = 'editProfileScreen';
  static const String editPostScreen = 'editPostScreen';
  static const String commentScreen = 'commentScreen';
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
}
