import 'package:brilliant_app/Post/domain/entity/post_entity.dart';
import 'package:brilliant_app/Post/presentation/cubit/post_cubit.dart';
import 'package:brilliant_app/Post/presentation/page/widgets/edit_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:brilliant_app/injection_container.dart' as di;

class UpdatePostPage extends StatelessWidget {
  final PostEntity post;

  const UpdatePostPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostCubit>(
      create: (context) => di.sl<PostCubit>(),
      child: EditPostScreen(post: post,),
    );
  }
}