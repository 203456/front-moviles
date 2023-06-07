import 'package:brilliant_app/User/domain/entities/user.dart';

abstract class UserRemoteDataSource {
  Future<void> createUser(UserEntity user);
  Future<String> getCurrentUid();

  Future<bool> isSignIn();
  Future<void> signInUser(UserEntity user);
  Future<void> signOut();

}
