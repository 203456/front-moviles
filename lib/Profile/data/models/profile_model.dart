import 'package:brilliant_app/Profile/domain/entities/profile.dart';
<<<<<<< HEAD

class ProfileModel extends Profile {
  ProfileModel({
    required int id,
    required String name,
    required String username,
    required String location,
    required String birth,
    required String bio,
    required List<ListFollowers> followers,
    required List<ListFollowing> following
  }) : super(id: id, name: name, username: username, location: location, birth: birth, bio: bio, followers: followers, following: following );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      username: json['userename'],
      location: json['location'],
      birth: json['birth'],
      bio: json['bio'],
      followers: json['followers'],
      following: json['following']
    );
=======
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
>>>>>>> e9545af6f48756ebb17fe472ccc3fc1b3b43e091
  }

  factory ProfileModel.fromEntity(Profile profile) {
    return ProfileModel(
<<<<<<< HEAD
      id: profile.id,
      name: profile.name,
      username: profile.username,
      location: profile.location,
      birth: profile.birth,
      bio: profile.bio,
      followers: [],
      following: []
    );
=======
        id: profile.id,
        name: profile.name,
        username: profile.username,
        location: profile.location,
        birth: profile.birth,
        bio: profile.bio,
        followers: [],
        following: []);
>>>>>>> e9545af6f48756ebb17fe472ccc3fc1b3b43e091
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'location': location,
      'birth': birth,
<<<<<<< HEAD
      'followers': followers,
      'following': following
=======
      'followers' : followers,
      'following' : following
>>>>>>> e9545af6f48756ebb17fe472ccc3fc1b3b43e091
    };
  }
}
