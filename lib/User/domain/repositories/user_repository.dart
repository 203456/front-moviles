import 'dart:io';

import 'package:brilliant_app/User/domain/entities/user.dart';

abstract class UserRepository {
  //Credential
  Future<void> signInUser(UserEntity user);
  Future<void> signUpUser(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();

  //User
  Future<String> getCurrentid();
  Future<void> createUser(UserEntity user);
  Stream<List<UserEntity>> getUsers(UserEntity user);
  Future<void> updateUser(UserEntity user);
  Stream<List<UserEntity>> getSingleUser(String uid);

  Future<String> uploadImageToStorage(File? file, bool isPost, String childName);

}
