class ErrorHandling {
  static Exception emptyExpression() {
    return Exception("Expression is empty");
  }

  static Exception operatorAtStart() {
    return Exception("Operator at the start of the expression");
  }

  static Exception operatorAtEnd() {
    return Exception("Operator at the end of the expression");
  }

  static Exception twoOperatorsInARow(String operator1, String operator2) {
    return Exception("Two operators in a row: $operator1 $operator2");
  }

  static Exception moreThanTwoDotsInANumber(String number) {
    return Exception("Two dots in a number: $number");
  }

  static Exception invalidNumber(String number) {
    return Exception("Invalid number: $number");
  }

  static Exception divisionByZero() {
    return Exception("Division by zero");
  }

  static Exception invalidExpression(String expression) {
    return Exception("Invalid expression: $expression");
  }

  static Exception invalidOperator(String operator) {
    return Exception("Invalid operator: $operator");
  }

  static Exception invalidCalculation({String extraMessage = ""}) {
    return Exception("Invalid calculation: $extraMessage");
  }

  static Exception somethingWrongHere({String extraMessage = ""}) {
    return Exception("Something went wrong - $extraMessage");
  }
}
