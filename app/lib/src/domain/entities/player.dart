class Player {
  final String name;
  final int wins;
  final int losses;
  final String imageUrl;

  const Player(this.name, this.wins, this.losses, this.imageUrl);

  Player copyWith(String? name, int? wins, int? losses, String? imageUrl) {
    return Player(
        name ?? this.name,
        wins ?? this.wins,
        losses ?? this.losses,
        imageUrl ?? this.imageUrl
    );
  }

}