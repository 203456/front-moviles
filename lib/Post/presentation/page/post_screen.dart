import 'package:brilliant_app/const.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: secondaryBlack.withOpacity(0.3),
                  shape: BoxShape.circle),
              child: const Center(
                child: Icon(
                  Icons.upload,
                  color: secondaryColor,
                  size: 40.0,
                ),
              )),
        ),
      ),
    );
  }
}
