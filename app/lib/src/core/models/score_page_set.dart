// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ScorePageSet {
  int homeScore;
  int awayScore;
  ScorePageSet({
    required this.homeScore,
    required this.awayScore,
  });  

  ScorePageSet copyWith({
    int? homeScore,
    int? awayScore,
  }) {
    return ScorePageSet(
      homeScore: homeScore ?? this.homeScore,
      awayScore: awayScore ?? this.awayScore,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'homeScore': homeScore,
      'awayScore': awayScore,
    };
  }

  factory ScorePageSet.fromMap(Map<String, dynamic> map) {
    return ScorePageSet(
      homeScore: map['homeScore'] as int,
      awayScore: map['awayScore'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScorePageSet.fromJson(String source) => ScorePageSet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ScorePageSet(homeScore: $homeScore, awayScore: $awayScore)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ScorePageSet &&
      other.homeScore == homeScore &&
      other.awayScore == awayScore;
  }

  @override
  int get hashCode => homeScore.hashCode ^ awayScore.hashCode;
}
