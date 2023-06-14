import 'package:brilliant_app/User/domain/entities/user.dart';

class Followers {
  final int id;
  final User follower;
  final User followed;



  Followers({
    required this.id,
    required this.follower,
    required this.followed,
  });
}