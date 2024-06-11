import 'package:integra_mobile/data/model/model_notification_list.dart';
import 'package:integra_mobile/data/provider/network/api/api_notification.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

class NotificationRepository {
  UserRepository user;

  NotificationRepository({required this.user});

  Future<ModelNotificationList> listHistory() {
    try {
      return apiListNotification();
    } catch (e) {
      rethrow;
    }
  }
}