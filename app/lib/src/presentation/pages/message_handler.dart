import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_pong/src/presentation/pages/pages.dart';

class MessageHandler extends StatefulWidget {
  const MessageHandler({Key? key}) : super(key: key);

  @override
  State<MessageHandler> createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {
  @override
  void initState() {
    registerNotification();
    super.initState();
  }

  Future<void> registerNotification() async {
    print('REGISTER NOTIFICATION');
    await Firebase.initializeApp();
    final messaging = FirebaseMessaging.instance;

    await messaging.subscribeToTopic('getpong');

    //TODO: If adding iOS functionality request permissions and check AuthorizationStatus == Authorized

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('MESSAGE NOTIFICATION: ${message.notification}');
      print('MESSAGE DATA: ${message.data}');

      // Check data event

      // Team home && addScore
      // Switch case on event
    });
  }

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
