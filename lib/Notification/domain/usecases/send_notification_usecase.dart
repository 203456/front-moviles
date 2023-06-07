import 'package:brilliant_app/Notification/domain/entities/notification.dart';
import 'package:brilliant_app/Notification/domain/repositories/notification_repository.dart';

class SendNotificationUseCase{
  final NotificationRepository notificationRepository;

  SendNotificationUseCase(this.notificationRepository);

  Future<Notification> excute(int id) async{
    return await notificationRepository.sendNotification(id);
  }
}
