import 'package:flutter/material.dart';

class ButtonGrid extends StatelessWidget {
  final Map<String, void Function()> buttonData;
  final int crossAxisCount;

  const ButtonGrid({
    super.key,
    required this.crossAxisCount,
    required this.buttonData,
  });

  @override
  Widget build(BuildContext context) {
    final int buttonCount = buttonData.length;
    final int rowCount = (buttonCount / crossAxisCount).ceil();
    final int lastRowCount = buttonCount % crossAxisCount;
    final List<String> buttonKeys = buttonData.keys.toList();
    final List<void Function()> buttonValues = buttonData.values.toList();

    return Column(
      children: [
        for (int i = 0; i < rowCount; i++)
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int j = 0; j < crossAxisCount; j++)
                  Expanded(
                    child: i == rowCount - 1 && j >= lastRowCount
                        ? const SizedBox.shrink()
                        : TextButton(
                            onPressed: buttonValues[i * crossAxisCount + j],
                            child: Text(
                              buttonKeys[i * crossAxisCount + j],
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                          ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
