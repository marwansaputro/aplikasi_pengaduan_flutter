import 'dart:convert';

import 'package:integra_mobile/data/model/model_notification_list.dart';
import 'package:integra_mobile/data/model/return_message.dart';
import 'package:integra_mobile/data/model/return_notification_count.dart';
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

Future<ReturnNotificationCount> apiNotificationCount() async {
  final data = await myDio().get('/api/notification-count');

  if (data.statusCode == 200) {
    return ReturnNotificationCount.fromJson(jsonDecode(data.toString()));
  }

  throw Exception("Tidak bisa mendapatkan jumlah dari notification");
}

Future<ReturnMessage> apiNotificationReadAll() async {
  final data = await myDio().post('/api/notification-read-all');

  if (data.statusCode == 201) {
    return ReturnMessage.fromJson(jsonDecode(data.toString()));
  }

  throw Exception("Tidak berhasil read semua nofiikasi");
}

Future<ReturnMessage> apiNotificationRead(String id) async {
  final data = await myDio().post('/api/notification-read/$id');

  if (data.statusCode == 201) {
    return ReturnMessage.fromJson(jsonDecode(data.toString()));
  }

  throw Exception("Tidak berhasil read semua nofiikasi");
}
