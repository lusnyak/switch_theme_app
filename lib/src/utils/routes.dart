import 'package:flutter/material.dart';
import 'package:switch_theme_app/src/presentation/screens/home_page.dart';
import 'package:switch_theme_app/src/presentation/screens/start_page.dart';

class AppRouteName {
  static const start = '/';
  static const home = '/home';
}

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRouteName.start:
      return _buildRoute(const StartPage(), settings);
    case AppRouteName.home:
      return _buildRoute(const HomePage(), settings);
    default:
      return _buildRoute(const Scaffold(), settings);
  }
}

_buildRoute(Widget widget, RouteSettings settings) {
  return MaterialPageRoute(builder: (context) => widget, settings: settings);
}
