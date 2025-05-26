import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> showNotification(RemoteMessage message) async {
  final id = int.tryParse(message.data['id'] ?? '') ?? DateTime.now().millisecondsSinceEpoch ~/ 1000;
  await flutterLocalNotificationsPlugin.show(
    id,
    message.data['issue'],
    message.data['body'],
    NotificationDetails(
      android: AndroidNotificationDetails(
        'sourcing_channel',
        'solicitudes',
        channelDescription: 'Notificaciones cuando tus productos coinciden con solicitudes',
        importance: Importance.max,
        priority: Priority.high,
      ),
    ),
  );
}
