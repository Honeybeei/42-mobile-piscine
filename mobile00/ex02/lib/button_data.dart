// ignore_for_file: avoid_print

// small screen 4 x 5
// AC, C,  =, +
//  7, 8,  9, -
//  4, 5,  6, ×
//  1, 2,  3, ÷
//  0, ., 00

// large screen 6 x 5
// 7, 8,  9, AC, C, =
// 4, 5,  6,  +, -, ×
// 1, 2,  3,  ÷, (, )
// 0, ., 00,

class ButtonData {
  static final Map<String, void Function()> forSmallScreen = {
    'AC': () => print('Button pressed: AC'),
    'C': () => print('Button pressed: C'),
    '=': () => print('Button pressed: ='),
    '+': () => print('Button pressed: +'),
    '7': () => print('Button pressed: 7'),
    '8': () => print('Button pressed: 8'),
    '9': () => print('Button pressed: 9'),
    '-': () => print('Button pressed: -'),
    '4': () => print('Button pressed: 4'),
    '5': () => print('Button pressed: 5'),
    '6': () => print('Button pressed: 6'),
    '×': () => print('Button pressed: ×'),
    '1': () => print('Button pressed: 1'),
    '2': () => print('Button pressed: 2'),
    '3': () => print('Button pressed: 3'),
    '÷': () => print('Button pressed: ÷'),
    '0': () => print('Button pressed: 0'),
    '.': () => print('Button pressed: .'),
    '00': () => print('Button pressed: 00'),
  };
  static final Map<String, void Function()> forLargeScreen = {
    '7': () => print('Button pressed: 7'),
    '8': () => print('Button pressed: 8'),
    '9': () => print('Button pressed: 9'),
    'AC': () => print('Button pressed: AC'),
    'C': () => print('Button pressed: C'),
    '=': () => print('Button pressed: ='),
    '4': () => print('Button pressed: 4'),
    '5': () => print('Button pressed: 5'),
    '6': () => print('Button pressed: 6'),
    '+': () => print('Button pressed: +'),
    '-': () => print('Button pressed: -'),
    '×': () => print('Button pressed: ×'),
    '1': () => print('Button pressed: 1'),
    '2': () => print('Button pressed: 2'),
    '3': () => print('Button pressed: 3'),
    '÷': () => print('Button pressed: ÷'),
    '(': () => print('Button pressed: ('),
    ')': () => print('Button pressed: )'),
    '0': () => print('Button pressed: 0'),
    '.': () => print('Button pressed: .'),
    '00': () => print('Button pressed: 00'),
  };
}
