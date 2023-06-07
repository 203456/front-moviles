import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/repositories/user_repository.dart';

class DeleteUserUseCase {
  final UserRepository userRepository;

  DeleteUserUseCase(this.userRepository);

  Future<void> excute(UserEntity user) async {
    return await userRepository.deleteUserById(user);
  }
}
