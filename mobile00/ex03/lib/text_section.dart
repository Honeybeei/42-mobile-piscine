import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final TextEditingController expressionController;
  final TextEditingController resultController;

  const TextSection({
    super.key,
    required this.expressionController,
    required this.resultController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Column(
        children: [
          TextField(
            controller: expressionController,
            readOnly: true,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.transparent,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: resultController,
            readOnly: true,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
