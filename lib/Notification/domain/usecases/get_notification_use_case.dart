import 'package:brilliant_app/Notification/domain/entities/notification.dart';
import 'package:brilliant_app/Notification/domain/repositories/notification_repository.dart';

class GetNotificationUseCase{
  final NotificationRepository notificationRepository;

  GetNotificationUseCase(this.notificationRepository);

  Future<Notification> excute(int id) async{
    return await notificationRepository.getNotification(id);
  }
}
