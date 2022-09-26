// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ScoreNotification {
  final String? setId;
  final String? team;
  final String? type;
  final String? gameEvent;

  ScoreNotification({
    this.setId,
    this.team,
    this.type,
    this.gameEvent,
  });

  ScoreNotification copyWith({
    String? setId,
    String? team,
    String? type,
    String? gameEvent,
  }) {
    return ScoreNotification(
      setId: setId ?? this.setId,
      team: team ?? this.team,
      type: type ?? this.type,
      gameEvent: gameEvent ?? this.gameEvent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'setId': setId,
      'team': team,
      'type': type,
      'gameEvent': gameEvent,
    };
  }

  factory ScoreNotification.fromMap(Map<String, dynamic> map) {
    return ScoreNotification(
      setId: map['setId'] != null ? map['setId'] as String : null,
      team: map['team'] != null ? map['team'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      gameEvent: map['gameEvent'] != null ? map['gameEvent'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScoreNotification.fromJson(String source) =>
      ScoreNotification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ScoreNotification(setId: $setId, team: $team, type: $type, gameEvent: $gameEvent)';
  }

  @override
  bool operator ==(covariant ScoreNotification other) {
    if (identical(this, other)) return true;

    return other.setId == setId &&
        other.team == team &&
        other.type == type &&
        other.gameEvent == gameEvent;
  }

  @override
  int get hashCode {
    return setId.hashCode ^ team.hashCode ^ type.hashCode ^ gameEvent.hashCode;
  }
}
