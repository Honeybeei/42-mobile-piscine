import 'package:ex02/button_data.dart';
import 'package:ex02/button_grid.dart';
import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  final TextEditingController expressionController;
  final TextEditingController resultController;
  const ButtonSection({
    super.key,
    required this.expressionController,
    required this.resultController,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Map<String, void Function()> buttonData;
    int crossAxisCount;
    if (width < 600) {
      buttonData = ButtonData.forSmallScreen;
      crossAxisCount = 4;
    } else {
      buttonData = ButtonData.forLargeScreen;
      crossAxisCount = 6;
    }

    return Container(
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer),
      child: ButtonGrid(
        crossAxisCount: crossAxisCount,
        buttonData: buttonData,
      ),
    );
  }
}
