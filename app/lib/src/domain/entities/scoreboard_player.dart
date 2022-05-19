class ScoreboardPlayer {
  final String name;
  final int wins;
  final int losses;
  final String imageUrl;

  const ScoreboardPlayer(this.name, this.wins, this.losses, this.imageUrl);

  ScoreboardPlayer copyWith(String? name, int? wins, int? losses, String? imageUrl) {
    return ScoreboardPlayer(name ?? this.name,
        wins ?? this.wins,
        losses ?? this.losses,
        imageUrl ?? this.imageUrl);
  }

}