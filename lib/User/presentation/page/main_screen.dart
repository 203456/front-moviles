import 'package:brilliant_app/Notification/presentation/notification_screen.dart';
import 'package:brilliant_app/Post/presentation/page/post_screen.dart';
import 'package:brilliant_app/Profile/presentation/profile_screen.dart';
import 'package:brilliant_app/User/presentation/page/feed_screen.dart';
import 'package:brilliant_app/User/presentation/page/search_screen.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: CupertinoTabBar(
          height: 60.0,
          backgroundColor: grey,
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? const Icon(
                      CupertinoIcons.house_fill,
                      color: black,
                    )
                  : const Icon(CupertinoIcons.house, color: black),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: _currentIndex == 1
                    ? const Icon(
                        CupertinoIcons.search,
                        shadows: [
                          Shadow(
                              color: black,
                              offset: Offset(1, 1),
                              blurRadius: 0),
                          Shadow(
                              color: black,
                              offset: Offset(0, 1),
                              blurRadius: 0),
                          Shadow(
                              color: black, offset: Offset(1, 0), blurRadius: 0)
                        ],
                        color: black,
                      )
                    : const Icon(
                        CupertinoIcons.search,
                        color: black,
                      ),
                label: ''),
            BottomNavigationBarItem(
                icon: _currentIndex == 2
                    ? const Icon(
                        Icons.add_box_rounded,
                        color: black,
                      )
                    : const Icon(Icons.add_box_outlined, color: black),
                label: ''),
            BottomNavigationBarItem(
                icon: _currentIndex == 3
                    ? const Icon(CupertinoIcons.bell_fill, color: black)
                    : const Icon(CupertinoIcons.bell, color: black),
                label: ''),
            BottomNavigationBarItem(
                icon: _currentIndex == 4
                    ? const Icon(CupertinoIcons.person_alt_circle_fill,
                        color: black)
                    : const Icon(CupertinoIcons.person_alt_circle,
                        color: black),
                label: ''),
          ],
          onTap: navigationTapped,
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: const [
            FeedScreen(),
            SearchScreen(),
            PostScreen(),
            NotificationScreen(),
            ProfileScreen()
          ],
        ));
  }
}
