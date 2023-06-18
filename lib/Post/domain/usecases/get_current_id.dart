import 'package:brilliant_app/Post/domain/repository/post_repository.dart';



class GetCurrentIdUseCase {
  final PostRepository repository;

  GetCurrentIdUseCase({required this.repository});

  Future<String> call() {
    return repository.getCurrentUid();
  }
}