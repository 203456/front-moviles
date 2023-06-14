import 'package:brilliant_app/User/presentation/cubit/User/get_single_user/get_single_user_cubit.dart';
import 'package:brilliant_app/const.dart';
import 'package:brilliant_app/encryptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedScreen extends StatefulWidget {
  final String uid;

  const FeedScreen({Key? key, required this.uid}): super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int _currentIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    BlocProvider.of<GetSingleUserCubit>(context).getSingleUser(uid: widget.uid);
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
      return BlocBuilder<GetSingleUserCubit, GetSingleUserState>(
        builder: (context, getSingleUserState) {
          if (getSingleUserState is GetSingleUserLoaded) {
            final currentUser = getSingleUserState.user;
            return Scaffold(
              backgroundColor: backgroundColor,
              bottomNavigationBar: CupertinoTabBar(
                backgroundColor: backgroundColor,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home, color: black), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.search, color: black), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.add, color: black), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.person, color: black), label: ''),
                ],
                onTap: navigationTapped,
              ),
              body: PageView(
                controller: pageController,

                onPageChanged: onPageChanged,
                  children: [
                  FeedScreen(uid: widget.uid,),
                  FeedScreen(uid: widget.uid,),
                  FeedScreen(uid: widget.uid,),
                  FeedScreen(uid: widget.uid,),

                ],
              ),
              
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      );
    }
  }
