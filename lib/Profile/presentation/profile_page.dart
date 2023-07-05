

import 'package:brilliant_app/Post/presentation/cubit/post_cubit.dart';
import 'package:brilliant_app/Profile/presentation/widgets/profile_screen.dart';
import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/injection_container.dart' as di;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget{
  final UserEntity currentUser;

  const ProfilePage({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<PostCubit>(),
      child: ProfileScreen(currentUser: currentUser,),
    );
  }
}