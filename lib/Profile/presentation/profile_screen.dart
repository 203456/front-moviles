import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Username',
          style: TextStyle(
              fontSize: 20.0, color: black, fontWeight: FontWeight.bold),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.menu, color: black),
          )
        ],
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
      ),
      body: Column(
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
                  Expanded(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: MaterialButton(
                              padding: EdgeInsets.symmetric(horizontal: 35.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              color: secondaryColor,
                              child: Text("Edit profile"),
                              onPressed: () {}),
                        )
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
                  Text(
                    "Username",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Bio bio bio bio bio",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    height: 1.0,
                    color: black,
                  ),
                ],
              ),
            ),
          ),
          Container(
            //Details
            margin: EdgeInsets.symmetric(vertical: 10.0),
            color: grey,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Details",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
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
                                            color:
                                                secondaryBlack.withOpacity(0.5),
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
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            color: secondaryColor,
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
