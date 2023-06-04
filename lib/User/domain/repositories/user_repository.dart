import 'package:brilliant_app/User/domain/entities/user.dart';
abstract class UserRepository{
  Future<User>getUserById(int id);
  Future<void>deleteUserById(User user);
  Future<List<User>> getUsers();
  Future<void>createUser(User user);
  Future<void>updateUser(User user);


}