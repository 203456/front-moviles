import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            icon: FaIcon(FontAwesomeIcons.house, color: black,), label: ''),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house, color: black), label: ''),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house, color: black), label: ''),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house, color: black), label: ''),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house, color: black), label: ''),
      ]),
    );
  }
}
