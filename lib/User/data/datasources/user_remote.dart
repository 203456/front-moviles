import 'package:brilliant_app/User/domain/entities/user.dart';

abstract class UserRemoteDataSource {
  Future<void> createUser(UserEntity user);
}
