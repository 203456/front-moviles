import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key, this.controller, this.title});

  final TextEditingController? controller;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            '$title',
            style: const TextStyle(color: black, fontSize: 15.0),
          ),
        ),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: black),
          decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: primaryColor,
                      width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: black),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              labelStyle: TextStyle(color: black)),
        ),
      ],
    );
  }
}
