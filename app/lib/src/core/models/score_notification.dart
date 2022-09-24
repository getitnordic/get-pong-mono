// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ScoreNotification {
  final String setId;
  final String team;
  final String type;

  ScoreNotification({
    required this.setId,
    required this.team,
    required this.type,
  });

  ScoreNotification copyWith({
    String? setId,
    String? team,
    String? type,
  }) {
    return ScoreNotification(
      setId: setId ?? this.setId,
      team: team ?? this.team,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'setId': setId,
      'team': team,
      'type': type,
    };
  }

  factory ScoreNotification.fromMap(Map<String, dynamic> map) {
    return ScoreNotification(
      setId: map['setId'] as String,
      team: map['team'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScoreNotification.fromJson(String source) =>
      ScoreNotification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ScoreNotification(setId: $setId, team: $team, type: $type)';

  @override
  bool operator ==(covariant ScoreNotification other) {
    if (identical(this, other)) return true;

    return other.setId == setId && other.team == team && other.type == type;
  }

  @override
  int get hashCode => setId.hashCode ^ team.hashCode ^ type.hashCode;
}
