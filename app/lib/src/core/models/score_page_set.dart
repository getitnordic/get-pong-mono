// ignore_for_file: public_member_api_docs, sort_constructors_first

class ScorePageSet {
  int setId;
  double homeScore;
  double awayScore;
  ScorePageSet({
    required this.homeScore,
    required this.awayScore,
    required this.setId,
  });

  void setHomeScore(double score) {
    homeScore = score;
  }

  void setAwayScore(double score) {
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
}
