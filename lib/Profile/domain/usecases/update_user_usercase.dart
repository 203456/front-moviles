import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/repositories/user_repository.dart';

class UpdateUserUseCase{
  final UserRepository userRepository;

  UpdateUserUseCase(this.userRepository);

  Future<void> excute(User user) async{
    return await userRepository.updateUser(user);
  }
}