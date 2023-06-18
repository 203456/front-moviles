import 'package:brilliant_app/Post/domain/entity/post_entity.dart';
import 'package:brilliant_app/Post/domain/repository/post_repository.dart';

import '../datasources/post_remote_datasource.dart';

class  PostRepositoryImpl implements PostRepository{
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({ required this.remoteDataSource });


  @override
  Future<void> createPost(PostEntity post) async => remoteDataSource.createPost(post);
  @override
  Future<void> deletePost(PostEntity post) async => remoteDataSource.deletePost(post);

  @override
  Future<void> likePost(PostEntity post) async => remoteDataSource.likePost(post);

  @override
  Stream<List<PostEntity>> readPosts(PostEntity post) => remoteDataSource.readPosts(post);

  @override
  Future<void> updatePost(PostEntity post) async => remoteDataSource.updatePost(post);

  @override
  Stream<List<PostEntity>> readSinglePost(String postId) => remoteDataSource.readSinglePost(postId);
  @override
  Future<String> getCurrentUid() async => remoteDataSource.getCurrentId();

}