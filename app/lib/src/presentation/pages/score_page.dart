import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/presentation/providers/games/games_providers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/color_constants.dart';
import '../../../enums/match_type.dart';
import '../../../protos/base.pb.dart';
import '../../../protos/game.pbgrpc.dart';
import '../../../protos/google/protobuf/timestamp.pb.dart';
import '../../core/models/score_page_set.dart';
import '../providers/selected_players/selected_players_providers.dart';
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
    ScorePageSet(
      homeScore: 0,
      awayScore: 0,
      setId: 1,
    )
  ];

  void setHomeScore(double score) {
    setState(() {
      sets[currentSetId].homeScore = score;
    });
  }

  void setAwayScore(double score) {
    setState(() {
      sets[currentSetId].awayScore = score;
    });
  }

  void setCurrentSetId(int setId) {
    currentSetId = setId;
  }

  bool playerHasNickname(PlayerModel player) {
    return player.nickname != 'nickname' && player.nickname != '';
  }

  String displayName(PlayerModel player) {
    return playerHasNickname(player) ? player.nickname : player.fullName;
  }

  bool checkIfScoresAreSet() {
    int homeTeamScore = 0;
    int awayTeamSCore = 0;
    for (final ScorePageSet set in sets) {
      if (set.homeScore > set.awayScore) {
        homeTeamScore++;
      } else {
        awayTeamSCore++;
      }
      if (!set.isScoreSet()) {
        return false;
      }
    }
    if (homeTeamScore == awayTeamSCore) {
      return false;
    }
    return true;
  }

  List<SetModel> setModelMapper() {
    List<SetModel> newSets = [];
    int counter = 1;
    for (ScorePageSet set in sets) {
      newSets.add(
        SetModel(
          setNo: counter,
          homeTeam: set.homeScore.toInt(),
          awayTeam: set.awayScore.toInt(),
        ),
      );
    }
    return newSets;
  }

  @override
  Widget build(BuildContext context) {
    final gamesNotifier = ref.watch(gamesProvider.notifier);
    final selectedPlayersNotifier = ref.watch(selectedPlayersProvider.notifier);
    final matchType = widget.matchType;
    final playerOne = widget.selectedPlayers[0];
    final playerTwo = widget.selectedPlayers[1];
    final playerThree = widget.selectedPlayers[2];
    final playerFour = widget.selectedPlayers[3];
    bool isDouble() => widget.selectedPlayers[2].nickname.isNotEmpty;

    void saveNewMatch() {
      List<SetModel> newSets = setModelMapper();

      if (isDouble()) {
        GameModel match = GameModel(
            homeTeamIds: [playerOne.id, playerTwo.id],
            awayTeamIds: [playerThree.id, playerFour.id],
            sets: newSets,
            timeStamp: Timestamp.create().createEmptyInstance());
        gamesNotifier.createGame(match);
        selectedPlayersNotifier.resetState();
      } else {
        GameModel match = GameModel(
            homeTeamIds: [playerOne.id],
            awayTeamIds: [playerTwo.id],
            sets: newSets,
            timeStamp: Timestamp.create().createEmptyInstance());
        gamesNotifier.createGame(match);
        selectedPlayersNotifier.resetState();
      }
    }

    void removeSet() {
      if (scrollController.hasClients) {
        final position = widget.matchType == MatchType.double
            ? scrollController.position.maxScrollExtent - 420
            : scrollController.position.maxScrollExtent - 350;
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }

      sets.removeLast();
      listKey.currentState!.removeItem(
          sets.length,
          (context, animation) => SetContainer(
                animation: animation,
                setId: sets.length,
                homeScore: sets[sets.length - 1].homeScore,
                awayScore: sets[sets.length - 1].awayScore,
                matchType: matchType,
                playerOneName: displayName(playerOne),
                playerTwoName: displayName(playerTwo),
                playerThreeName: displayName(playerThree),
                playerFourName: displayName(playerFour),
                setHomeScore: setHomeScore,
                setAwayScore: setAwayScore,
                getSetId: setCurrentSetId,
                removeSet: removeSet,
                setCount: sets.length,
              ),
          duration: const Duration(milliseconds: 300));
    }

    void addSet() {
      if (scrollController.hasClients) {
        final position = widget.matchType == MatchType.double
            ? scrollController.position.maxScrollExtent + 450
            : scrollController.position.maxScrollExtent + 350;
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }

      setCounter++;
      sets.add(
        ScorePageSet(
          homeScore: 0,
          awayScore: 0,
          setId: setCounter,
        ),
      );
      listKey.currentState!.insertItem(
        sets.length - 1,
        duration: const Duration(milliseconds: 300),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Score'),
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: AnimatedList(
                controller: scrollController,
                key: listKey,
                shrinkWrap: true,
                initialItemCount: sets.length,
                itemBuilder: (context, index, animation) {
                  return SetContainer(
                    animation: animation,
                    setId: index,
                    homeScore: sets[index].homeScore,
                    awayScore: sets[index].awayScore,
                    matchType: matchType,
                    playerOneName: displayName(playerOne),
                    playerTwoName: displayName(playerTwo),
                    playerThreeName: displayName(playerThree),
                    playerFourName: displayName(playerFour),
                    setHomeScore: setHomeScore,
                    setAwayScore: setAwayScore,
                    getSetId: setCurrentSetId,
                    removeSet: removeSet,
                    setCount: sets.length,
                  );
                },
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(300, 50)),
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
                    onPressed: checkIfScoresAreSet()
                        ? () {
                            saveNewMatch();
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
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sets.length < 11
            ? () {
                addSet();
              }
            : null,
        backgroundColor: sets.length < 11
            ? ColorConstants.primaryColor
            : ColorConstants.disabledButtonColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
