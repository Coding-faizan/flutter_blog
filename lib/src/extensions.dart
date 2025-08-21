import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFormattedDate() {
    return DateFormat('MMM d, yyyy').format(this);
  }
}

extension StringExtension on String {
  String capitalizeFirst() {
    final firstLetter = substring(0, 1).toUpperCase();
    final rest = substring(1);
    final result = firstLetter + rest;

    return result;
  }
}
