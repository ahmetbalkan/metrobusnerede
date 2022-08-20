import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

Future<void> createAlarmNotification(String name) async {
  int id = 1;
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: id,
          channelKey: "Metrobus_Nerede",
          title: name,
          body: "$name Durağına yaklaşıyorsunuz. Lütfen Kapıya Doğru Yaklaşın.",
          notificationLayout: NotificationLayout.Default));
}
