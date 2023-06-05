import 'package:brilliant_app/User/presentation/widgets/form_container.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingIn extends StatelessWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Stack(children: [
              Center(
                  child: Image.asset(
                'assets/BrillantLogo.png',
                width: double.infinity,
              )),
              SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const LoginForm(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0, top: 150.0),
                      child: RichText(
                          text: const TextSpan(
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'Century Gothic',
                                  color: black),
                              children: <TextSpan>[
                            TextSpan(text: 'Already have an account? '),
                            TextSpan(
                                text: 'Sign up.',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ])),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final BoxConstraints? viewportConstraints;

  const LoginForm({
    super.key,
    this.viewportConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 300.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Login',
            style: TextStyle(
                color: primaryColor,
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                      color: black.withOpacity(.25), offset: const Offset(3, 4))
                ]),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: FormContainer(
              hintText: 'Username',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: FormContainer(
              hintText: 'Password',
              isPasswordFiel: true,
            ),
          ),
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SvgPicture.asset('assets/buttonPlay.svg',
                    width: 100.0, height: 100.0),
              )),
        ],
      ),
    );
  }
}
