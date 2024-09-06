import 'package:intl/intl.dart';

DateFormat dateFormatter = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ", 'en');

extension DateTimeExtension on String {
  String dateTimeFormatTimeZone(locale) {
    DateTime serverDatetime =
        DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ", 'en').parse(this);

    DateTime localDatetime = DateTime.now();

    var timezoneOffset = localDatetime.timeZoneOffset;

    var timeDiff = Duration(
        hours: timezoneOffset.inHours, minutes: timezoneOffset.inMinutes % 60);

    var newLocalTime = serverDatetime.add(timeDiff);
    String date =
        DateFormat("dd MMM yyyy, h:mm a", locale).format(newLocalTime);

    return date;
  }

  String dateTimeFormat(locale) {
    DateTime dateTime = dateFormatter.parse(this);

    DateTime utcPlus3 = dateTime.add(const Duration(hours: 0));

    String date = DateFormat("dd MMM yyyy, h:mm a", locale).format(utcPlus3);

    return date;
  }

  String dateFormatWithoutHour(locale) {
    DateTime dateTime =
        DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ", 'en').parse(this);

    DateTime utcPlus3 = dateTime.add(const Duration(hours: 3));

    String date = DateFormat("dd MMM yyyy", locale).format(utcPlus3);

    return date;
  }

  String formatHour(locale) {
    DateTime dateTime =
        DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ", 'en').parse(this);

    DateTime utcPlus3 = dateTime.add(const Duration(hours: 3));

    String date = DateFormat("HH:mm a", locale).format(utcPlus3);

    return date;
  }

  String dateTimeFormatWithoutUTC(locale) {
    DateTime dateTime = dateFormatter.parse(this);

    DateTime utcPlus3 = dateTime.add(const Duration(hours: 0));

    String date = DateFormat("dd MMM yyyy, h:mm a", locale).format(utcPlus3);

    return date;
  }
}
