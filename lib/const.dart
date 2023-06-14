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

class PageConst {
  static const String editProfilePage = "editProfilePage";
  static const String updatePostPage = "updatePostPage";
  static const String commentPage = "commentPage";
  static const String signInPage = "signInPage";
  static const String signUpPage = "signUpPage";
  static const String updateCommentPage = "updateCommentPage";
  static const String updateReplayPage = "updateReplayPage";
  static const String postDetailPage = "postDetailPage";
  static const String singleUserProfilePage = "singleUserProfilePage";
  static const String followingPage = "followingPage";
  static const String followersPage = "followersPage";
}
