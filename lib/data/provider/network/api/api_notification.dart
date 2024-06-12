import 'dart:convert';

import 'package:integra_mobile/data/model/model_notification_list.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

Future<ModelNotificationList> apiListNotification() async {
  final data = await myDio().get('/api/notification');

  if (data.statusCode == 200) {
    return ModelNotificationList.fromJson(jsonDecode(data.toString()));
  }

  throw Exception('Tidak bisa login');
}
