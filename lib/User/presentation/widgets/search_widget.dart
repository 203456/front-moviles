import 'package:brilliant_app/const.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  const SearchWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: secondaryBlack),
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: secondaryBlack,
            ),
            hintText: "Search",
            hintStyle: TextStyle(color: secondaryBlack, fontSize: 15)),
      ),
    );
  }
}
