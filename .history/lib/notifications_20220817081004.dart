import 'package:awesome_notifications/awesome_notifications.dart';

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