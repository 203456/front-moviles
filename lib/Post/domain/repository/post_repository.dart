import 'dart:io';

import 'package:brilliant_app/Post/domain/entity/post_entity.dart';

abstract class PostRepository{

  // Post Features
  Future<void> createPost(PostEntity post);
  Stream<List<PostEntity>> readPosts(PostEntity post);
  Future<void> updatePost(PostEntity post);
  Future<void> deletePost(PostEntity post);
  Future<void> likePost(PostEntity post);
  Stream<List<PostEntity>> readSinglePost(String postId);
  Future<void> uploadPDF();
  Future<String> getCurrentUid();


}
