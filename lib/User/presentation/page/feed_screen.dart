import 'package:brilliant_app/Post/presentation/page/comment_screen.dart';
import 'package:brilliant_app/Post/presentation/page/edit_post_screen.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('BRILLANT',
            style: TextStyle(
                color: black,
                fontSize: 20,
                fontFamily: 'Century Gothic',
                letterSpacing: 20 * 0.36)),
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
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
                        InkWell(
                            onTap: () {
                              _openBottomModal(context);
                            },
                            child: const Icon(
                              Icons.more_vert,
                              color: black,
                            ))
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
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, Screens.commentScreen);
                                      },
                                      child: const Icon(
                                        CupertinoIcons.bubble_right,
                                        color: black,
                                      ),
                                    ),
                                    const Text(" 123")
                                  ],
                                ),
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite,
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
                      "Options",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: black),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 30.0,
                    color: secondaryBlack,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Screens.editPostScreen);
                      },
                      child: const Text(
                        "Edit Post",
                        style: TextStyle(fontSize: 15.0, color: black),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 30.0,
                    color: secondaryBlack,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        "Delete post",
                        style: TextStyle(fontSize: 15.0, color: Colors.red),
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
