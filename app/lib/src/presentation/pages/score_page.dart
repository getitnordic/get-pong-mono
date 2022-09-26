import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/color_constants.dart';
import '../../../enums/match_type.dart';
import '../../../enums/score_type.dart';
import '../../../enums/team.dart';
import '../../../protos/base.pb.dart';
import '../../../utils/extensions/display_player_name.dart';
import '../../core/models/score_notification.dart';
import '../../core/models/score_page_set.dart';
import '../providers/score/score_provider.dart';
import '../widgets/widgets.dart';

class ScorePage extends ConsumerStatefulWidget {
  final List<PlayerModel> selectedPlayers;
  final MatchType matchType;
  const ScorePage({
    Key? key,
    required this.selectedPlayers,
    required this.matchType,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScorePageState();
}

class _ScorePageState extends ConsumerState<ScorePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final listKey = GlobalKey<AnimatedListState>();
  final scrollController = ScrollController();
  int setCounter = 1;
  int currentSetId = 0;
  late bool isDouble;

  List<ScorePageSet> sets = [
    ScorePageSet(homeScore: 0, awayScore: 0, setId: 1)
  ];

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
      final setCounterNotifier = ref.read(setNotificationProvider.notifier);

      if (scoreNotification.gameEvent != null) {
        switch (scoreNotification.gameEvent) {
          case 'add':
            setCounterNotifier.update((state) => state + 1);
            break;
          case 'remove':
            setCounterNotifier.update((state) => state - 1);
            break;
        }
        return;
      }

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

  void setScore(int setId, Team team, ScoreType type) {
    ref.read(scoreProvider.notifier).setScore(
          setId: setId,
          team: team,
          type: type,
        );
  }

  void setCurrentSetId(int setId) {
    currentSetId = setId;
  }

  void removeSet(WidgetRef ref) {
    final scoreNotifier = ref.read(scoreProvider.notifier);
    final isPhoneOrVertical = MediaQuery.of(context).size.width < 1000;
    if (setCounter > 1) {
      if (scrollController.hasClients) {
        final position = isPhoneOrVertical
            ? scrollController.position.maxScrollExtent - 700
            : scrollController.position.maxScrollExtent - 568;
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }

      sets.removeLast();
      scoreNotifier.removeSet();
      listKey.currentState!.removeItem(
          sets.length,
          (context, animation) => SetContainer(
                animation: animation,
                setId: sets.length,
                homeScore: sets[sets.length - 1].homeScore,
                awayScore: sets[sets.length - 1].awayScore,
                matchType: widget.matchType,
                playerOneName: widget.selectedPlayers[0].displayName(),
                playerTwoName: widget.selectedPlayers[1].displayName(),
                playerThreeName: widget.selectedPlayers[2].displayName(),
                playerFourName: widget.selectedPlayers[3].displayName(),
                setScore: setScore,
              ),
          duration: const Duration(milliseconds: 300));
      setState(() {
        setCounter--;
      });
    }
  }

  void addSet(WidgetRef ref) {
    final scoreNotifier = ref.read(scoreProvider.notifier);
    final isPhoneOrVertical = MediaQuery.of(context).size.width < 1000;
    if (scrollController.hasClients) {
      final position = isPhoneOrVertical
          ? scrollController.position.maxScrollExtent + 700
          : scrollController.position.maxScrollExtent + 568;
      scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
    sets.add(
      ScorePageSet(homeScore: 0, awayScore: 0, setId: setCounter),
    );
    scoreNotifier.addSet(ScorePageSet(
      homeScore: 0,
      awayScore: 0,
      setId: setCounter,
    ));
    listKey.currentState!.insertItem(
      sets.length - 1,
      duration: const Duration(milliseconds: 300),
    );
    setState(() {
      setCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final matchType = widget.matchType;
    final playerOne = widget.selectedPlayers[0];
    final playerTwo = widget.selectedPlayers[1];
    final playerThree = widget.selectedPlayers[2];
    final playerFour = widget.selectedPlayers[3];
    final globalSets = ref.watch(scoreProvider);
    final scoreNotifier = ref.read(scoreProvider.notifier);

    ref.listen(
      setNotificationProvider,
      ((previous, next) {
        int oldCount = previous as int;
        int newCount = next as int;
        oldCount > newCount ? addSet(ref) : removeSet(ref);
      }),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Score'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: AnimatedList(
                  controller: scrollController,
                  key: listKey,
                  shrinkWrap: true,
                  initialItemCount: sets.length,
                  itemBuilder: (context, index, animation) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: SetContainer(
                        animation: animation,
                        setId: index,
                        homeScore: globalSets[index].homeScore,
                        awayScore: globalSets[index].awayScore,
                        matchType: matchType,
                        playerOneName: playerOne.displayName(),
                        playerTwoName: playerTwo.displayName(),
                        playerThreeName: playerThree.displayName(),
                        playerFourName: playerFour.displayName(),
                        setScore: setScore,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _setNumText(),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                      minimumSize: MediaQuery.of(context).size.width < 550
                          ? MaterialStateProperty.all<Size>(const Size(100, 50))
                          : MaterialStateProperty.all<Size>(
                              const Size(300, 50)),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return ColorConstants.primaryColor;
                          } else if (states.contains(MaterialState.disabled)) {
                            return ColorConstants.disabledButtonColor;
                          }
                          return ColorConstants.primaryColor;
                        },
                      ),
                    ),
                    onPressed: scoreNotifier.checkIfScoresAreSet()
                        ? () {
                            scoreNotifier.saveNewMatch(
                              playerOne,
                              playerTwo,
                              playerThree,
                              playerFour,
                            );
                            Navigator.pop(context);
                          }
                        : null,
                    child: Text(
                      'Save Result',
                      style: GoogleFonts.goldman(
                        fontSize: 20,
                        color: ColorConstants.textColor,
                      ),
                    ),
                  ),
                  _addRemoveSetButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _addRemoveSetButtons() {
    final isPhoneOrVertical = MediaQuery.of(context).size.width < 1000;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: isPhoneOrVertical ? 105 : 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSmallContainer(
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: () {
                  removeSet(ref);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 25,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            CustomSmallContainer(
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: () {
                  addSet(ref);
                },
                icon: const Icon(
                  Icons.add,
                  color: ColorConstants.primaryColor,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _setNumText() {
    final isPhoneOrVertical = MediaQuery.of(context).size.width < 1000;

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: isPhoneOrVertical ? 70 : 150,
        child: CustomSmallContainer(
          height: 50,
          width: isPhoneOrVertical ? 70 : 150,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: AutoSizeText(
              'Set $setCounter',
              minFontSize: 11,
              maxFontSize: 34,
              maxLines: 1,
              style: const TextStyle(fontSize: 34),
            ),
          ),
        ),
      ),
    );
  }
}
