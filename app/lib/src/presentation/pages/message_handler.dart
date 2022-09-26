import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../enums/team.dart';
import '../../core/models/score_notification.dart';
import 'pages.dart';
import '../providers/score/score_provider.dart';

import '../../../enums/score_type.dart';

class MessageHandler extends ConsumerStatefulWidget {
  const MessageHandler({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MessageHandlerState();
}

class _MessageHandlerState extends ConsumerState<MessageHandler> {
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
      final scoreNotifier = ref.read(scoreProvider.notifier);
      final scoreNotification = ScoreNotification.fromMap(message.data);
      print(scoreNotification);

      ScoreType? type;
      switch (scoreNotification.type) {
        case 'add':
          type = ScoreType.add;
          break;
        case 'remove':
          type = ScoreType.remove;
          break;
      }

      scoreNotifier.setScore(
        setId: int.parse(scoreNotification.setId!),
        team: scoreNotification.team == 'homeTeam'
            ? Team.homeTeam
            : Team.awayTeam,
        type: type!,
      );

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
