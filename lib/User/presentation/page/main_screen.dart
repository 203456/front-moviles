import 'package:brilliant_app/Notification/presentation/notification_screen.dart';
import 'package:brilliant_app/Post/presentation/page/post_screen.dart';
import 'package:brilliant_app/Profile/presentation/profile_screen.dart';
import 'package:brilliant_app/User/presentation/cubit/User/get_single_user/get_single_user_cubit.dart';
import 'package:brilliant_app/User/presentation/page/navegation_screen.dart';
import 'package:brilliant_app/User/presentation/page/search_screen.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  final String uid;
  const MainScreen({Key? key, required this.uid}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    BlocProvider.of<GetSingleUserCubit>(context).getSingleUser(uid: widget.uid);
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
    return BlocBuilder<GetSingleUserCubit, GetSingleUserState>(
      builder: (context, getSingleUserState){
        if(getSingleUserState is GetSingleUserLoaded){
          final currentUser = getSingleUserState.user;
          return  Scaffold(
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
                children:  [
                  const FeedScreen(),
                  const SearchScreen(),
                  const PostScreen(),
                  const NotificationScreen(),
                  ProfileScreen(currentUser: currentUser,)
                ],
              )
          );


        }
        return const Center(child: CircularProgressIndicator(),);
      }
    );
  }
}
