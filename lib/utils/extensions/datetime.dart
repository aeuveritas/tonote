extension DateTimeExtension on DateTime {
  bool isSameDate(DateTime dst) {
    return year == dst.year && month == dst.month && day == dst.day;
  }

  DateTime clearTime() {
    return DateTime(year, month, day);
  }
}
