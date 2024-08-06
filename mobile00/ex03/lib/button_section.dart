import 'package:ex03/button_set.dart';
import 'package:ex03/button_grid.dart';
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
    int crossAxisCount = 4;
    Map<String, void Function()> buttonData = ButtonSet(
      expressionController: expressionController,
      resultController: resultController,
      context: context,
    ).buttonData;

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
