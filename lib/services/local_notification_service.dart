import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    final InitializationSettings _initializationSettings =
        // ignore: prefer_const_constructors
        InitializationSettings(
            // ignore: prefer_const_constructors
            android: AndroidInitializationSettings(
                "@mipmap/ic_launcher")); //! BURALARI DEĞİŞTİRMEN LAZIM

    _notificationsPlugin.initialize(_initializationSettings);
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      // ignore: prefer_const_constructors
      final NotificationDetails notificationDetails = NotificationDetails(
          // ignore: prefer_const_constructors
          android: AndroidNotificationDetails(
              "accompanymobile", "accompanymobile channel",
              importance: Importance.max, priority: Priority.high));

      await _notificationsPlugin.show(id, message.notification!.title,
          message.notification!.body, notificationDetails,
          payload: message.data["page"]);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
