import 'dart:io';
import 'package:brilliant_app/Post/domain/entity/post_entity.dart';
import 'package:brilliant_app/Post/presentation/cubit/post_cubit.dart';
import 'package:brilliant_app/Post/presentation/page/post_screen.dart';
import 'package:brilliant_app/Post/presentation/widgets/video_player_fullscreen.dart';
import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/usecases/upload_image_to_storage_usecase.dart';
import 'package:brilliant_app/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';
import 'package:brilliant_app/injection_container.dart' as di;

class UploadPostMainWidget extends StatefulWidget {
  final UserEntity currentUser;
  const UploadPostMainWidget({Key? key, required this.currentUser}) : super(key: key);

  @override
  State<UploadPostMainWidget> createState() => _UploadPostMainWidgetState();
}

class _UploadPostMainWidgetState extends State<UploadPostMainWidget>  {
  final TextEditingController _postText = TextEditingController();
  File? _mediaFile;
  bool _isVideo = false;
  final ImagePicker _picker = ImagePicker();
  VideoPlayerController? _videoController;

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }


  Future<void> _selectMedia() async {
    final pickedMedia = await _picker.pickMedia();
    setState(() {
      if (pickedMedia != null) {
        setState(() {
          _isVideo = pickedMedia.path.contains('.mp4');
          _mediaFile = File(pickedMedia.path);
          if (_isVideo) {
            setState(() {
              _videoController =
              VideoPlayerController.file(File(pickedMedia.path))
                ..initialize().then((_) {
                  _videoController!.play();
                  setState(() {});
                });
            });
          }
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return _mediaFile == null? _uploadPostWidget() :Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'New Post',
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _postText,
                decoration: const InputDecoration(
                  hintText: "What's going on...",
                ),
              ),
              const SizedBox(height: 16.0),
              if (_isVideo)
                _videoController != null &&
                    _videoController!.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _videoController!.value.aspectRatio,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerFullScreen(
                            controller: _videoController!,
                          ),
                        ),
                      );
                    },
                    child: VideoPlayer(_videoController!),
                  ),
                )
                    : Container(),
              if (!_isVideo && _mediaFile != null)
                Image.file(
                  _mediaFile!,
                  height: 200,
                ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(secondaryBlack),
                ),
                onPressed: _selectMedia,
                child: Text('Select ${_isVideo ? 'Video' : 'Image'}'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(primaryColor),
                ),
                onPressed: () {
                  _submitPost();
                  // Lógica para publicar el post con los datos ingresados
                  // Puedes guardar el texto, la imagen y el video en tu base de datos o enviarlo a un servidor
                },
                child: const Text('Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _submitPost() {

    di.sl<UploadImageToStorageUseCase>().call(_mediaFile!, true, "posts").then((imageUrl) {
      _createSubmitPost(image: imageUrl);
    });
  }

  _createSubmitPost({required String image}) {
    BlocProvider.of<PostCubit>(context).createPost(
        post: PostEntity(
            description: _postText.text,
            createAt: Timestamp.now(),
            creatorUid: widget.currentUser.uid,
            likes: [],
            postId: Uuid().v1(),
            postImageUrl: image,
            totalComments: 0,
            totalLikes: 0,
            username: widget.currentUser.username,
            userProfileUrl: widget.currentUser.profileUrl
        )
    ).then((value) => _clear());
  }

  _clear() {
    setState(() {
      _postText.clear();
      _mediaFile = null;
    });
  }
  _uploadPostWidget() {
    return Scaffold(
        backgroundColor: black,

        body: Center(
          child: GestureDetector(
            onTap: _selectMedia,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(.3),
                  shape: BoxShape.circle
              ),
              child: const Center(
                child: Icon(Icons.upload, color: primaryColor, size: 40,),
              ),
            ),
          ),
        )
    );
  }
}