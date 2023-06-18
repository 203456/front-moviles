
import 'dart:io';

import 'package:brilliant_app/User/domain/repositories/user_repository.dart';


class UploadImageToStorageUseCase {
  final UserRepository repository;

  UploadImageToStorageUseCase({required this.repository});

  Future<String> call(File file, bool isPost, String childName) {
    return repository.uploadImageToStorage(file, isPost, childName);
  }
}