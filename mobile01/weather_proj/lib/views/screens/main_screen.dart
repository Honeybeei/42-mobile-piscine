import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(widget.title),
      ),
    );
  }
}
