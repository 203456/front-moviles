import 'package:brilliant_app/Follower/domain/entities/follower.dart';
abstract class FollowersRepository{
  Future<Followers>follow(int id);
  Future<Followers>unfollow(int id);



}