import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('launch_background');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> showNotification(String body) async {
    
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '1',
      'Infinity Digital Bank', // Previously 'Infinity Digital Bank'
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      "Infinity Digital Bank",
      body,
      platformChannelSpecifics,
      payload: 'payload',
    );
  }
}
