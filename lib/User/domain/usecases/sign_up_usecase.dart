
import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/repositories/user_repository.dart';



class SignUpUseCase {

  final UserRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(UserEntity user)async{
    return repository.signUpUser(user);
  }
}