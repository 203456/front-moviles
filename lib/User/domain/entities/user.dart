import 'dart:io';

class UserEntity {
  final String? id;
  final String? name;
  final String? email;
  final String? username;
  final String? password;
  final String? location;
  final String? birth;
  final String? gamertag;
  final String? bio;

  final File? imageFile;

  UserEntity(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.password,
      this.location,
      this.birth,
      this.bio,
      this.gamertag,
      this.imageFile});
}
