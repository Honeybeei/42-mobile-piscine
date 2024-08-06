// ignore_for_file: avoid_print

import 'package:ex03/error_handling.dart';

String calculationLogic(String expression) {
  if (expression.isEmpty) {
    throw ErrorHandling.emptyExpression();
  }
  _checkExpression(expression);
  final List<String> tokens = _tokenize(expression);
  _checkTokens(tokens);
  _handlePlusMinusOperator(tokens);
  final double result = _calculate(tokens);
  return result.toString();
}

void _checkExpression(String expression) {
  // check if there is an operator at the start
  if (expression.startsWith("+") || expression.startsWith("-")) {
    throw ErrorHandling.operatorAtStart();
  }
  // check if there is an operator at the end
  if (_isOperator(expression[expression.length - 1])) {
    throw ErrorHandling.operatorAtEnd();
  }
  // check if there are two operators in a row
  for (int i = 0; i < expression.length - 1; i++) {
    if (_isOperator(expression[i]) && _isOperator(expression[i + 1])) {
      // exceptions: +-, ×-, ÷-
      if ((expression[i] == '+' && expression[i + 1] == '-') |
          (expression[i] == '×' && expression[i + 1] == '-') |
          (expression[i] == '÷' && expression[i + 1] == '-')) {
        continue;
      }
      throw ErrorHandling.twoOperatorsInARow(expression[i], expression[i + 1]);
    }
  }
}

void _checkTokens(List<String> tokens) {
  for (int i = 0; i < tokens.length; i++) {
    if (!_isOperator(tokens[i])) {
      // check if there is more than two dots in a number
      if (tokens[i].contains(".")) {
        final List<String> splitToken = tokens[i].split(".");
        if (splitToken.length > 2) {
          throw ErrorHandling.moreThanTwoDotsInANumber(tokens[i]);
        }
      }
      // check if the number is parsable
      try {
        double.parse(tokens[i]);
      } catch (e) {
        throw ErrorHandling.invalidNumber(tokens[i]);
      }
      // check if there is a zero at the start of a number
      if (tokens[i].startsWith("0") && tokens[i].length > 1) {
        throw ErrorHandling.invalidNumber(tokens[i]);
      }
    }
  }
}

List<String> _tokenize(String expression) {
  final List<String> tokens = [];
  String currentToken = "";
  for (int i = 0; i < expression.length; i++) {
    final String char = expression[i];
    if (_isOperator(char)) {
      if (currentToken.isNotEmpty) {
        tokens.add(currentToken);
        currentToken = "";
      }
      tokens.add(char);
    } else {
      currentToken += char;
    }
  }
  if (currentToken.isNotEmpty) {
    tokens.add(currentToken);
  }
  return tokens;
}

bool _isOperator(String char) {
  return char == "+" || char == "-" || char == "×" || char == "÷";
}

void _printTokens(List<String> tokens) {
  print("Tokens:");
  for (int i = 0; i < tokens.length; i++) {
    print("Token $i: ${tokens[i]}");
  }
}

// Merge minus operators with the number that follows them, delete plus operators
void _handlePlusMinusOperator(List<String> tokens) {
  for (int i = 0; i < tokens.length; i++) {
    if (tokens[i] == '-') {
      if (i == tokens.length - 1) {
        throw ErrorHandling.operatorAtEnd();
      } else if (_isOperator(tokens[i + 1])) {
        throw ErrorHandling.twoOperatorsInARow(tokens[i], tokens[i + 1]);
      } else {
        tokens[i + 1] = "-${tokens[i + 1]}";
        tokens.removeAt(i);
        i--;
      }
    } else if (tokens[i] == '+') {
      tokens.removeAt(i);
      i--;
    }
  }
}

double _calculate(List<String> tokens) {
  final List<double> numbers = [];
  for (int i = 0; i < tokens.length; i++) {
    if (!_isOperator(tokens[i])) {
      numbers.add(double.parse(tokens[i]));
    } else {
      if (tokens[i] == "×") {
        numbers[numbers.length - 2] *= numbers[numbers.length - 1];
      } else if (tokens[i] == "÷") {
        if (numbers[numbers.length - 1] == 0) {
          throw ErrorHandling.divisionByZero();
        }
        numbers[numbers.length - 2] /= numbers[numbers.length - 1];
      }
    }
  }
  double result = numbers[0];
  for (int i = 1; i < numbers.length; i++) {
    result += numbers[i];
  }
  return result;
}
