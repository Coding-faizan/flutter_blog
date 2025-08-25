import 'package:flutter/material.dart';
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

extension BuildContextExtension on BuildContext {
  void showSnackBar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        content: Text(text),
      ),
    );
  }
}
