// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get_pong/enums/team.dart';

class MatchResult {
  int homeTeamScore;
  int awayTeamScore;
  Team winner;
  MatchResult({
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.winner,
  });
}
