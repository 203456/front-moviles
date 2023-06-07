import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  UserModel(
      {required String id,
      required String name,
      required String email,
      required String username,
      required String password,
      required String location,
      required String birth,
      required String bio,
      required String gamertag})
      : super(
            id: id,
            name: name,
            email: email,
            username: username,
            password: password,
            location: location,
            birth: birth,
            bio: bio,
            gamertag: gamertag);

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
        id: snapshot['id'],
        name: snapshot['name'],
        email: snapshot['email'],
        username: snapshot['username'],
        password: snapshot['password'],
        location: snapshot['location'],
        birth: snapshot['birth'],
        bio: snapshot['bio'],
        gamertag: snapshot['gamertag']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'password': password,
      'location': location,
      'birth': birth,
      'bio': bio,
      'gamertag': gamertag
    };
  }
}
