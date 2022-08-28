import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clean_framework/clean_framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../firebase_options.dart';
import '../routes.dart';



class FcmService {
  final BuildContext context;
  FcmService(this.context);

  late AndroidNotificationChannel channel;
  bool isFlutterLocalNotificationsInitialized = false;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;


  Future initializeFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    if (!kIsWeb) {
      await setupFlutterNotifications();
    }
  }
  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await setupFlutterNotifications();
    // showFlutterNotification(message);
    print('Handling a background message ${message.messageId}');
  }
  void  onClickNotification(String? payload)  {
    try {
      context. router.push(Routes.home);
    } catch (e) {
      if (kDebugMode) {
        print("error---------$e");
      }
    }

  }
  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var androidSettings = const AndroidInitializationSettings('launcher_icon');
    var iOSSettings = const IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    var initSettings =
    InitializationSettings(android: androidSettings, iOS: iOSSettings);
    await flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: (String? payload) async {
          onClickNotification(payload);
        });


    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,


    );
    isFlutterLocalNotificationsInitialized = true;
  }

  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(

        payload: jsonEncode(message.notification!.body),
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,

            icon: 'launch_background',
          ),
        ),
      );
    }
  }


  Future getFCM() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print("fcm------${token ?? "-"}");
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    if (Platform.isIOS) {
      FirebaseMessaging.instance.requestPermission();
    }
    FirebaseMessaging.instance.subscribeToTopic("topic");
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("message clicked");
      _serialiseAndNavigate(message);
    });
  }

  Future<void> _serialiseAndNavigate(RemoteMessage message) async {
    context.router.push(Routes.home);
  }
}
