import 'dart:io';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? email;
  final String? username;
  final String? password;
  final String? location;
  final String? birth;
  final String? gamertag;
  final String? bio;
  final String? status;

  final File? imageFile;

  UserEntity(
      {this.uid,
      this.name,
      this.email,
      this.username,
      this.password,
      this.location,
      this.birth,
      this.bio,
      this.gamertag,
      this.status,
      this.imageFile});

  @override
  List<Object?> get props =>[
    uid,
    name,
    email,
    username,
    password,
    location,
    birth,
    bio,
    gamertag,
    status,
    imageFile,

  ];
}
