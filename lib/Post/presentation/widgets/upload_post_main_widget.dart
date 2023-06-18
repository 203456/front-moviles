import 'dart:io';
import 'package:brilliant_app/Post/presentation/widgets/video_player_fullscreen.dart';
import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadPostMainWidget extends StatefulWidget {
  final UserEntity currentUser;
  const UploadPostMainWidget({Key? key, required this.currentUser}) : super(key: key);

  @override
  _UploadPostMainWidgetState createState() => _UploadPostMainWidgetState();
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
}