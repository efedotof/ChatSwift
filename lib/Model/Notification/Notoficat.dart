import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;



Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage? message) async {
  if (message != null) {
    print('Handling background message: ${message.messageId}');
  } else {
    print('Received null message in background handler');
  }
}



class NotificationHandler {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission();
    final String? fcmToken = await _firebaseMessaging.getToken();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    if (fcmToken != null) {
      await saveFcmTokenToFirestore(fcmToken);
    }
  }

  Future<void> saveFcmTokenToFirestore(String fcmToken) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      User? user = _auth.currentUser;

      if (user != null) {
        // Добавляем токен устройства в документ пользователя
        await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
          'token_push': fcmToken,
        });
      }
    } catch (e) {
      print('Ошибка при сохранении FCM-токена в Firestore: $e');
    }
  }

 Future<void> sendNotificationToUser(String friendUid, String? title, String? body) async {
    try {
      final String? friendToken = await getFriendToken(friendUid);

      if (friendToken != null) {
        final String serverKey = 'AAAAmC08wX0:APA91bGTFsy3-NgynjTzbDvExaiq-UKWhyHPfzVlbfYkaZmkJYr2XFPHBml-vuJoohNwTeTGzSqCeSL3YTcpKPB2jV6iTn0BOkJogEPc12_lk-nxSRC8K4gosukw_Q90s7BFc6ZpRgtn'; // Replace with your FCM server key
        final String fcmEndpoint = 'https://fcm.googleapis.com/fcm/send';

        final Map<String, dynamic> payload = {
          'to': friendToken,
          'notification': {
            'title': title ?? '',
            'body': body ?? '',
          },
        };

        final headers = {
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverKey',
        };

        final response = await http.post(Uri.parse(fcmEndpoint),
            headers: headers, body: jsonEncode(payload));

        if (response.statusCode == 200) {
          print('Notification sent successfully');
        } else {
          print('Failed to send notification. Status code: ${response.statusCode}');
        }
        
      }
    } catch (e) {
      print('Error sending notification to user: $e');
    }
  }

  Future<String?> getFriendToken(String friendUid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
          await _firestore.collection('users').doc(friendUid).get();

      return userDoc.data()?['token_push'];
    } catch (e) {
      print('Error getting friend token: $e');
      return null;
    }
  }
}
