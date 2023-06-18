import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesKeys {
  static const theme = "THEME";
}

class SharedPreferencesManager {
  static SharedPreferences? _sharedPrefs;

  getInstance() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  String? get theme =>
      _sharedPrefs?.getString(SharedPreferencesKeys.theme) ?? "light";

  set theme(String? value) {
    _sharedPrefs?.setString(SharedPreferencesKeys.theme, value ?? "light");
  }

  void updateTheme(String value) {
    if (_sharedPrefs?.containsKey(SharedPreferencesKeys.theme) ?? false) {
      _sharedPrefs?.remove(SharedPreferencesKeys.theme);
    }
    _sharedPrefs?.setString(SharedPreferencesKeys.theme, value);
  }

  void removeTheme() {
    if (_sharedPrefs?.containsKey(SharedPreferencesKeys.theme) ?? false) {
      _sharedPrefs?.remove(SharedPreferencesKeys.theme);
    }
  }
}
