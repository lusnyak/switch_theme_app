import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switch_theme_app/src/presentation/providers/theme_provider.dart';
import 'package:switch_theme_app/src/utils/strings.dart' as strings;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(strings.home),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                themeProvider.message,
                style: const TextStyle(fontSize: 40.0),
              ),
              const SizedBox(height: 24.0),
              Icon(
                themeProvider.symbol,
                size: 80.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
