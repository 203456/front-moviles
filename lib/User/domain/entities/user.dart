class UserEntity {
  final String id;
  final String name;
  final String email;
  final String username;
  final String password;
  final String location;
  final String birth;
  final String gamertag;
  final String bio;

  UserEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.username,
      required this.password,
      required this.location,
      required this.birth,
      required this.bio,
      required this.gamertag});

}
