import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate_ddMMM(String? date) {
    if (date == null) return "--";
    DateTime parsedDate = DateTime.parse(date).toLocal();
    return DateFormat('dd, MMM').format(parsedDate);
  }
  static String formatDate_date_time(String? date) {
    if (date == null) return "--";
    DateTime parsedDate = DateTime.parse(date).toLocal();
    return DateFormat('dd-MM-yyyy | hh:mm a').format(parsedDate);
  }
  static String formatDate_date_time_fullMonth(String? date) {
    if (date == null) return "--";
    DateTime parsedDate = DateTime.parse(date).toLocal();
    return DateFormat('dd-MMM-yyyy | hh:mm a').format(parsedDate);
  }

  static String formatDate_yyyyMMdd(String? date) {
    if (date == null) return "--";
    DateTime parsedDate = DateTime.parse(date).toLocal();
    return DateFormat('yyyy-MM-dd').format(parsedDate);
  }

  static String formatDate_ddMMyyyy(String? date) {
    if (date == null) return "--";
    DateTime parsedDate = DateTime.parse(date).toLocal();
    return DateFormat('dd/MM/yyyy').format(parsedDate);
  }
  static String formatDate_ddMMyyyy_dash(String? date) {
    if (date == null) return "--";
    DateTime parsedDate = DateTime.parse(date).toLocal();
    return DateFormat('dd-MM-yyyy').format(parsedDate);
  }

  static String formatDate_fullMonth_with_year(String? date) {
    if (date == null) return "--";
    DateTime parsedDate = DateTime.parse(date).toLocal();
    return DateFormat('dd MMMM yyyy').format(parsedDate);
  }
  static String formatDate_fullMonth_without_year(String? date) {
    if (date == null) return "--";
    DateTime parsedDate = DateTime.parse(date).toLocal();
    return DateFormat('dd - MMMM').format(parsedDate);
  }

  static String formatTime_HHmm(String? date) {
    if (date == null) return "--";
    DateTime parsedDate = DateTime.parse(date).toLocal();
    return DateFormat('HH:mm').format(parsedDate);
  }

  static String formatTime_hhmma(String? date) {
    if (date == null) return "--";
    DateTime parsedDate = DateTime.parse(date).toLocal();
    return DateFormat('hh:mm a').format(parsedDate);
  }

  static String formatTime_hhmma_v2(String? logInDate, String? logInTime) {
    if (logInDate == null || logInTime == null) return "";
    DateTime parsedDate = DateTime.parse("$logInDate $logInTime").toLocal();
    DateTime localDateTime = parsedDate.toLocal();
    return DateFormat('hh:mm a').format(localDateTime);
  }

  // 3:54 PM, Today 🕓 11:20 AM, Yesterday 📅 15 Oct (if older)
  static String formatSmartDate(String? date) {
    if (date == null) return "--";
    DateTime parsedDate = DateTime.parse(date).toLocal();
    DateTime now = DateTime.now();

    // Remove time part for date-only comparison
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(const Duration(days: 1));
    DateTime dateOnly = DateTime(parsedDate.year, parsedDate.month, parsedDate.day);

    String timeFormatted = DateFormat('h:mm a').format(parsedDate);

    if (dateOnly == today) {
      return "$timeFormatted, Today";
    } else if (dateOnly == yesterday) {
      return "$timeFormatted, Yesterday";
    } else {
      return DateFormat('d MMM').format(parsedDate);
    }
  }

}
