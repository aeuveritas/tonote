extension DateTimeExtension on DateTime {
  bool isSameDate(DateTime dst) {
    return this.year == dst.year &&
        this.month == dst.month &&
        this.day == dst.day;
  }

  DateTime clearTime() {
    return DateTime(this.year, this.month, this.day);
  }
}
