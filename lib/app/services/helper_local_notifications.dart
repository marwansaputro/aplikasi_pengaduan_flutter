// Dart imports:
import 'dart:async';
import 'dart:developer';
import 'dart:io';

// Package imports:
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const idChannel = 'high_importance_channel';
const titleChannel = 'High Importance Notifications';
const description = 'This channel is used for important notifications.';

/// helper for notification service
class NotificationService {
  /// constructor for singleton notification service
  factory NotificationService() {
    return _notificationService;
  }

  int id = 0;

  NotificationService._internal();
  // singleton local notification
  static final NotificationService _notificationService =
      NotificationService._internal();

  /// initialize flutter local notification plugin
  FlutterLocalNotificationsPlugin service = FlutterLocalNotificationsPlugin();

  /// initialize android flutter notification channel
  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    idChannel, // id
    titleChannel, // title
    description: description, // description
    importance: Importance.max,
  );

  /// function check notification on ios and android
  Future<void> requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      // if ios requrest permission on ios and mac
      await service
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );

      // if mac request permission on mac
      await service
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      // request permissio on android notification for android 11 up
      final androidImplementation =
          service.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final granted =
          await androidImplementation?.requestNotificationsPermission();

      log('notfication granted ==> $granted');
    }
  }

  Future<void> showNotification(
      {required String title,
      required String body,
      required String payload}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(idChannel, titleChannel,
            channelDescription: description,
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await service.show(id++, title, body, notificationDetails,
        payload: payload);
  }

  /// initialize pusth notification on main.dart
  ///
  /// return feature<void>
  Future<void> init() async {
    try {
      // initialize android setting
      const initializationSettingsAndroid =
          AndroidInitializationSettings('ic_notifications_icon_transparent');

      // initialize for ios darwin notification
      final initializationSettingsDarwin = DarwinInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      );

      // register all setting into initialize settin local notification
      final initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
        macOS: initializationSettingsDarwin,
      );

      // initialize setting
      await service.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      );
    } catch (e) {
    } finally {}
  }

  /// handle on click notification
  ///
  /// parameter:
  /// id : id from postmodel
  /// title: title from fcm
  /// body: body from fcm
  /// payload: data payload on fcm
  void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {
    // for recieved from local notification
    log(payload.toString());
  }
}

/// function for background process on push notification
void onDidReceiveNotificationResponse(NotificationResponse details) {}
