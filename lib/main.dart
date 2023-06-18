import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switch_theme_app/src/presentation/providers/theme_provider.dart';
import 'package:switch_theme_app/src/utils/routes.dart';
import 'package:switch_theme_app/src/utils/shared_preferences_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager().getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, pro, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: pro.themeMode,
            initialRoute: AppRouteName.start,
            onGenerateRoute: onGenerateRoutes,
          );
        }
      ),
    );
  }
}