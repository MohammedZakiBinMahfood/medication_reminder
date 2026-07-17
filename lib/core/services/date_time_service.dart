import 'package:intl/intl.dart';

class DateTimeService {
  DateTimeService._();

  static DateTime now() => DateTime.now();

  static DateTime today() {
    final n = now();
    return DateTime(n.year, n.month, n.day);
  }

  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static String formatTime(DateTime time, {String pattern = 'hh:mm a'}) {
    return DateFormat(pattern).format(time);
  }
}
