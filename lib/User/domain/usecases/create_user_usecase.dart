
import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository repository;

  CreateUserUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.createUser(user);
  }
}