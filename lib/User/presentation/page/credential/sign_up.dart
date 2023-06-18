

import 'dart:io';
import 'package:image_picker/image_picker.dart';


import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/presentation/cubit/Auth/auth_cubit.dart';
import 'package:brilliant_app/User/presentation/cubit/Credential/credential_cubit.dart';
import 'package:brilliant_app/User/presentation/page/credential/sign_in.dart';
import 'package:brilliant_app/User/presentation/page/main_screen.dart';
import 'package:brilliant_app/User/presentation/widgets/form_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brilliant_app/profile_widget.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();}


class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  bool _isSigningUp = false;

  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
  File? _image;
  Future selectImage() async {
    try {
      final pickedFile = await ImagePicker.platform.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print("no image has been selected");
        }
      });

    } catch(e) {
      toast("some error occured $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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

      )
    );
  }


  _bodyWidget(){
  return  SafeArea(
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
            keyboardDismissBehavior:
            ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RegisterForm(
                  emailController: _emailController,
                  usernameController: _usernameController,
                  passwordController: _passwordController,
                  bioController: _bioController,
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 30.0, top: 150.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Century Gothic',
                        color: black,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Already have an account? ',
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SingIn(),
                                ),
                              );
                            },
                          text: 'Sign in.',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
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
  Future<void> _signUpUser() async {
    setState(() {
      _isSigningUp = true;
    });
    BlocProvider.of<CredentialCubit>(context).signUpUser(
        user: UserEntity(
          username: _usernameController.text,
          email: _emailController.text,
            password: _passwordController.text,
            bio: _bioController.text,
            imageFile: _image,
            totalPosts: 0,



        )
    ).then((value) => _clear());
  }

  _clear() {
    setState(() {
      _usernameController.clear();
      _bioController.clear();
      _emailController.clear();
      _passwordController.clear();
      _isSigningUp = false;

    });
  }

}


class RegisterForm extends StatefulWidget {

  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController bioController;
  bool _isUploading = false;
  
  RegisterForm({
    Key? key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.bioController,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  File? _image;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0),
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
                  offset: const Offset(3, 4),
                ),
              ],
            ),
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
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: profileWidget(image: _image),
                ),
                Positioned(
                  right: -9.0,
                  bottom: -12.0,
                  child: IconButton(
                    onPressed: (){
                      final signUpState = context.findAncestorStateOfType<_SignUpState>();
                      if (signUpState != null) {
                        signUpState.selectImage();}
                      },
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 25.0,
                      color: black.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: FormContainer(
              hintText: 'Username',
              controller: widget.usernameController,

            )
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: FormContainer(
              hintText: 'Email',
              controller: widget.emailController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: FormContainer(
              hintText: 'Password',
              isPasswordFiel: true,
              controller: widget.passwordController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: FormContainer(
              hintText: 'Bio',
              controller: widget.bioController,
            ),
          ),
          GestureDetector(
            onTap: ()  {
              final signUpState = context.findAncestorStateOfType<_SignUpState>();
              if (signUpState != null) {
                signUpState._signUpUser();
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: SvgPicture.asset(
                'assets/buttonPlay.svg',
                width: 100.0,
                height: 100.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

}


