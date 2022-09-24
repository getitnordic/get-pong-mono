import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ScorePageSet {
  final int setId;
  double homeScore;
  double awayScore;

  ScorePageSet({
    required this.setId,
    required this.homeScore,
    required this.awayScore,
  });

  

  setHomeScore(double score) {
    homeScore = score;
  }

  setAwayScore(double score) {
    awayScore = score;
  }

  bool isScoreSet() {
    if (homeScore >= 11 || awayScore >= 11) {
      if (homeScore != awayScore) {
        return true;
      }
    }
    return false;
  }

  ScorePageSet copyWith({
    int? setId,
    double? homeScore,
    double? awayScore,
  }) {
    return ScorePageSet(
      setId: setId ?? this.setId,
      homeScore: homeScore ?? this.homeScore,
      awayScore: awayScore ?? this.awayScore,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'setId': setId,
      'homeScore': homeScore,
      'awayScore': awayScore,
    };
  }

  factory ScorePageSet.fromMap(Map<String, dynamic> map) {
    return ScorePageSet(
      setId: map['setId'] as int,
      homeScore: map['homeScore'] as double,
      awayScore: map['awayScore'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScorePageSet.fromJson(String source) =>
      ScorePageSet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ScorePageSet(setId: $setId, homeScore: $homeScore, awayScore: $awayScore)';

  @override
  bool operator ==(covariant ScorePageSet other) {
    if (identical(this, other)) return true;

    return other.setId == setId &&
        other.homeScore == homeScore &&
        other.awayScore == awayScore;
  }

  @override
  int get hashCode => setId.hashCode ^ homeScore.hashCode ^ awayScore.hashCode;
}
