import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> showNotification(RemoteMessage message) async {
  final notificationBody = message.notification;
  final channel = notificationBody!.android!.channelId;
  final id = int.tryParse(message.data['id'] ?? '') ?? DateTime.now().millisecondsSinceEpoch ~/ 1000;
  await flutterLocalNotificationsPlugin.show(
    id,
    notificationBody.title,
    notificationBody.body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel!,
        channel,
        channelDescription: 'Notificaciones cuando tus productos coinciden con solicitudes',
        importance: Importance.max,
        priority: Priority.high,
      ),
    ),
  );
}
