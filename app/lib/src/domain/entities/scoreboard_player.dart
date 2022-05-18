class ScoreboardPlayer {
  final String name;
  final int wins;
  final int losses;

  const ScoreboardPlayer(this.name, this.wins, this.losses);

  ScoreboardPlayer copyWith(String? name, int? wins, int? losses) {
    return ScoreboardPlayer(name ?? this.name, wins ?? this.wins, losses ?? this.losses);
  }

}