import 'package:flutter/material.dart';
import 'package:switch_theme_app/src/model/log_theme_model.dart';
import 'package:switch_theme_app/src/utils/shared_preferences_manager.dart';
import 'package:switch_theme_app/src/utils/strings.dart' as strings;

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    final brightness = SharedPreferencesManager().theme ?? "light";
    _themeMode = brightness == "light" ? lightMode : darkMode;
  }

  final List<LogThemeModel> _logRecords = <LogThemeModel>[];
  List<LogThemeModel> get logRecords => _logRecords.reversed.toList();

  ThemeMode? _themeMode;
  ThemeMode? get themeMode => _themeMode;

  final darkMode = ThemeMode.dark;

  final lightMode = ThemeMode.light;

  String get message => _themeMode == lightMode ? strings.helloWorld : strings.byeWorld;
  IconData get symbol => _themeMode == lightMode ? Icons.wb_sunny_rounded : Icons.nightlight_round ;

  DateTime? get lastRecord => _logRecords.isNotEmpty ? _logRecords.last.dateTime : null;

  toggleThemeMode(ThemeMode? value) {
    if (value != null) {
      _themeMode = value;
      SharedPreferencesManager().theme = _themeMode?.name ?? "light";
      _logRecords.add(LogThemeModel(dateTime: DateTime.now(), mode: _themeMode!));
      notifyListeners();
    }
  }
}
