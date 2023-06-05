import 'package:brilliant_app/User/presentation/page/credential/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'brillant',
      theme: ThemeData(fontFamily: 'Century Gothic'),
      home: const SingIn(),
    );
  }
}
