import 'package:brilliant_app/Post/domain/entity/post_entity.dart';
import 'package:brilliant_app/Post/presentation/cubit/post_cubit.dart';
import 'package:brilliant_app/User/presentation/page/Home/widgets/single_card_post_widget.dart';

import 'package:brilliant_app/const.dart';
import 'package:brilliant_app/profile_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../User/domain/entities/user.dart';
import 'package:brilliant_app/injection_container.dart' as di;

  class ProfileScreen extends StatefulWidget {

    final UserEntity currentUser;
    const ProfileScreen({Key? key, required this.currentUser}) : super(key: key);
    @override
    State<ProfileScreen> createState() => _ProfileScreenState();
  }

  class _ProfileScreenState extends State<ProfileScreen> {  
      String _currentUid = "";
      final Axis _scrollDirection = Axis.vertical;

    @override
    
    void initState() {
      BlocProvider.of<PostCubit>(context).getPosts(post: PostEntity());
    super.initState();
  }

    bool _isLikeAnimating = false;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text(
              "${widget.currentUser.username}",
             style: const TextStyle(
                fontSize: 20.0, color: black, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                  onTap: () {
                   // _openBottomModal(context);
                  },
                  child: const Icon(
                    Icons.menu,
                    color: black,
                  )),
            )
          ],
          backgroundColor: backgroundColor,
          shadowColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //ImportantInfo
                color: grey,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, bottom: 10.0, top: 10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Container(
                          height: 130,
                          width: 130,

                          decoration: const BoxDecoration(
                              color: primaryColor, shape: BoxShape.circle),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: profileWidget(imageUrl: widget.currentUser.profileUrl)),
                        ),
                      ),
                      const Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(right: 25.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "0",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Followers",
                                          style: TextStyle(fontSize: 18.0),
                                        )
                                      ],
                                    )),
                                Column(
                                  children: [
                                    Text(
                                      "0",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Following",
                                      style: TextStyle(fontSize: 18.0),
                                    )
                                  ],
                                )
                              ],
                            ),
                            //Boton para editar el perfil
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(vertical: 5.0),
                            //   child: MaterialButton(
                            //       padding: EdgeInsets.symmetric(horizontal: 35.0),
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(10.0)),
                            //       color: secondaryColor,
                            //       child: Text("Edit profile"),
                            //       onPressed: () {}),
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                    //Bio
                    color: grey,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.currentUser.username}",
                            style: const TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${widget.currentUser.bio}",
                            style: const TextStyle(fontSize: 15.0),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            height: 1.0,
                            color: black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    //Details
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    color: grey,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          const Divider(
                            color: black,
                            height: 10.0,
                            thickness: 1.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( 
                                "${widget.currentUser.location == null? "": widget.currentUser.location}",
                                style: TextStyle(fontSize: 15.0),
                              ),
                              Text(
                                "${widget.currentUser.website == null? "": widget.currentUser.website}",
                                style: TextStyle(fontSize: 15.0),
                              ),
                              Text(
                                "${widget.currentUser.birth  == null? "": widget.currentUser.birth}",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ],
                          ),
                          BlocProvider(
                            create: (context) => di.sl<PostCubit>()..getPosts(post: PostEntity()),
                            child: BlocProvider<PostCubit>(
                              create: (context) =>
                              di.sl<PostCubit>()
                                ..getPosts(post: PostEntity()),
                              child: BlocBuilder<PostCubit, PostState>(
                                builder: (context, postState) {
                                  if (postState is PostLoading) {
                                    return Center(child: CircularProgressIndicator(),);
                                  }
                                  if (postState is PostFailure) {
                                    toast("Some Failure occured while creating the post");
                                  }
                                  if (postState is PostLoaded) {
                                    
                                    final posts = postState.posts.where((post) => post.creatorUid == widget.currentUser.uid).toList();

                                    
                                    return postState.posts.isEmpty? _noPostsYetWidget() : ListView.separated(
                                      physics: const AlwaysScrollableScrollPhysics(),
                                      scrollDirection: _scrollDirection,
                                      shrinkWrap: true,
                                      primary: true,
                                      separatorBuilder: (_, __) => const Divider(),
                                      itemCount: posts.length,
                                      itemBuilder: (context, index) {
                                     
                                        final post = posts[index];

                                        return BlocProvider(
                                          create: (context) => di.sl<PostCubit>(),
                                          child: SingleCardPostWidget(post: post),
                                        );
                                      },
                                    );
                                }
                                return Center(child: CircularProgressIndicator(),);
                                
                              },
                              )
                            ))
                        ],
                      ),
                    ),
                  ),
                  
                //Posts
                Container(
                  
                )
            ]
        
          ),
        ),
      );
    } 
     _noPostsYetWidget() {
    return const Center(child: Text("No Posts Yet", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),);
  }
  
 

  }
