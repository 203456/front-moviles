import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository userRepository;

  GetUsersUseCase(this.userRepository);

  Future<List<UserEntity>> excute() async {
    return await userRepository.getUsers();
  }
}
