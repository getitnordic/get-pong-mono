import 'package:date_time_format/date_time_format.dart';

abstract class FormatDateMixin {
  String formatDate(DateTime date) {
    return date.format('D, M j Y, H:i');
  }
}
