import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/repositories/user_repository.dart';

class SignInUseCase {

  final UserRepository repository;

  SignInUseCase({required this.repository});

  Future<void> call(UserEntity user)async{
    return repository.signInUser(user);
  }
}