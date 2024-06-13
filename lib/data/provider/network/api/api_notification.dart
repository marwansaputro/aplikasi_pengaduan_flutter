import 'dart:convert';

import 'package:integra_mobile/data/model/model_notification_list.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

Future<ModelNotificationList> apiListNotification({
  int? page,
}) async {
  final data =
      await myDio().get('/api/notification', queryParameters: {"page": page});

  if (data.statusCode == 200) {
    return ModelNotificationList.fromJson(jsonDecode(data.toString()));
  }

  throw Exception('Tidak bisa login');
}
