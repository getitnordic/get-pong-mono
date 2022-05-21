class Player {
  final String id;
  final String name;
  final int wins;
  final int losses;
  final String imageUrl;

  const Player(this.id, this.name, this.wins, this.losses, this.imageUrl);

  Player copyWith(String? id, String? name, int? wins, int? losses, String? imageUrl) {
    return Player(
        id ?? this.id,
        name ?? this.name,
        wins ?? this.wins,
        losses ?? this.losses,
        imageUrl ?? this.imageUrl
    );
  }

}