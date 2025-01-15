import 'package:intl/intl.dart';

class DateFormatUtils {
  static formatMonth(DateTime dateTime) {
    return DateFormat('MMM').format(dateTime);
  }

  static formatDay(DateTime dateTime) {
    return DateFormat('dd').format(dateTime);
  }

  static formatDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy | kk:mm a').format(dateTime);
  }
}
