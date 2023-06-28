import 'dart:io';
import 'package:brilliant_app/Post/domain/entity/post_entity.dart';
import 'package:brilliant_app/Post/presentation/cubit/post_cubit.dart';
import 'package:brilliant_app/Post/presentation/widgets/video_player_fullscreen.dart';
import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/usecases/upload_image_to_storage_usecase.dart';
import 'package:brilliant_app/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';
import 'package:brilliant_app/injection_container.dart' as di;

class UploadPostMainWidget extends StatefulWidget {
  final UserEntity currentUser;
  const UploadPostMainWidget({Key? key, required this.currentUser})
      : super(key: key);

  @override
  State<UploadPostMainWidget> createState() => _UploadPostMainWidgetState();
}

class _UploadPostMainWidgetState extends State<UploadPostMainWidget> {
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

  Future<void> _selectImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _isVideo = false;
        _mediaFile = File(pickedImage.path);
        _videoController?.dispose();
        _videoController = null;
      }
    });
  }

  Future<void> _selectVideo() async {
    final pickedVideo = await _picker.pickVideo(
        source: ImageSource.gallery, maxDuration: const Duration(seconds: 2));
    setState(() {
      if (pickedVideo != null) {
        _isVideo = true;
        _mediaFile = File(pickedVideo.path);
        _videoController?.dispose();
        _videoController = VideoPlayerController.file(File(pickedVideo.path))
          ..initialize().then((_) {
            _videoController!.play();
            setState(() {});
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(secondaryBlack),
                    ),
                    onPressed: _selectImage,
                    child: const Text('Select Image'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(secondaryBlack),
                    ),
                    onPressed: _selectVideo,
                    child: const Text('Select Video'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor),
                ),
                onPressed: () {
                  _submitImagePost();
                },
                child: const Text('Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _submitImagePost() {
    if (_mediaFile != null) {
      di
          .sl<UploadImageToStorageUseCase>()
          .call(_mediaFile!, true, "posts")
          .then((imageUrl) {
        _createSubmitPost(image: imageUrl);
      });
    }
  }

  _createSubmitPost({required String image}) {
    BlocProvider.of<PostCubit>(context).createPost(
      post: PostEntity(
          description: _postText.text,
          createAt: Timestamp.now(),
          creatorUid: widget.currentUser.uid,
          likes: const [],
          postId: const Uuid().v1(),
          postImageUrl: image,
          totalComments: 0,
          totalLikes: 0,
          username: widget.currentUser.username,
          userProfileUrl: widget.currentUser.profileUrl,
          postType: _isVideo ? 1 : 0),
    );
  }
}
