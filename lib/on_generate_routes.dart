


import 'package:brilliant_app/Profile/presentation/edit_profile_screen.dart';
import 'package:brilliant_app/User/presentation/page/credential/sign_in.dart';
import 'package:brilliant_app/User/presentation/page/credential/sign_up.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/material.dart';

import 'User/domain/entities/user.dart';


class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;


    switch(settings.name) {
      case PageConst.editProfileScreen: {
        if (args is UserEntity) {
          return routeBuilder(EditProfileScreen(currentUser: args,));

        } else {
          return routeBuilder(NoPageFound());
        }

      }
      case PageConst.signInPage: {
        return routeBuilder(const SingIn());
      }
      case PageConst.signUpPage: {
        return routeBuilder(SignUp());
      }
      default: {
        NoPageFound();
      }
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page not found"),
      ),
      body: Center(child: Text("Page not found"),),
    );
  }
}