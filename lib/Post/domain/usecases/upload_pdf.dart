import 'package:brilliant_app/Post/domain/repository/post_repository.dart';



class UploadPDF{
  final PostRepository repository;

  UploadPDF({required this.repository});

  Future<void> call() {
    return repository.uploadPDF();
  }
}