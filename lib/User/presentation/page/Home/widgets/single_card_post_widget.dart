import 'package:brilliant_app/Post/presentation/cubit/post_cubit.dart';
import 'package:brilliant_app/Post/presentation/page/widgets/like_animation_widget.dart';
import 'package:brilliant_app/User/domain/usecases/current_id_usecase.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Screens.singleUserProfilePage, arguments: widget.post.creatorUid);
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: profileWidget(imageUrl: "${widget.post.userProfileUrl}"),
                        ),
                      ),
                   
                      Text("${widget.post.username}", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                widget.post.creatorUid == _currentUid ?GestureDetector(onTap: () {
                  _openBottomModalSheet(context, widget.post);
                },child: Icon(Icons.more_vert, color: primaryColor,)) : Container(width: 0, height: 0,)
              ],
            ),
    
            GestureDetector(
              onDoubleTap: () {
                _likePost();
                setState(() {
                  _isLikeAnimating = true;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: profileWidget(imageUrl: "${widget.post.postImageUrl}"),
                  ),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: _isLikeAnimating? 1 : 0,
                    child: LikeAnimationWidget(
                     duration: Duration(milliseconds: 200),
                    isLikeAnimating: _isLikeAnimating,
                    onLikeFinish: () {
                       setState(() {
                         _isLikeAnimating = false;
                       });
                    },
                    child: Icon(Icons.favorite, size: 100, color: Colors.white,)),
                  ),
                ],
              ),
            ),
    
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(onTap: _likePost,child: Icon(widget.post.likes!.contains(_currentUid)?Icons.favorite : Icons.favorite_outline, color: widget.post.likes!.contains(_currentUid)? Colors.red : primaryColor,)),
          
                    GestureDetector(onTap: () {
                      Navigator.pushNamed(context, Screens.updatePostPage, arguments: (uid: _currentUid, postId: widget.post.postId));
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => CommentPage()));
                    },child: Icon(Icons.message, color: primaryColor,)),
      
                   
                  ],
                ),
        

              ],
            ),

            Text("${widget.post.totalLikes} likes", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),

            Row(
              children: [
                Text("${widget.post.username}", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),

                Text("${widget.post.description}", style: TextStyle(color: primaryColor),),
              ],
            ),
         
            GestureDetector(onTap: () {
              Navigator.pushNamed(context, Screens.updatePostPage, arguments: (uid: _currentUid, postId: widget.post.postId));

            },child: Text("View all ${widget.post.totalComments} comments", style: TextStyle(color: black),)),

            Text("${DateFormat("dd/MMM/yyy").format(widget.post.createAt!.toDate())}", style: TextStyle(color: black),),

          ],
        ),
      );
  }_openBottomModalSheet(BuildContext context, PostEntity post) {
    return showModalBottomSheet(context: context, builder: (context) {
      return Container(
            height: 150,
            decoration: BoxDecoration(color: secondaryColor.withOpacity(.8)),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "More Options",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: primaryColor),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: _deletePost,
                        child: Text(
                          "Delete Post",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: primaryColor),
                        ),
                      ),
                    ),
             
                    Divider(
                      thickness: 1,
                      color: secondaryColor,
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Screens.updatePostPage, arguments: post);

                          // Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePostPage()));

                        },
                        child: Text(
                          "Update Post",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: primaryColor),
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
    BlocProvider.of<PostCubit>(context).deletePost(post: PostEntity(postId: widget.post.postId));
  }

  _likePost() {
    BlocProvider.of<PostCubit>(context).likePost(post: PostEntity(
      postId: widget.post.postId
    ));
  }
}