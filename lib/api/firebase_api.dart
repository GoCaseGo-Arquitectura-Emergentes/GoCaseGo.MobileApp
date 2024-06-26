import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';


Future<void> handleBackgroundMessage(RemoteMessage message) async {
  if (kDebugMode) {
    print('Handling a background message: ${message.messageId}');
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Payload: ${message.data}');
  }
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  
  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    if (kDebugMode) {
      print('Firebase token: $token');
    }
    FirebaseMessaging.onBackgroundMessage(
      (message) => handleBackgroundMessage(message),
    );
  }
}