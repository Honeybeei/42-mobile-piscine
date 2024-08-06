import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({
    super.key,
    this.title = 'HomeScreen',
  });

  void _onButtonPressed() {
    print("Button Pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "A Simple Text",
              style: TextStyle(fontSize: 30),
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
