import 'package:brilliant_app/Notification/domain/entities/notification.dart';
import 'package:brilliant_app/Notification/domain/repositories/notification_repository.dart';

class MarkNotificationUseCase{
  final NotificationRepository notificationRepository;

  MarkNotificationUseCase(this.notificationRepository);

  Future<void> excute(Notification notification) async{
    return await notificationRepository.markNotification(notification);
  }
}
