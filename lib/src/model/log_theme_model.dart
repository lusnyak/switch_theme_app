import 'package:flutter/material.dart';
import 'package:switch_theme_app/src/utils/strings.dart';

class LogThemeModel {
  final DateTime dateTime;
  final ThemeMode mode;

  LogThemeModel({
    required this.dateTime,
    required this.mode,
  });

  @override
  String toString() => "${dateTime.toIso8601String()} - ${mode.message}";
}

extension ThemeModeString on ThemeMode {
  String get message => this == ThemeMode.light ? helloWorld : byeWorld;
}