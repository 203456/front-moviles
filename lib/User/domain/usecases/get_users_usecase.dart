
import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase({required this.repository});

  Stream<List<UserEntity>>call(UserEntity userEntity) {
    return repository.getUsers(userEntity);
  }
}