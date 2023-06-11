import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('BRILLANT',
            style: TextStyle(
                color: black,
                fontSize: 20,
                fontFamily: 'Century Gothic',
                letterSpacing: 20 * 0.36)),
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
      ),
      body: const Center(child: Text('Feed')),
    );
  }
}
