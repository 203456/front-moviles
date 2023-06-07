import 'package:brilliant_app/Notification/domain/entities/notification.dart';

import '../../../User/domain/entities/user.dart';
class NotificationModel extends Notification{
  NotificationModel({
    required int id,
    required String type,
    required User origin,
    required User destiny,

  }) : super(id: id, type: type,origin: origin, destiny:  destiny );

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      type: json['type'],
      origin: json['origin'],
      destiny: json['destiny'],
      
    );
  }

  factory NotificationModel.fromEntity(Notification notification) {
    return NotificationModel(
      id: notification.id,
      type: notification.type,
      origin: notification.origin,
      destiny: notification.destiny
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'origin': origin,
      'destiny': destiny
    };
  }
}