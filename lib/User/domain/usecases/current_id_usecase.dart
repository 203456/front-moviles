

import 'package:brilliant_app/User/domain/repositories/user_repository.dart';

class GetCurrentIdUseCase {
  final UserRepository repository;

  GetCurrentIdUseCase({required this.repository});

  Future<String> call() {
    return repository.getCurrentid();
  }
}