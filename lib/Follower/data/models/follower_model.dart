import 'package:brilliant_app/Follower/domain/entities/follower.dart';

import '../../../User/domain/entities/user.dart';
class FollowersModel extends Followers{
  FollowersModel({
    required int id,
    required UserEntity follower,
    required UserEntity followed,

  }) : super(id: id, follower: follower, followed: followed );

  factory FollowersModel.fromJson(Map<String, dynamic> json) {
    return FollowersModel(
      id: json['id'],
      followed: json['followed'],
      follower: json['follower']

    );
  }

  factory FollowersModel.fromEntity(Followers followers) {
    return FollowersModel(
      id: followers.id,
      follower: followers.follower,
      followed: followers.followed
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'follower': follower,
      'followed': followed
    };
  }
}