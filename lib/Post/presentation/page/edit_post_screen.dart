import 'package:brilliant_app/Profile/presentation/widgets/edit_profile_form.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPostScreen extends StatelessWidget {
  const EditPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Edit Post',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: black),
        ),
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.done, color: primaryColor, size: 30.0),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: const BoxDecoration(
                        color: secondaryColor, shape: BoxShape.circle),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Username",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(color: secondaryColor),
                ),
                const EditProfileForm(
                  title: "Write a description",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
