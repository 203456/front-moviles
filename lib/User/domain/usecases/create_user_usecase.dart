import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository userRepository;

  CreateUserUseCase(this.userRepository);

  Future<void> excute(UserEntity user) async {
    return await userRepository.createUser(user);
  }
}
