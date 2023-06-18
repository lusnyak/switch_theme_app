import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switch_theme_app/src/model/log_theme_model.dart';
import 'package:switch_theme_app/src/presentation/providers/theme_provider.dart';
import 'package:switch_theme_app/src/utils/routes.dart';
import 'package:switch_theme_app/src/utils/strings.dart' as strings;

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(strings.changeTheme),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRouteName.home);
            },
            icon: const Icon(Icons.navigate_next),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSwitch(context),
              const Divider(),
              Expanded(
                child: _buildLogsList(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildLogsList(BuildContext context) {
    final themeChange = context.watch<ThemeProvider>();
    return ListView.separated(
      itemCount: themeChange.logRecords.length,
      itemBuilder: (context, index) {
        final record = themeChange.logRecords[index];
        return ListTile(
          title: Text(record.mode.message),
          subtitle: Text(record.dateTime.toString()),
          trailing: Text(record.mode.name),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10.0);
      },
    );
  }

  _buildSwitch(BuildContext context) {
    final themeChange = context.watch<ThemeProvider>();

    Map<ThemeMode, Widget> children = <ThemeMode, Widget>{
      themeChange.lightMode: const Text('Hello world'),
      themeChange.darkMode: const Text('Bye world'),
    };

    return CupertinoSlidingSegmentedControl<ThemeMode>(
      groupValue: themeChange.themeMode,
      children: children,
      onValueChanged: themeChange.toggleThemeMode,
    );
  }
}
