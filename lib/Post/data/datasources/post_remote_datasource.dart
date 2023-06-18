import 'dart:io';

import 'package:brilliant_app/Post/domain/entity/post_entity.dart';


abstract class PostRemoteDataSource{
  Future<String> getCurrentId();

  // Post Features
  Future<void> createPost(PostEntity post);
  Stream<List<PostEntity>> readPosts(PostEntity post);
  Stream<List<PostEntity>> readSinglePost(String postId);
  Future<void> updatePost(PostEntity post);
  Future<void> deletePost(PostEntity post);
  Future<void> likePost(PostEntity post);
}