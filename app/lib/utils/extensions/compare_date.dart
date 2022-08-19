extension CompareDate on DateTime {
  bool hasSameDate(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }
}
