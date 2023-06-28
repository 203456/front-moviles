
import 'package:brilliant_app/User/presentation/page/Home/widgets/single_card_post_widget.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brilliant_app/injection_container.dart' as di;
import '../../../Post/presentation/cubit/post_cubit.dart';
import 'package:brilliant_app/Post/domain/entity/post_entity.dart';

class FeedScreen extends StatefulWidget {
//  final String uid;

  const FeedScreen({Key? key}): super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int _currentIndex = 0;

  late PageController pageController;

/*  @override
  void initState() {
    BlocProvider.of<GetSingleUserCubit>(context).getSingleUser(uid: widget.uid);
    pageController = PageController();
    super.initState();
    }
     @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }*/

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('BRILLANT',
            style: TextStyle(
                color: black,
                fontSize: 20,
                fontFamily: 'Century Gothic',
                letterSpacing: 20 * 0.36)),
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
      ),
      body: BlocProvider(
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
              return postState.posts.isEmpty? _noPostsYetWidget() : ListView.builder(
                itemCount: postState.posts.length,
                itemBuilder: (context, index) {
                  final post = postState.posts[index];
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
    );
    }
    _noPostsYetWidget() {
    return const Center(child: Text("No Posts Yet", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),);
  }

  }
