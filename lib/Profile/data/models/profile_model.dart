import 'package:brilliant_app/Profile/domain/entities/profile.dart';

class ProfileModel extends Profile {
  ProfileModel(
      {required int id,
      required String name,
      required String username,
      required String location,
      required String birth,
      required String bio,
      required List<ListFollowers> followers,
      required List<ListFollowing> following})
      : super(
            id: id,
            name: name,
            username: username,
            location: location,
            birth: birth,
            bio: bio,
            followers: followers,
            following: following);

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        id: json['id'],
        name: json['name'],
        username: json['userename'],
        location: json['location'],
        birth: json['birth'],
        bio: json['bio'],
        followers: json['followers'],
        following: json['following']);
  }

  factory ProfileModel.fromEntity(Profile profile) {
    return ProfileModel(
        id: profile.id,
        name: profile.name,
        username: profile.username,
        location: profile.location,
        birth: profile.birth,
        bio: profile.bio,
        followers: [],
        following: []);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'location': location,
      'birth': birth,
      'followers': followers,
      'following': following
    };
  }
}
