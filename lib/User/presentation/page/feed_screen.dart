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
