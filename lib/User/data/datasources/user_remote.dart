import 'dart:io';

import 'package:brilliant_app/User/domain/entities/user.dart';

abstract class UserRemoteDataSource {
  Future<void> createUser(UserEntity user);
  Future<String> getCurrentUid();

  Future<bool> isSignIn();
  Future<void> signOut();
  Future<void> signInUser(UserEntity user);
  Future<void> signUpUser(UserEntity user);
  Future<String> uploadImageToStorage(File? file, bool isPost, String childName);
}
