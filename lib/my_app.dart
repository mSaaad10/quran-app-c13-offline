import 'package:flutter/material.dart';
import 'package:islami_c13_offline/config/theme/app_theme.dart';
import 'package:islami_c13_offline/core/routes_manager/routes_manager.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      routes: RoutesManager.routes,
      initialRoute: RoutesManager.onboarding,
    );
  }
}
