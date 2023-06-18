import 'dart:io';

import 'package:brilliant_app/Profile/presentation/widgets/edit_profile_form.dart';
import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/usecases/upload_image_to_storage_usecase.dart';
import 'package:brilliant_app/User/presentation/cubit/User/user_cubit.dart';
import 'package:brilliant_app/const.dart';
import 'package:brilliant_app/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:brilliant_app/injection_container.dart' as di;

class EditProfileScreen extends StatefulWidget {
  final UserEntity currentUser;
  const EditProfileScreen({Key? key, required this.currentUser}): super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  TextEditingController? _nameController;
  TextEditingController? _usernameController;
  TextEditingController? _websiteController;
  TextEditingController? _bioController;
  TextEditingController? _locationController;
  TextEditingController? _birthController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.currentUser.name);
    _usernameController = TextEditingController(text: widget.currentUser.username);
    _websiteController = TextEditingController(text: widget.currentUser.website);
    _bioController = TextEditingController(text: widget.currentUser.bio);
    _locationController = TextEditingController(text: widget.currentUser.location);
    _birthController = TextEditingController(text: widget.currentUser.birth);

    super.initState();
  }

  bool _isUpdating = false;

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
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: _updateUserProfileData,
              child: const  Icon(
                Icons.done,
                color: primaryColor,
                size: 32.0,
              ),

            )
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
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: profileWidget(imageUrl: widget.currentUser.profileUrl, image: _image),
                      ),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: selectImage,
                  child: const Text(
                    "Change profile photo",
                    style: TextStyle(fontSize: 18.0, color: primaryColor),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: EditProfileForm(
                  title: "Name",
                  controller: _nameController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: EditProfileForm(
                  title: "Username",
                  controller: _usernameController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: EditProfileForm(
                  title: "Bio",
                  controller: _bioController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: EditProfileForm(
                  title: "Link (Chess.com)",
                  controller: _websiteController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: EditProfileForm(
                  title: "Location",
                  controller: _locationController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: EditProfileForm(
                  title: "Birth",
                  controller: _birthController,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  _updateUserProfileData() {
    setState(() => _isUpdating = true);
    if (_image == null) {
      _updateUserProfile("");
    } else {
      di.sl<UploadImageToStorageUseCase>().call(_image!, false, "profileImages").then((profileUrl) {
        _updateUserProfile(profileUrl);
      });
    }
  }

  _updateUserProfile( String profileUrl){

    BlocProvider.of<UserCubit>(context).updateUser(
        user: UserEntity(
            uid: widget.currentUser.uid,
            username: _usernameController!.text,
            bio: _bioController!.text,
            website: _websiteController!.text,
            name: _nameController!.text,
            profileUrl: profileUrl
        )
    ).then((value) => _clear());
  }

  _clear() {
    setState(() {
      _isUpdating = false;
      _usernameController!.clear();
      _bioController!.clear();
      _websiteController!.clear();
      _nameController!.clear();
    });
    Navigator.pop(context);
  }
}

