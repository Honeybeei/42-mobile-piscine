// screen 4 x 5
// AC, C,  =, +
//  7, 8,  9, -
//  4, 5,  6, ×
//  1, 2,  3, ÷
//  0, ., 00

import 'package:ex03/calculation_logic.dart';
import 'package:flutter/material.dart';

class ButtonSet {
  final TextEditingController expressionController;
  final TextEditingController resultController;
  final BuildContext context;

  const ButtonSet({
    required this.expressionController,
    required this.resultController,
    required this.context,
  });

  void _onNumericPressed(String value) {
    if (expressionController.text == '0') {
      expressionController.text = value;
    } else {
      expressionController.text += value;
    }
  }

  void _onOperatorPressed(String value) {
    expressionController.text += value;
  }

  void _onACPressed() {
    expressionController.text = '0';
    resultController.text = '0';
  }

  void _onCPressed() {
    if (expressionController.text.length > 1) {
      expressionController.text = expressionController.text
          .substring(0, expressionController.text.length - 1);
    } else {
      expressionController.text = '0';
    }
  }

  void _onEqualPressed() {
    try {
      resultController.text = calculationLogic(expressionController.text);
    } catch (e) {
      final String message = e.toString().substring(10);
      // resultController.text = message;
      final errorSnackBar = SnackBar(
        content: Text(
          message,
          style:
              TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor:
            Theme.of(context).colorScheme.errorContainer.withOpacity(
                  0.8,
                ),
        closeIconColor: Theme.of(context).colorScheme.onErrorContainer,
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
    }
  }

  Map<String, void Function()> get buttonData {
    return {
      'AC': () {
        _onACPressed();
      },
      'C': () {
        _onCPressed();
      },
      '=': () {
        _onEqualPressed();
      },
      '+': () {
        _onOperatorPressed('+');
      },
      '7': () {
        _onNumericPressed('7');
      },
      '8': () {
        _onNumericPressed('8');
      },
      '9': () {
        _onNumericPressed('9');
      },
      '-': () {
        _onOperatorPressed('-');
      },
      '4': () {
        _onNumericPressed('4');
      },
      '5': () {
        _onNumericPressed('5');
      },
      '6': () {
        _onNumericPressed('6');
      },
      '×': () {
        _onOperatorPressed('×');
      },
      '1': () {
        _onNumericPressed('1');
      },
      '2': () {
        _onNumericPressed('2');
      },
      '3': () {
        _onNumericPressed('3');
      },
      '÷': () {
        _onOperatorPressed('÷');
      },
      '0': () {
        _onNumericPressed('0');
      },
      '.': () {
        _onOperatorPressed('.');
      },
      '00': () {
        _onNumericPressed('00');
      },
    };
  }
}
