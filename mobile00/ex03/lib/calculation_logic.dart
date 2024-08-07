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

  // Handle potential overflow for integer results
  if (result.isFinite && result % 1 == 0) {
    try {
      return result.toInt().toString();
    } catch (e) {
      // If integer overflow occurs, return as double
      return result.toString();
    }
  } else {
    return result.toString();
  }
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
      if (tokens[i].contains(".")) {
        // check if the number starts with a dot
        if (tokens[i].startsWith(".")) {
          throw ErrorHandling.invalidNumber(tokens[i]);
        }
        // check if the number ends with a dot
        if (tokens[i].endsWith(".")) {
          throw ErrorHandling.invalidNumber(tokens[i]);
        }
        // check if there is more than two dots in a number
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
      // check if there is a zero at the start of a number that is not a decimal
      if (tokens[i].startsWith("0") &&
          tokens[i].length > 1 &&
          tokens[i][1] != ".") {
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

bool _isOverflowed(double result) {
  const double expectedMin = -2147483648; // 2^31
  const double expectedMax = 2147483647; // 2^31 - 1
  if (result.isInfinite ||
      result.isNaN ||
      result < expectedMin ||
      result > expectedMax) {
    return true;
  } else {
    return false;
  }
}

double _calculate(List<String> tokens) {
  final List<double> numbers = [];
  // calculate multiplication and division first
  for (int i = 0; i < tokens.length; i++) {
    String previousToken;
    String currentToken;
    String nextToken;
    // set tokens
    if (i > 0) {
      previousToken = tokens[i - 1];
    } else {
      previousToken = "";
    }
    currentToken = tokens[i];
    if (i < tokens.length - 1) {
      nextToken = tokens[i + 1];
    } else {
      nextToken = "";
    }
    // calculate multiplication and division
    if (currentToken == "×") {
      // handle multiplication
      final double n1 = numbers.removeLast();
      final double n2 = double.parse(nextToken);
      i++;
      final double result = n1 * n2;
      // check for overflow
      if (_isOverflowed(result)) {
        throw ErrorHandling.invalidCalculation(
            extraMessage: "× $nextToken caused overflow");
      }
      numbers.add(result);
    } else if (tokens[i] == "÷") {
      // handle division
      final double n1 = numbers.removeLast();
      final double n2 = double.parse(nextToken);
      i++;
      if (n2 == 0) {
        throw ErrorHandling.invalidCalculation(
            extraMessage: "division by zero: $previousToken ÷ $nextToken");
      }
      final double result = n1 / n2;
      // check for overflow
      if (_isOverflowed(result)) {
        throw ErrorHandling.invalidCalculation(
            extraMessage: "÷ $nextToken caused overflow");
      }
      numbers.add(result);
    } else {
      // add number to list
      final double result = double.parse(currentToken);
      if (_isOverflowed(result)) {
        throw ErrorHandling.invalidCalculation(
            extraMessage: "number $currentToken caused overflow");
      }
      numbers.add(result);
    }
  }
  // add all
  double result = 0;
  for (int i = 0; i < numbers.length; i++) {
    result += numbers[i];
    if (_isOverflowed(result)) {
      throw ErrorHandling.invalidCalculation(
          extraMessage: "sum caused overflow");
    }
  }
  return result;
}
