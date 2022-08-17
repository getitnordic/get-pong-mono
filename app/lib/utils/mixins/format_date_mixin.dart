import 'package:date_time_format/date_time_format.dart';

abstract class FormatDateMixin {
  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return dateTime.format('D, M j Y, H:i');
  }
}
