import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/repositories/user_repository.dart';

class GetUserByIdUseCase{
  final UserRepository userRepository;

  GetUserByIdUseCase(this.userRepository);

  Future<User> excute(int id) async{
    return await userRepository.getUserById(id);
  }
}