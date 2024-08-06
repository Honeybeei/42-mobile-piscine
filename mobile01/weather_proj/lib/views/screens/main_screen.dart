import 'package:flutter/material.dart';
import 'package:weather_proj/views/widgets/main_app_bar.dart';

class MainScreen extends StatefulWidget {
  final String title;

  const MainScreen({
    super.key,
    this.title = 'MainScreen',
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actionsIconTheme: ,),
      body: Center(
        child: Text(widget.title),
      ),
    );
  }
}
