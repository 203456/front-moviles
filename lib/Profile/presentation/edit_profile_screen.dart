import 'package:brilliant_app/Profile/presentation/widgets/edit_profile_form.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: black),
        ),
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.close,
            size: 32.0,
            color: black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.done,
              color: primaryColor,
              size: 32.0,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(75.0)
                        // shape: BoxShape.circle
                        ),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Change profile photo",
                    style: TextStyle(fontSize: 18.0, color: primaryColor),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: EditProfileForm(
                  title: "Name",
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: EditProfileForm(
                  title: "Username",
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: EditProfileForm(
                  title: "Bio",
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: EditProfileForm(
                  title: "Link (Chess.com)",
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: EditProfileForm(
                  title: "Location",
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: EditProfileForm(
                  title: "Birth",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
