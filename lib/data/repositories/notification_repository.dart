import 'package:integra_mobile/data/model/model_notification_list.dart';
import 'package:integra_mobile/data/model/return_message.dart';
import 'package:integra_mobile/data/model/return_notification_count.dart';
import 'package:integra_mobile/data/provider/network/api/api_notification.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

class NotificationRepository {
  AuthRepository user;

  NotificationRepository({required this.user});

  Future<ModelNotificationList> listHistory({
    int? page,
  }) {
    try {
      return apiListNotification(page: page);
    } catch (e) {
      print(e.toString());

      rethrow;
    }
  }

  Future<ReturnNotificationCount> count() {
    try {
      return apiNotificationCount();
    } catch (e) {
      rethrow;
    }
  }

  Future<ReturnMessage> readAll() {
    try {
      return apiNotificationReadAll();
    } catch (e) {
      print(e.toString());

      rethrow;
    }
  }

  Future<ReturnMessage> read({
    required String id,
  }) {
    try {
      return apiNotificationRead(id);
    } catch (e) {
      print(e.toString());

      rethrow;
    }
  }
}
