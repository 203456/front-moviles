import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          iconTheme: const IconThemeData(color: black),
          title: const Text(
            'Comments',
            style: TextStyle(color: black),
          ),
          shadowColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: const BoxDecoration(
                              color: primaryColor, shape: BoxShape.circle)),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Username",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: black),
                            ),
                            SizedBox(height: 10),
                            Text(
                                'Description Description Description Description'),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 20.0,
              thickness: 1.0,
              color: secondaryBlack.withOpacity(0.5),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                          color: black, shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: black),
                                      children: <TextSpan>[
                                    const TextSpan(text: "Username"),
                                    TextSpan(
                                        text: "  1min",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: secondaryBlack
                                                .withOpacity(0.5))),
                                  ])),
                              Icon(
                                Icons.favorite_outline,
                                size: 20.0,
                                color: secondaryBlack.withOpacity(0.7),
                              )
                            ],
                          ),
                          const Text(
                              'Comment Comment Comment Comment Comment Comment Comment Comment Comment Comment'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            _commentSection()
          ],
        ));
  }

  _commentSection() {
    return Container(
      width: double.infinity,
      height: 60.0,
      color: grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(children: [
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
                color: green, borderRadius: BorderRadius.circular(20.0)),
          ),
          const SizedBox(width: 10.0),
          Expanded(
              child: TextFormField(
            style: const TextStyle(color: black),
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Post your comment...',
                hintStyle: TextStyle(color: black)),
          )),
          const Icon(
            Icons.send,
            color: green,
          )
        ]),
      ),
    );
  }
}
