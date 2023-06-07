import 'package:brilliant_app/User/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required int id,
      required String name,
      required String email,
      required String username,
      required String password,
      required String location,
      required String birth,
      required String gamertag})
      : super(
            id: id,
            name: name,
            email: email,
            username: username,
            password: password,
            location: location,
            birth: birth,
            gamertag: gamertag);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        location: json['location'],
        birth: json['birth'],
        gamertag: json['gamertag']);
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        username: user.username,
        password: user.password,
        location: user.location,
        birth: user.birth,
        gamertag: user.gamertag);
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
      'gamertag': gamertag
    };
  }
}
