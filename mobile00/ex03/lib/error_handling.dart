class ErrorHandling {
  static Exception emptyExpression() {
    return Exception("Empty expression");
  }

  static Exception operatorAtStart() {
    return Exception("Operator at start");
  }

  static Exception operatorAtEnd() {
    return Exception("Operator at end");
  }

  static Exception twoOperatorsInARow(String operator1, String operator2) {
    return Exception("Two operators in a row: $operator1 $operator2");
  }

  static Exception moreThanTwoDotsInANumber(String number) {
    return Exception("More than two dots in a number: $number");
  }

  static Exception invalidNumber(String number) {
    return Exception("Invalid number: $number");
  }

  static Exception divisionByZero() {
    return Exception("Division by zero");
  }
}
