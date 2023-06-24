import 'package:brilliant_app/Post/presentation/cubit/post_cubit.dart';
import 'package:brilliant_app/User/presentation/widgets/search_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:brilliant_app/injection_container.dart' as di;

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(
          create: (context) => di.sl<PostCubit>(),
        ),
      ],
      child: const SearchMainWidget(),
    );
  }
}