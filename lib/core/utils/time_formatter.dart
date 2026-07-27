class AppTimeFormatter {
  AppTimeFormatter._();

  static String formatMinutesFromMidnight(
    int minutesFromMidnight, {
    bool isArabic = true,
  }) {
    final hour24 = minutesFromMidnight ~/ 60;
    final minute = minutesFromMidnight % 60;
    return formatHourMinute(hour24, minute, isArabic: isArabic);
  }

  static String formatDateTime(DateTime dateTime, {bool isArabic = true}) {
    return formatHourMinute(dateTime.hour, dateTime.minute, isArabic: isArabic);
  }

  static String formatHourMinute(
    int hour24,
    int minute, {
    bool isArabic = true,
  }) {
    final isPm = hour24 >= 12;
    final period = isArabic ? (isPm ? 'م' : 'ص') : (isPm ? 'PM' : 'AM');
    var hour12 = hour24 % 12;
    if (hour12 == 0) hour12 = 12;
    final minuteStr = minute.toString().padLeft(2, '0');
    final hourStr = hour12.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr $period';
  }
}
