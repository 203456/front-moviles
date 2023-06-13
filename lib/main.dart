import 'package:brilliant_app/User/domain/usecases/get_single_usecase.dart';
import 'package:brilliant_app/User/presentation/cubit/User/get_single_user/get_single_user_cubit.dart';
import 'package:brilliant_app/User/presentation/cubit/User/user_cubit.dart';
import 'package:brilliant_app/User/presentation/page/credential/sign_in.dart';
import 'package:brilliant_app/User/presentation/page/credential/sign_up.dart';
import 'package:brilliant_app/User/presentation/page/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection_container.dart' as di;
import 'User/presentation/cubit/Auth/auth_cubit.dart';
import 'User/presentation/cubit/Credential/credential_cubit.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider( 
      providers: [
        BlocProvider(create: (_) => di.sl<AuthCubit>()..appStarted(context)),
        BlocProvider(create: (_) => di.sl<CredentialCubit>()),
        BlocProvider(create: (_) => di.sl<UserCubit>()),
        BlocProvider(create: (_) => di.sl<GetSingleUserCubit>()),
      ],
      child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'brillant',
      theme: ThemeData(fontFamily: 'Century Gothic'),
      initialRoute: "/",
      routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return SignUp ();

                } else{
                  return SignUp();
                }
              },
            );
          }
        },
      )
    );
  }
}
