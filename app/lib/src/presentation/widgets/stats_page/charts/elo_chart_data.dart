class EloChartData {
  final List<int> ratings;

  EloChartData(this.ratings);

  int getLowest() {
    int lowest = 1000000;
    for (var rating in ratings) {
      if (rating < lowest) {
        lowest = rating;
      }
    }
    return lowest;
  }

  int getHighest() {
    int highest = 0;
    for (var rating in ratings) {
      if (rating > highest) {
        highest = rating;
      }
    }
    return highest;
  }
}
