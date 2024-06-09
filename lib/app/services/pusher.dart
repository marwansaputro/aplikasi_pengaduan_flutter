import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:integra_mobile/app/services/helper_local_notifications.dart';
import 'package:integra_mobile/app/utils/convert.dart';
import 'package:integra_mobile/domain/entities/model_pusher.dart';
import 'package:pusher_beams/pusher_beams.dart';

class ServicePusherBeams {
  factory ServicePusherBeams() {
    return _pusherBeams;
  }

  ServicePusherBeams._internal();
  static final ServicePusherBeams _pusherBeams = ServicePusherBeams._internal();

  Future<void> startUp() async {
    await PusherBeams.instance.start(dotenv.env['INSTANCE_ID'] ?? '');

    await PusherBeams.instance.setDeviceInterests(["hello"]);
  }

  Future<void> initPusherBeams() async {
    // Let's see our current interests
    print(await PusherBeams.instance.getDeviceInterests());

    // This is not intented to use in web
    if (!kIsWeb) {
      await PusherBeams.instance
          .onInterestChanges((interests) => {print('Interests: $interests')});
      await PusherBeams.instance
          .onMessageReceivedInTheForeground(_onMessageReceivedInTheForeground);
    }
    await _checkForInitialMessage();
  }

  Future<void> _checkForInitialMessage() async {
    final initialMessage = await PusherBeams.instance.getInitialMessage();

    if (initialMessage != null) {
      // _showAlert('Initial Message Is:', initialMessage.toString());
    }
  }

  void _onMessageReceivedInTheForeground(Map<Object?, Object?> data) {
    final modelPusher = ModelPusher.fromJson(convertingMap(data));

    NotificationService().showNotification(
        body: modelPusher.body,
        title: modelPusher.title,
        payload: jsonEncode(modelPusher.toJson()));
  }
}
