import 'package:ex02/button_section.dart';
import 'package:ex02/text_section.dart';
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
  // Text editing controller for the expression and result
  final TextEditingController expressionController = TextEditingController();
  final TextEditingController resultController = TextEditingController();

  @override
  void initState() {
    super.initState();
    expressionController.text = '0';
    resultController.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextSection(
                expressionController: expressionController,
                resultController: resultController,
              ),
            ),
            Expanded(
              child: ButtonSection(
                expressionController: expressionController,
                resultController: resultController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
