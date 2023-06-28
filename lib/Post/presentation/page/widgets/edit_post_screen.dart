import 'dart:io';

import 'package:brilliant_app/Post/domain/entity/post_entity.dart';
import 'package:brilliant_app/Post/presentation/cubit/post_cubit.dart';
import 'package:brilliant_app/Profile/presentation/widgets/edit_profile_form.dart';
import 'package:brilliant_app/User/domain/usecases/upload_image_to_storage_usecase.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import  'package:brilliant_app/injection_container.dart' as di;

import '../../../../profile_widget.dart';

class EditPostScreen extends StatefulWidget {
  final PostEntity post;
  const EditPostScreen({Key? key, required this.post}) : super(key: key);

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
    TextEditingController? _descriptionController;

  @override
  void initState() {
    _descriptionController = TextEditingController(text: widget.post.description);
    super.initState();
  }

  @override
  void dispose() {
    _descriptionController!.dispose();
    super.dispose();
  }

  File? _image;
  bool? _uploading = false;
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
          'Edit Post',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: black),
        ),
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: black),
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(onTap: _updatePost, child: Icon(Icons.done, color: primaryColor, size: 30.0)),
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
                    child: profileWidget(imageUrl: widget.post.userProfileUrl),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "${widget.post.username}",
                    style: const  TextStyle(
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
                  child: profileWidget(
                        imageUrl: widget.post.postImageUrl,
                        image: _image,)
                ),
                 EditProfileForm(
                  title: "Write a description",
                  controller: _descriptionController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
    _updatePost() {
    setState(() {
      _uploading = true;
    });
    if (_image == null) {
      _submitUpdatePost(image: widget.post.postImageUrl!);
    } else {
      di.sl<UploadImageToStorageUseCase>().call(_image!, true, "posts").then((imageUrl) {
        _submitUpdatePost(image: imageUrl);
      });
    }
  }


  _submitUpdatePost({required String image}) {
    BlocProvider.of<PostCubit>(context).updatePost(
        post: PostEntity(
            creatorUid: widget.post.creatorUid,
            postId: widget.post.postId,
            postImageUrl: image,
            description: _descriptionController!.text
        )
    ).then((value) => _clear());
  }

  _clear() {
    setState(() {
      _descriptionController!.clear();
      Navigator.pop(context);
      _uploading = false;
    });
  }

}