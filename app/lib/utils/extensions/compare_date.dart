extension CompareDate on DateTime {
  bool hasSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
