import 'package:brilliant_app/User/presentation/cubit/Auth/auth_cubit.dart';
import 'package:brilliant_app/User/presentation/cubit/Credential/credential_cubit.dart';
import 'package:brilliant_app/User/presentation/page/credential/sign_up.dart';
import 'package:brilliant_app/User/presentation/page/feed_screen.dart';
import 'package:brilliant_app/User/presentation/widgets/form_container.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isSigningIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body:BlocConsumer<CredentialCubit, CredentialState>(
          listener: (context, credentialState) {
            if(credentialState is CredentialState){
              BlocProvider.of<AuthCubit>(context).loggedIn();
            }
            if(credentialState is CredentialFailure){
              toast("Invalid Email and Password");
            }
          },
          builder: (context, credentialState) {
            if (credentialState is CredentialSuccess) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  if (authState is Authenticated) {
                    return FeedScreen(uid: authState.uid);
                  } else {
                    return  SafeArea(
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
                          text: TextSpan(
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'Century Gothic',
                                  color: black),
                              children: <TextSpan>[
                            const TextSpan(text: "Don't have an account? "),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUp()));
                                  },
                                text: 'Sign up.',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))
                          ])),
                    )
                  ],
                ),
              )
            ]),
          ),
        );
                  }
                },
              );
            }
            return  SafeArea(
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
                          text: TextSpan(
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'Century Gothic',
                                  color: black),
                              children: <TextSpan>[
                            const TextSpan(text: "Don't have an account? "),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUp()));
                                  },
                                text: 'Sign up.',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))
                          ])),
                    )
                  ],
                ),
              )
            ]),
          ),
        );
          },
        )  
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
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
            padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
            child: FormContainer(
              hintText: 'Username',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 40.0),
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
