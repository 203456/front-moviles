import 'package:brilliant_app/Profile/presentation/profile_screen.dart';
import 'package:brilliant_app/User/presentation/cubit/User/get_single_user/get_single_user_cubit.dart';
import 'package:brilliant_app/User/presentation/page/credential/sign_in.dart';
import 'package:brilliant_app/User/presentation/page/main_screen.dart';
import 'package:brilliant_app/User/presentation/page/search_screen.dart';
import 'package:brilliant_app/const.dart';
import 'package:brilliant_app/encryptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedScreen extends StatefulWidget {
//  final String uid;

  const FeedScreen({Key? key}): super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int _currentIndex = 0;

  late PageController pageController;

/*  @override
  void initState() {
    BlocProvider.of<GetSingleUserCubit>(context).getSingleUser(uid: widget.uid);
    pageController = PageController();
    super.initState();
    }
     @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }*/

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
            return const Scaffold(
              backgroundColor: backgroundColor,
              body:  Center(
                child: Text(
                    "FeedScreen"

                ),
              )
              
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      );
    }
  }
