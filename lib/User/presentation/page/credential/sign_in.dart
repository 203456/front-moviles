import 'package:brilliant_app/User/presentation/cubit/Auth/auth_cubit.dart';
import 'package:brilliant_app/User/presentation/cubit/Credential/credential_cubit.dart';
import 'package:brilliant_app/User/presentation/page/credential/sign_up.dart';
import 'package:brilliant_app/User/presentation/page/main_screen.dart';
import 'package:brilliant_app/User/presentation/widgets/form_container.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();
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
      onTap: () =>  FocusScope.of(context).unfocus(),
      child:Scaffold(resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body:
        BlocConsumer<CredentialCubit, CredentialState>(
            listener: (context, credentialState){
              if(credentialState is CredentialState){
                BlocProvider.of<AuthCubit>(context).loggedIn();

              }
              if (credentialState is CredentialFailure) {
                toast("Invalid Email and Password");
              }
            },
            builder: (context, credentialState) {
              if (credentialState is CredentialSuccess) {
                return BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, authState) {
                    if (authState is Authenticated) {
                      return  MainScreen(uid: authState.uid,);
                    } else {
                      return _bodyWidget();

                    }
                  },
                );
              }return _bodyWidget();
            }
        ),

      ),
    );
  }


 Widget _bodyWidget() {
   return SafeArea(
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 15.0),
       child: Stack(
         children: [
           Center(
             child: Image.asset(
               'assets/BrillantLogo.png',
               width: double.infinity,
             ),
           ),
           SingleChildScrollView(
             keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 LoginForm(
                   emailController: _emailController,
                   passwordController: _passwordController,
                 ),
                 Padding(
                   padding: const EdgeInsets.only(bottom: 30.0, top: 150.0),
                   child: RichText(
                     text: TextSpan(
                       style: const TextStyle(
                         fontSize: 14.0,
                         fontFamily: 'Century Gothic',
                         color: black,
                       ),
                       children: <TextSpan>[
                         const TextSpan(text: "Don't have an account? "),
                         TextSpan(
                           recognizer: TapGestureRecognizer()
                             ..onTap = () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => const SignUp(),
                                 ),
                               );
                             },
                           text: 'Sign up.',
                           style: const TextStyle(fontWeight: FontWeight.bold),
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ],
       ),
     ),
   );
 }

 void _signInUser() {
   setState(() {
     _isSigningIn = true;
   });
   BlocProvider.of<CredentialCubit>(context).signInUser(
       email: _emailController.text,
       password: _passwordController.text
   ).then((value) => _clear());
 }

 _clear(){
   _emailController.clear();
   _passwordController.clear();
   _isSigningIn = false;
 }
}



class LoginForm extends StatelessWidget {

  final TextEditingController emailController;
  final TextEditingController passwordController;
  bool _isUploading = false;

  LoginForm({
  Key? key,
  required this.emailController,

  required this.passwordController,


  }) : super(key: key);

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
          Padding(
            padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
            child: FormContainer(
              hintText: 'Username',
              controller: emailController
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: FormContainer(
              hintText: 'Password',
              isPasswordFiel: true,
              controller: passwordController,
            ),
          ),
          GestureDetector(
              onTap: () {
                final signInState = context.findAncestorStateOfType<_SingInState>();
                if (signInState != null) {
                  signInState._signInUser();
                }
              },
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
