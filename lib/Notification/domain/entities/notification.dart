import 'package:brilliant_app/User/domain/entities/user.dart';

class Notification {
  final int id;
  final String type;
  final User origin;
  final User destiny;



  Notification({
    required this.id,
    required this.type,
    required this.origin,
    required this.destiny
  });
}