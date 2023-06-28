import 'package:brilliant_app/Post/presentation/cubit/post_cubit.dart';
import 'package:brilliant_app/Post/presentation/page/widgets/like_animation_widget.dart';
import 'package:brilliant_app/User/domain/usecases/current_id_usecase.dart';
import 'package:brilliant_app/User/presentation/page/Home/widgets/video_player_widget.dart';
import 'package:brilliant_app/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../Post/domain/entity/post_entity.dart';
import '../../../../../const.dart';
import 'package:brilliant_app/injection_container.dart' as di;

class SingleCardPostWidget extends StatefulWidget {
  final PostEntity post;
  const SingleCardPostWidget({Key? key, required this.post}) : super(key: key);

  @override
  State<SingleCardPostWidget> createState() => _SingleCardPostWidgetState();
}

class _SingleCardPostWidgetState extends State<SingleCardPostWidget> {
  String _currentUid = "";
  @override
  void initState() {
    di.sl<GetCurrentIdUseCase>().call().then((value) {
      setState(() {
        _currentUid = value;
      });
    });
    super.initState();
  }

  bool _isLikeAnimating = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.5),
      child: IntrinsicHeight(
        child: Container(
          color: grey,
          margin: const EdgeInsets.only(bottom: 5.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Screens.singleUserProfilePage,
                            arguments: widget.post.creatorUid);
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            width: 40,
                            height: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: profileWidget(
                                  imageUrl: "${widget.post.userProfileUrl}"),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color:
                                              secondaryBlack.withOpacity(0.5),
                                          fontFamily: 'Century Gothic',
                                          fontSize: 15.0),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: "${widget.post.username}",
                                        style: const TextStyle(
                                            color: black,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text:
                                            ' @${widget.post.username} · ${formatTimeDifference(widget.post.createAt!.toDate())}')
                                  ])),
                              Text(
                                "${widget.post.description}",
                                style: const TextStyle(color: black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    widget.post.creatorUid == _currentUid
                        ? GestureDetector(
                            onTap: () {
                              _openBottomModalSheet(context, widget.post);
                            },
                            child: const Icon(
                              Icons.more_vert,
                              color: primaryColor,
                            ))
                        : const Icon(
                            Icons.more_vert,
                            color: secondaryBlack,
                          )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48.0),
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      width: double.infinity,
                      // height: MediaQuery.of(context).size.height * 0.35,
                      color: widget.post.postType == 1 ? grey : black,
                      child: GestureDetector(
                        onDoubleTap: () {
                          _likePost();
                          setState(() {
                            _isLikeAnimating = true;
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.30,
                              child: widget.post.postType == 0
                                  ? profileWidget(
                                      imageUrl: "${widget.post.postImageUrl}")
                                  : VideoPlayerWidget(
                                      videoUrl: widget.post.postImageUrl!),
                            ),
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: _isLikeAnimating ? 1 : 0,
                              child: LikeAnimationWidget(
                                  duration: const Duration(milliseconds: 200),
                                  isLikeAnimating: _isLikeAnimating,
                                  onLikeFinish: () {
                                    setState(() {
                                      _isLikeAnimating = false;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.favorite,
                                    size: 100,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Screens.updatePostPage,
                                      arguments: (
                                        uid: _currentUid,
                                        postId: widget.post.postId
                                      ));
                                  //Navigator.push(context, MaterialPageRoute(builder: (context) => CommentPage()));
                                },
                                child: const Icon(
                                  CupertinoIcons.bubble_right,
                                  color: black,
                                ),
                              ),
                              Text(" ${widget.post.totalComments}")
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: _likePost,
                                child: Icon(
                                  widget.post.likes!.contains(_currentUid)
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color:
                                      widget.post.likes!.contains(_currentUid)
                                          ? primaryColor
                                          : black,
                                )),
                            Text(" ${widget.post.totalLikes}")
                          ],
                        ),
                      ],
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatTimeDifference(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}seg';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}min';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else if (difference.inDays < 30) {
      return '${difference.inDays}d';
    } else if (difference.inDays < 365) {
      final formatter = DateFormat('d MMM');
      return '${formatter.format(date)}';
    } else {
      final formatter = DateFormat('d MMM yyyy');
      return '${formatter.format(date)}';
    }
  }

  _openBottomModalSheet(BuildContext context, PostEntity post) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            decoration: BoxDecoration(color: secondaryColor.withOpacity(.8)),
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "More Options",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: primaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: _deletePost,
                        child: const Text(
                          "Delete Post",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: primaryColor),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, Screens.updatePostPage,
                          //     arguments: post);
                        },
                        child: const Text(
                          "Update Post",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _deletePost() {
    BlocProvider.of<PostCubit>(context)
        .deletePost(post: PostEntity(postId: widget.post.postId));
  }

  _likePost() {
    BlocProvider.of<PostCubit>(context)
        .likePost(post: PostEntity(postId: widget.post.postId));
  }
}
