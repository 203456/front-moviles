import 'package:brilliant_app/const.dart';
import 'package:brilliant_app/encryptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(backgroundColor: grey, items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home, color: grey), label: ''),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search, color: grey), label: ''),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add, color: grey), label: ''),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person, color: grey), label: ''),
      ]),
    );
  }
}
