import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:weather_proj/views/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: FlexThemeData.light(scheme: FlexScheme.blueM3),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueM3),
      themeMode: ThemeMode.system,
      home: const MainScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
