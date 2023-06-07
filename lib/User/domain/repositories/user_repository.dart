import 'package:brilliant_app/User/domain/entities/user.dart';

abstract class UserRepository {
  Future<UserEntity> getUserById(int id);
  Future<void> deleteUserById(UserEntity user);
  Future<List<UserEntity>> getUsers();
  Future<void> createUser(UserEntity user);
  Future<void> updateUser(UserEntity user);
}
