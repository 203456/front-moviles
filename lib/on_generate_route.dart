import 'package:brilliant_app/Post/presentation/page/comment_screen.dart';
import 'package:brilliant_app/Post/presentation/page/edit_post_screen.dart';
import 'package:brilliant_app/Profile/presentation/edit_profile_screen.dart';
import 'package:brilliant_app/User/presentation/page/credential/sign_in.dart';
import 'package:brilliant_app/User/presentation/page/credential/sign_up.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/material.dart';

class onGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Screens.editProfileScreen:
        {
          return routeBuilder(const EditProfileScreen());
        }
      case Screens.editPostScreen:
        {
          return routeBuilder(const EditPostScreen());
        }
      case Screens.commentScreen:
        {
          return routeBuilder(const CommentScreen());
        }
      case Screens.signIn:
        {
          return routeBuilder(const SingIn());
        }
      case Screens.signUp:
        {
          return routeBuilder(const SignUp());
        }
      default:
        const NoPageFound();
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Center(child: Text("Page Not Found")),
    );
  }
}
