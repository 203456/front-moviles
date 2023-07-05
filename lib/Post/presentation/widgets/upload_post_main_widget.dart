import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:brilliant_app/Post/domain/entity/post_entity.dart';
import 'package:brilliant_app/Post/presentation/cubit/post_cubit.dart';
import 'package:brilliant_app/Post/presentation/widgets/video_player_fullscreen.dart';
import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/usecases/upload_image_to_storage_usecase.dart';
import 'package:brilliant_app/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
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
  final player = AudioPlayer();
  File? _mediaFile;

  int postType = 0;
  Duration duration= Duration.zero;
  Duration position= Duration.zero;
  bool isPlaying=false;
  bool _isAudio = false;
  bool _isVideo = false;
  bool _isPDF = false;
  final ImagePicker _picker = ImagePicker();
  VideoPlayerController? _videoController;

  String formatTime(int seconds){
    return'${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }



  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }
  @override
  void initState() {

    super.initState();
      player.onPlayerStateChanged.listen((state) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      });
      player.onDurationChanged.listen((newDuration) {
        setState(() {
          duration = newDuration;
        });
        
      });
      player.onPositionChanged.listen((newPosition) { 
        setState(() {
          position = newPosition;
        });
      });
    }
 Future<void> _selectPDF() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [ 'pdf'],
      );
           setState(() {
            if (result != null) {
              PlatformFile file = result.files.single;
              _isPDF = true;
              postType = 3;
              _mediaFile = File(file.path!);
              _videoController?.dispose();
              _videoController = null;
            }else {
              print('No se ha seleccionado ninguna imagen.');
            }
          }); 
    } catch (e) {
      toast("Se produjo un error: $e");
    }

    
  }

   Future<void> _selectAudio() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [ 'wav', 'mp4', 'gif', 'mp3', ],
      );
           setState(() {
            if (result != null) {
              PlatformFile file = result.files.single;
              _isAudio = true;
              postType = 2;
              _mediaFile = File(file.path!);
              _videoController?.dispose();
              _videoController = null;
            }else {
              print('No se ha seleccionado ninguna imagen.');
            }
          }); 
    } catch (e) {
      toast("Se produjo un error: $e");
    }

    
  }


  Future<void> _selectImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _isVideo = false;
        postType = 0;
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
        postType = 1;
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
              if (!_isVideo &&  _mediaFile != null && !_isAudio && !_isPDF) 
                Image.file(
                  _mediaFile!,
                  height: 200,
                ),
              
              if(_isAudio )
                Column(
                  
                  children: [
                                
                    Slider(
                      min: 0, 
                      max: duration.inSeconds.toDouble(), 
                      value: position.inSeconds.toDouble() , 
                      onChanged: (value){
                        final position=Duration(seconds: value.toInt());
                        player.seek(position);
                        player.resume();
                      
                      },
                    ),

                      
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatTime(position.inSeconds)),
                          Text(formatTime((duration-position).inSeconds))


                      ]),

                    ),
                      
                    
                  ],
                ),
              
              if(_isPDF )
              Text("PDF"),
              

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
                 
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(secondaryBlack),
                    ),
                    onPressed: _selectPDF,
                    child: const Text('Select PDF'),
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
          postType: postType),
    );
  }
}
