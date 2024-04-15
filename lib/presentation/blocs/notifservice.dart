import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Contador estático para los IDs de las notificaciones
  static int _notificationId = 0;

  static void initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('launch_background');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> showNotification(String body) async {
    // Autoincrementar el ID para cada nueva notificación
    _notificationId++;

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id',
      'Infinity Digital Bank',
      importance: Importance.max,
      priority: Priority.high,
      channelDescription: 'Notification channel for bank alerts',
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      _notificationId,
      "Infinity Digital Bank",
      body,
      platformChannelSpecifics,
      payload: 'payload',
    );
  }
}
