

import 'package:brilliant_app/User/domain/repositories/user_repository.dart';

class IsSignInUseCase {

  final UserRepository repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call()async{
    return repository.isSignIn();
  }
}