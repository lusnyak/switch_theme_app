import 'package:flutter/material.dart';

class LogThemeModel {
  final DateTime dateTime;
  final ThemeMode mode;

  LogThemeModel({
    required this.dateTime,
    required this.mode,
  });

  @override
  String toString() => "${dateTime.toIso8601String()} - ${mode.name}";
}
