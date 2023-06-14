import 'package:brilliant_app/Profile/presentation/edit_profile_screen.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../User/domain/entities/user.dart';
import '../../User/presentation/cubit/Auth/auth_cubit.dart';

class ProfileScreen extends StatefulWidget {

  final UserEntity currentUser;
  const ProfileScreen({Key? key, required this.currentUser}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
            "${widget.currentUser.username}",
           style: const TextStyle(
              fontSize: 20.0, color: black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: () {
                  _openBottomModal(context);
                },
                child: const Icon(
                  Icons.menu,
                  color: black,
                )),
          )
        ],
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //ImportantInfo
              color: grey,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, bottom: 10.0, top: 10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: const BoxDecoration(
                            color: primaryColor, shape: BoxShape.circle),
                      ),
                    ),
                    const Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 25.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "0",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Followers",
                                        style: TextStyle(fontSize: 18.0),
                                      )
                                    ],
                                  )),
                              Column(
                                children: [
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Following",
                                    style: TextStyle(fontSize: 18.0),
                                  )
                                ],
                              )
                            ],
                          ),
                          //Boton para editar el perfil
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 5.0),
                          //   child: MaterialButton(
                          //       padding: EdgeInsets.symmetric(horizontal: 35.0),
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(10.0)),
                          //       color: secondaryColor,
                          //       child: Text("Edit profile"),
                          //       onPressed: () {}),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              //Bio
              color: grey,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Username",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Bio bio bio bio bio",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      height: 1.0,
                      color: black,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //Details
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              color: grey,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    Divider(
                      color: black,
                      height: 10.0,
                      thickness: 1.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(fontSize: 15.0),
                        ),
                        Text(
                          "Gamertag",
                          style: TextStyle(fontSize: 15.0),
                        ),
                        Text(
                          "Birth",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            //Posts
            IntrinsicHeight(
              child: Container(
                color: grey,
                margin: const EdgeInsets.only(bottom: 5.0),
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 8.0),
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: const BoxDecoration(
                                      color: primaryColor,
                                      shape: BoxShape.circle)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: black
                                                  .withOpacity(0.5),
                                              fontFamily: 'Century Gothic',
                                              fontSize: 15.0),
                                          children: const <TextSpan>[
                                        TextSpan(
                                            text: 'Username',
                                            style: TextStyle(
                                                color: black,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: ' @username · 1min')
                                      ])),
                                  const Text(
                                    "Description Description Description Description",
                                    style: TextStyle(color: black),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Icon(Icons.more_vert, color: black)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 48.0),
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.3,
                              color: secondaryColor,
                            ),
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.bubble_right,
                                        color: black,
                                      ),
                                      Text(" 123")
                                    ],
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.heart,
                                      color: black,
                                    ),
                                    Text(" 123")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _openBottomModal(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150.0,
            decoration: BoxDecoration(color: secondaryColor.withOpacity(0.8)),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "More Options",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: black),
                    ),
                  ),
                   const Divider(
                    thickness: 1,
                    height: 30.0,
                    color: black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditProfileScreen()));
                      },
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(fontSize: 15.0, color: black),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 30.0,
                    color: black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<AuthCubit>(context).loggedOut();
                        Navigator.pushNamedAndRemoveUntil(context, PageConst.signInPage, (route) => false);
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(fontSize: 15.0, color: black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
