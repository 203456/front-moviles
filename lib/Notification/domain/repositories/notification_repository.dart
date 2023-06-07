import 'package:brilliant_app/Notification/domain/entities/notification.dart';
abstract class NotificationRepository{
  Future<Notification>getNotification(int id);
  Future<Notification>sendNotification(int id);
  Future<void>markNotification(Notification notification);


}