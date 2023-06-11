import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Notifications',
            style: TextStyle(
                color: black,
                fontSize: 20,
                fontFamily: 'Century Gothic',
                fontWeight: FontWeight.bold)),
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
      ),
      body: const Center(child: Text('Notifications')),
    );
  }
}
