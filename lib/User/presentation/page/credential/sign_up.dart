import 'package:brilliant_app/User/presentation/page/credential/sign_in.dart';
import 'package:brilliant_app/User/presentation/widgets/form_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 100.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Register',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 60.0,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                      color: black.withOpacity(.25),
                                      offset: const Offset(3, 4))
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Stack(
                              children: [
                                Container(
                                  height: 80.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius:
                                          BorderRadius.circular(40.0)),
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 80.0,
                                    color: black.withOpacity(.3),
                                  ),
                                ),
                                Positioned(
                                    right: -9.0,
                                    bottom: -12.0,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        size: 25.0,
                                        Icons.add_a_photo,
                                        color: black.withOpacity(0.6),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: FormContainer(
                              hintText: 'Username',
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: FormContainer(
                              hintText: 'Email',
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: FormContainer(
                              hintText: 'Password',
                              isPasswordFiel: true,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 40.0),
                            child: FormContainer(
                              hintText: 'Bio',
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0, top: 150.0),
                      child: RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'Century Gothic',
                                  color: black),
                              children: <TextSpan>[
                            const TextSpan(text: 'Already have an account? '),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SingIn()));
                                },
                              text: 'Sign in.',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
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
