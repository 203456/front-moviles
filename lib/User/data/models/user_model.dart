import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  final String? uid;
  final String? name;
  final String? email;
  final String? username;
  final String? password;
  final String? location;
  final String? birth;
  final String? website;
  final String? gamertag;
  final String? profileUrl;
  final num? totalPosts;

  final String? bio;

  UserModel(  
      {this.uid,
      this.name,
      this.email,
      this.username,
      this.password,
      this.location,
      this.birth,
      this.bio,
        this.website,
      this.profileUrl,
        this.totalPosts,


        this.gamertag})
      : super(
            uid: uid,
            name: name,
            email: email,
            username: username,
            password: password,
            location: location,
            birth: birth,
            bio: bio,
            website: website,
            profileUrl: profileUrl,
              totalPosts: totalPosts,

            gamertag: gamertag);

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
        uid: snapshot['uid'],
        name: snapshot['name'],
        email: snapshot['email'],
        username: snapshot['username'],
        password: snapshot['password'],
        location: snapshot['location'],
        birth: snapshot['birth'],
        bio: snapshot['bio'],
        website: snapshot['website'],
        profileUrl: snapshot['profileUrl'],
        totalPosts: snapshot['totalPosts'],

        gamertag: snapshot['gamertag']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'username': username,
      'password': password,
      'location': location,
      'birth': birth,
      'bio': bio,
      "profileUrl": profileUrl,
      'website': website,
      'gamertag': gamertag,
      "totalPosts": totalPosts,

    };
  }
}
