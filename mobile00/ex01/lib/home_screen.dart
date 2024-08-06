import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({
    super.key,
    this.title = 'HomeScreen',
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isButtonPressed = false;

  void _onButtonPressed() {
    setState(() {
      _isButtonPressed = !_isButtonPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _isButtonPressed ? "Hello world!" : "A simple text",
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: _onButtonPressed,
              child: const Text("Click me!"),
            ),
          ],
        )),
      ),
    );
  }
}
