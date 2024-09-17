// // // // import 'dart:core';

// // // // typedef Numbers = String;
// // // // typedef Parentheses = String;
// // // // typedef Signs = String;

// // // // const List<Numbers> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
// // // // const List<Parentheses> parentheses = ['(', ')'];
// // // // const List<Signs> signs = ['+', '-', '*', '/'];

// // // // bool isNumber(String char) => numbers.contains(char);
// // // // bool isParenthesis(String char) => parentheses.contains(char);
// // // // bool isSign(String char) => signs.contains(char);

// // // // bool isEmpty(String str) => str.isEmpty;

// // // // String remove(String str, String toRemove) {
// // // //   return str.replaceAll(toRemove, '');
// // // // }

// // // // String first(String str) {
// // // //   return isEmpty(str) ? '' : str[0];
// // // // }

// // // // bool correctStart(String str) {
// // // //   if (isEmpty(str)) return false;
// // // //   String head = first(str);
// // // //   if (isNumber(head)) {
// // // //     return true;
// // // //   } else if (head == '(') {
// // // //     return true;
// // // //   }
// // // //   return false;
// // // // }

// // // // bool isNextAllowed(String str) {
// // // //   if (isEmpty(str)) return true;
// // // //   String head = first(str);
// // // //   String remaining = str.substring(1);
// // // //   if (isNumber(head)) {
// // // //     return isNextAllowed(remaining);
// // // //   } else if (isSign(head)) {
// // // //     return isNextAllowed(remaining);
// // // //   } else if (isParenthesis(head)) {
// // // //     return isNextAllowed(remaining);
// // // //   }
// // // //   return false;
// // // // }

// // // // String onlyBrackets(String str) {
// // // //   String result = str;
// // // //   for (var char in str.split('')) {
// // // //     if (!isParenthesis(char)) {
// // // //       result = remove(result, char);
// // // //     }
// // // //   }
// // // //   return result;
// // // // }

// // // // bool parenthesesCheck(String str, [List<String> stack = const []]) {
// // // //   if (isEmpty(str)) return stack.isEmpty;
// // // //   String head = first(str);
// // // //   String remaining = str.substring(1);
// // // //   if (head == '(') {
// // // //     return parenthesesCheck(remaining, ['(', ...stack]);
// // // //   } else if (head == ')') {
// // // //     if (stack.isNotEmpty && stack.first == '(') {
// // // //       return parenthesesCheck(remaining, stack.sublist(1));
// // // //     } else {
// // // //       return false;
// // // //     }
// // // //   }
// // // //   return parenthesesCheck(remaining, stack);
// // // // }

// // // // bool calculator(String str) {
// // // //   String noSpace = remove(str, ' ');
// // // //   return parenthesesCheck(onlyBrackets(str)) &&
// // // //       correctStart(noSpace) &&
// // // //       isNextAllowed(noSpace);
// // // // }

// // // // void validate(String input) {
// // // //   if (!calculator(input)) {
// // // //     throw ArgumentError('Invalid input: $input');
// // // //   }
// // // // }

// // // // void main() {
// // // //   const expressions = [
// // // //     "(1 * (2 + 3))",
// // // //     "3 * (5 + 2) / (4 - 1)",
// // // //     "((7 - 2) * 4) / (3 + 1)",
// // // //     "10 - ((2 + 3) * 4)",
// // // //     "((2 * 3) + 5) / (6 - 1)",
// // // //     "(1 + 2) * 3 - 4 / (5 + 6)",
// // // //     "2 * ((3 + 4) * (5 - 1)) / 6",
// // // //     "((8 / 2) + (7 * 2)) * (9 - 1)",
// // // //     "(2 * (3 + 4) / (5 - 1))",
// // // //     "(10 - 2) / (3 + (5 - 4))"
// // // //   ];

// // // //   for (var expr in expressions) {
// // // //     validate(expr);
// // // //     print('Valid: $expr');
// // // //   }

// // // //   const invalidExpressions = [
// // // //     "(4 * 6 + 3) / )2 - 1(",
// // // //     "3 * / 2",
// // // //     "(2+3)*(4-)",
// // // //     "5 + * 3",
// // // //     "((7 - 2) * 4 / (3 + 1)",
// // // //     "2 * (3 + 4)) * (5 - 1)) / 6",
// // // //     "((8 / 2) + (7 * 2)) * (9 - 1",
// // // //     "2 * (3 + 4) / (5 - 1))",
// // // //     "(10 - 2) / (3 + (5 - 4)) + "
// // // //   ];

// // // //   for (var expr in invalidExpressions) {
// // // //     try {
// // // //       validate(expr);
// // // //       print('Valid: $expr');
// // // //     } catch (e) {
// // // //       print('Invalid: $expr');
// // // //     }
// // // //   }
// // // // }

// // // /////////////////////
// // // ///
// // // ///
// // // ///
// // // import 'dart:core';

// // // typedef Numbers = String;
// // // typedef Parentheses = String;
// // // typedef Signs = String;
// // // typedef Braces = String;
// // // typedef Brackets = String;

// // // const List<Numbers> numbers = [
// // //   '0',
// // //   '1',
// // //   '2',
// // //   '3',
// // //   '4',
// // //   '5',
// // //   '6',
// // //   '7',
// // //   '8',
// // //   '9'
// // // ];
// // // const List<Parentheses> parentheses = ['(', ')'];
// // // const List<Braces> braces = ['{', '}'];
// // // const List<Brackets> brackets = ['[', ']'];
// // // const List<Signs> signs = ['+', '-', '*', '/'];

// // // bool isNumber(String char) => numbers.contains(char);
// // // bool isParenthesis(String char) => parentheses.contains(char);
// // // bool isBrace(String char) => braces.contains(char);
// // // bool isBracket(String char) => brackets.contains(char);
// // // bool isSign(String char) => signs.contains(char);

// // // bool isEmpty(String str) => str.isEmpty;

// // // String remove(String str, String toRemove) {
// // //   return str.replaceAll(toRemove, '');
// // // }

// // // String first(String str) {
// // //   return isEmpty(str) ? '' : str[0];
// // // }

// // // bool correctStart(String str) {
// // //   if (isEmpty(str)) return false;
// // //   String head = first(str);
// // //   if (isNumber(head)) {
// // //     return true;
// // //   } else if (head == '(' || head == '{' || head == '[') {
// // //     return true;
// // //   }
// // //   return false;
// // // }

// // // bool isNextAllowed(String str) {
// // //   if (isEmpty(str)) return true;
// // //   String head = first(str);
// // //   String remaining = str.substring(1);
// // //   if (isNumber(head)) {
// // //     return isNextAllowed(remaining);
// // //   } else if (isSign(head)) {
// // //     return isNextAllowed(remaining);
// // //   } else if (isParenthesis(head) || isBrace(head) || isBracket(head)) {
// // //     return isNextAllowed(remaining);
// // //   }
// // //   return false;
// // // }

// // // String onlyBrackets(String str) {
// // //   String result = str;
// // //   for (var char in str.split('')) {
// // //     if (!isParenthesis(char) && !isBrace(char) && !isBracket(char)) {
// // //       result = remove(result, char);
// // //     }
// // //   }
// // //   return result;
// // // }

// // // bool parenthesesCheck(String str, [List<String> stack = const []]) {
// // //   if (isEmpty(str)) return stack.isEmpty;
// // //   String head = first(str);
// // //   String remaining = str.substring(1);
// // //   if (head == '(' || head == '{' || head == '[') {
// // //     return parenthesesCheck(remaining, [head, ...stack]);
// // //   } else if (head == ')' || head == '}' || head == ']') {
// // //     if (stack.isNotEmpty &&
// // //         ((head == ')' && stack.first == '(') ||
// // //             (head == '}' && stack.first == '{') ||
// // //             (head == ']' && stack.first == '['))) {
// // //       return parenthesesCheck(remaining, stack.sublist(1));
// // //     } else {
// // //       return false;
// // //     }
// // //   }
// // //   return parenthesesCheck(remaining, stack);
// // // }

// // // bool calculator(String str) {
// // //   String noSpace = remove(str, ' ');
// // //   return parenthesesCheck(onlyBrackets(str)) &&
// // //       correctStart(noSpace) &&
// // //       isNextAllowed(noSpace);
// // // }

// // // void validate(String input) {
// // //   if (!calculator(input)) {
// // //     throw ArgumentError('Invalid input: $input');
// // //   }
// // // }

// // // void main() {
// // //   const expressions = [
// // //     "(1 * (2 + 3))",
// // //     "3 * (5 + 2) / (4 - 1)",
// // //     "((7 - 2) * 4) / (3 + 1)",
// // //     "10 - ((2 + 3) * 4)",
// // //     "((2 * 3) + 5) / (6 - 1)",
// // //     "(1 + 2) * 3 - 4 / (5 + 6)",
// // //     "2 * ((3 + 4) * (5 - 1)) / 6",
// // //     "((8 / 2) + (7 * 2)) * (9 - 1)",
// // //     "(2 * (3 + 4) / (5 - 1))",
// // //     "(10 - 2) / (3 + (5 - 4))",
// // //     "{(1 + 2) * [3 - 4] / (5 + 6)}",
// // //     "[2 * {3 + 4} * (5 - 1)] / 6",
// // //     "{((8 / 2) + (7 * 2)) * (9 - 1)}",
// // //     "[2 * (3 + 4) / (5 - 1)]",
// // //     "{(10 - 2) / [3 + (5 - 4)]}"
// // //   ];

// // //   for (var expr in expressions) {
// // //     try {
// // //       validate(expr);
// // //       print('Valid: $expr');
// // //     } catch (e) {
// // //       print('Invalid: $expr');
// // //     }
// // //   }

// // //   const invalidExpressions = [
// // //     "(4 * 6 + 3) / )2 - 1(",
// // //     "3 * / 2",
// // //     "(2+3)*(4-)",
// // //     "5 + * 3",
// // //     "((7 - 2) * 4 / (3 + 1)",
// // //     "2 * (3 + 4)) * (5 - 1)) / 6",
// // //     "((8 / 2) + (7 * 2)) * (9 - 1",
// // //     "2 * (3 + 4) / (5 - 1))",
// // //     "(10 - 2) / (3 + (5 - 4)) + ",
// // //     "{4 * 6 + 3) / 2 - 1}",
// // //     "[3 * / 2]",
// // //     "{2+3)*(4-}",
// // //     "[5 + * 3]",
// // //     "{((7 - 2) * 4 / (3 + 1)}",
// // //     "[2 * (3 + 4)) * (5 - 1)] / 6",
// // //     "{((8 / 2) + (7 * 2)) * (9 - 1]",
// // //     "[2 * (3 + 4) / (5 - 1)}",
// // //     "{(10 - 2) / (3 + (5 - 4)] + "
// // //   ];

// // //   for (var expr in invalidExpressions) {
// // //     try {
// // //       validate(expr);
// // //       print('Valid: $expr');
// // //     } catch (e) {
// // //       print('Invalid: $expr');
// // //     }
// // //   }
// // // }
// // // //
// // /////////////
// // ///
// // ///
// // import 'dart:core';
// // import 'package:expressions/expressions.dart';

// // typedef Numbers = String;
// // typedef Parentheses = String;
// // typedef Signs = String;
// // typedef Braces = String;
// // typedef Brackets = String;

// // const List<Numbers> numbers = [
// //   '0',
// //   '1',
// //   '2',
// //   '3',
// //   '4',
// //   '5',
// //   '6',
// //   '7',
// //   '8',
// //   '9'
// // ];
// // const List<Parentheses> parentheses = ['(', ')'];
// // const List<Braces> braces = ['{', '}'];
// // const List<Brackets> brackets = ['[', ']'];
// // const List<Signs> signs = ['+', '-', '*', '/'];

// // bool isNumber(String char) => numbers.contains(char);
// // bool isParenthesis(String char) => parentheses.contains(char);
// // bool isBrace(String char) => braces.contains(char);
// // bool isBracket(String char) => brackets.contains(char);
// // bool isSign(String char) => signs.contains(char);

// // bool isEmpty(String str) => str.isEmpty;

// // String remove(String str, String toRemove) {
// //   return str.replaceAll(toRemove, '');
// // }

// // String first(String str) {
// //   return isEmpty(str) ? '' : str[0];
// // }

// // bool correctStart(String str) {
// //   if (isEmpty(str)) return false;
// //   String head = first(str);
// //   if (isNumber(head)) {
// //     return true;
// //   } else if (head == '(' || head == '{' || head == '[') {
// //     return true;
// //   }
// //   return false;
// // }

// // bool isNextAllowed(String str) {
// //   if (isEmpty(str)) return true;
// //   String head = first(str);
// //   String remaining = str.substring(1);
// //   if (isNumber(head)) {
// //     return isNextAllowed(remaining);
// //   } else if (isSign(head)) {
// //     return isNextAllowed(remaining);
// //   } else if (isParenthesis(head) || isBrace(head) || isBracket(head)) {
// //     return isNextAllowed(remaining);
// //   }
// //   return false;
// // }

// // String onlyBrackets(String str) {
// //   String result = str;
// //   for (var char in str.split('')) {
// //     if (!isParenthesis(char) && !isBrace(char) && !isBracket(char)) {
// //       result = remove(result, char);
// //     }
// //   }
// //   return result;
// // }

// // bool parenthesesCheck(String str, [List<String> stack = const []]) {
// //   if (isEmpty(str)) return stack.isEmpty;
// //   String head = first(str);
// //   String remaining = str.substring(1);
// //   if (head == '(' || head == '{' || head == '[') {
// //     return parenthesesCheck(remaining, [head, ...stack]);
// //   } else if (head == ')' || head == '}' || head == ']') {
// //     if (stack.isNotEmpty &&
// //         ((head == ')' && stack.first == '(') ||
// //             (head == '}' && stack.first == '{') ||
// //             (head == ']' && stack.first == '['))) {
// //       return parenthesesCheck(remaining, stack.sublist(1));
// //     } else {
// //       return false;
// //     }
// //   }
// //   return parenthesesCheck(remaining, stack);
// // }

// // bool calculator(String str) {
// //   String noSpace = remove(str, ' ');
// //   return parenthesesCheck(onlyBrackets(str)) &&
// //       correctStart(noSpace) &&
// //       isNextAllowed(noSpace);
// // }

// // void validate(String input) {
// //   if (!calculator(input)) {
// //     throw ArgumentError('Invalid input: $input');
// //   }
// // }

// // dynamic evaluateExpression(String expression) {
// //   final parser = ExpressionEvaluator();
// //   final exp = Expression.parse(expression
// //       .replaceAll('{', '(')
// //       .replaceAll('}', ')')
// //       .replaceAll('[', '(')
// //       .replaceAll(']', ')'));
// //   final evaluator = const ExpressionEvaluator();
// //   return evaluator.eval(exp, {});
// // }

// // void main() {
// //   const expressions = [
// //     "(1 * (2 + 3))",
// //     "3 * (5 + 2) / (4 - 1)",
// //     "((7 - 2) * 4) / (3 + 1)",
// //     "10 - ((2 + 3) * 4)",
// //     "((2 * 3) + 5) / (6 - 1)",
// //     "(1 + 2) * 3 - 4 / (5 + 6)",
// //     "2 * ((3 + 4) * (5 - 1)) / 6",
// //     "((8 / 2) + (7 * 2)) * (9 - 1)",
// //     "(2 * (3 + 4) / (5 - 1))",
// //     "(10 - 2) / (3 + (5 - 4))",
// //     "{(1 + 2) * [3 - 4] / (5 + 6)}",
// //     "[2 * {3 + 4} * (5 - 1)] / 6",
// //     "{((8 / 2) + (7 * 2)) * (9 - 1)}",
// //     "[2 * (3 + 4) / (5 - 1)]",
// //     "{(10 - 2) / [3 + (5 - 4)]}",
// //     "22/7",
// //     "0.1 + 0.2"
// //   ];

// //   for (var expr in expressions) {
// //     try {
// //       validate(expr);
// //       final result = evaluateExpression(expr);
// //       print('Valid: $expr = $result');
// //     } catch (e) {
// //       print('Invalid: $expr');
// //     }
// //   }

// //   const invalidExpressions = [
// //     "(4 * 6 + 3) / )2 - 1(",
// //     "3 * / 2",
// //     "(2+3)*(4-)",
// //     "5 + * 3",
// //     "((7 - 2) * 4 / (3 + 1)",
// //     "2 * (3 + 4)) * (5 - 1)) / 6",
// //     "((8 / 2) + (7 * 2)) * (9 - 1",
// //     "2 * (3 + 4) / (5 - 1))",
// //     "(10 - 2) / (3 + (5 - 4)) + ",
// //     "{4 * 6 + 3) / 2 - 1}",
// //     "[3 * / 2]",
// //     "{2+3)*(4-}",
// //     "[5 + * 3]",
// //     "{((7 - 2) * 4 / (3 + 1)}",
// //     "[2 * (3 + 4)) * (5 - 1)] / 6",
// //     "{((8 / 2) + (7 * 2)) * (9 - 1]",
// //     "[2 * (3 + 4) / (5 - 1)}",
// //     "{(10 - 2) / (3 + (5 - 4)] + ",
// //     "(0.1 + 0.2)"
// //   ];

// //   for (var expr in invalidExpressions) {
// //     try {
// //       validate(expr);
// //       final result = evaluateExpression(expr);
// //       print('Valid: $expr = $result');
// //     } catch (e) {
// //       print('Invalid: $expr');
// //     }
// //   }
// // }

// /////////
// ///
// ///
// import 'dart:core';
// import 'package:expressions/expressions.dart';

// typedef Numbers = String;
// typedef Parentheses = String;
// typedef Signs = String;
// typedef Braces = String;
// typedef Brackets = String;

// const List<Numbers> numbers = [
//   '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'
// ];
// const List<Parentheses> parentheses = ['(', ')'];
// const List<Braces> braces = ['{', '}'];
// const List<Brackets> brackets = ['[', ']'];
// const List<Signs> signs = ['+', '-', '*', '/'];

// bool isNumber(String char) => numbers.contains(char);
// bool isParenthesis(String char) => parentheses.contains(char);
// bool isBrace(String char) => braces.contains(char);
// bool isBracket(String char) => brackets.contains(char);
// bool isSign(String char) => signs.contains(char);

// bool isEmpty(String str) => str.isEmpty;

// String remove(String str, String toRemove) {
//   return str.replaceAll(toRemove, '');
// }

// String first(String str) {
//   return isEmpty(str) ? '' : str[0];
// }

// bool correctStart(String str) {
//   if (isEmpty(str)) return false;
//   String head = first(str);
//   if (isNumber(head)) {
//     return true;
//   } else if (head == '(' || head == '{' || head == '[') {
//     return true;
//   }
//   return false;
// }

// bool isNextAllowed(String str) {
//   if (isEmpty(str)) return true;
//   String head = first(str);
//   String remaining = str.substring(1);
//   if (isNumber(head)) {
//     return isNextAllowed(remaining);
//   } else if (isSign(head)) {
//     return isNextAllowed(remaining);
//   } else if (isParenthesis(head) || isBrace(head) || isBracket(head)) {
//     return isNextAllowed(remaining);
//   }
//   return false;
// }

// String onlyBrackets(String str) {
//   String result = str;
//   for (var char in str.split('')) {
//     if (!isParenthesis(char) && !isBrace(char) && !isBracket(char)) {
//       result = remove(result, char);
//     }
//   }
//   return result;
// }

// bool parenthesesCheck(String str, [List<String> stack = const []]) {
//   if (isEmpty(str)) return stack.isEmpty;
//   String head = first(str);
//   String remaining = str.substring(1);
//   if (head == '(' || head == '{' || head == '[') {
//     return parenthesesCheck(remaining, [head, ...stack]);
//   } else if (head == ')' || head == '}' || head == ']') {
//     if (stack.isNotEmpty &&
//         ((head == ')' && stack.first == '(') ||
//             (head == '}' && stack.first == '{') ||
//             (head == ']' && stack.first == '['))) {
//       return parenthesesCheck(remaining, stack.sublist(1));
//     } else {
//       return false;
//     }
//   }
//   return parenthesesCheck(remaining, stack);
// }

// bool calculator(String str) {
//   String noSpace = remove(str, ' ');
//   return parenthesesCheck(onlyBrackets(str)) &&
//       correctStart(noSpace) &&
//       isNextAllowed(noSpace);
// }

// void validate(String input) {
//   if (!calculator(input)) {
//     throw ArgumentError('Invalid input: $input');
//   }
// }

// dynamic evaluateExpression(String expression) {
//   // final parser = const ExpressionEvaluator(;
//   final exp = Expression.parse(expression.replaceAll('{', '(').replaceAll('}', ')').replaceAll('[', '(').replaceAll(']', ')'));
//   final evaluator = const ExpressionEvaluator();
//   return evaluator.eval(exp, {});
// }

// void main() {
//   const expressions = [
//     "(1.5 * (2.2 + 3.3))",
//     "3.1 * (5.2 + 2.3) / (4.4 - 1.1)",
//     "((7.7 - 2.2) * 4.4) / (3.3 + 1.1)",
//     "10.0 - ((2.2 + 3.3) * 4.4)",
//     "((2.2 * 3.3) + 5.5) / (6.6 - 1.1)",
//     "(1.1 + 2.2) * 3.3 - 4.4 / (5.5 + 6.6)",
//     "2.2 * ((3.3 + 4.4) * (5.5 - 1.1)) / 6.6",
//     "((8.8 / 2.2) + (7.7 * 2.2)) * (9.9 - 1.1)",
//     "(2.2 * (3.3 + 4.4) / (5.5 - 1.1))",
//     "(10.0 - 2.2) / (3.3 + (5.5 - 4.4))",
//     "{(1.1 + 2.2) * [3.3 - 4.4] / (5.5 + 6.6)}",
//     "[2.2 * {3.3 + 4.4} * (5.5 - 1.1)] / 6.6",
//     "{((8.8 / 2.2) + (7.7 * 2.2)) * (9.9 - 1.1)}",
//     "[2.2 * (3.3 + 4.4) / (5.5 - 1.1)]",
//     "{(10.0 - 2.2) / [3.3 + (5.5 - 4.4)]}",
//     "0.1 +0.2"
//   ];

//   for (var expr in expressions) {
//     try {
//       validate(expr);
//       final result = evaluateExpression(expr);
//       print('Valid: $expr = $result');
//     } catch (e) {
//       print('Invalid: $expr');
//     }
//   }

//   const invalidExpressions = [
//     "(4.4 * 6.6 + 3.3) / )2.2 - 1.1(",
//     "3.3 * / 2.2",
//     "(2.2+3.3)*(4.4-)",
//     "5.5 + * 3.3",
//     "((7.7 - 2.2) * 4.4 / (3.3 + 1.1)",
//     "2.2 * (3.3 + 4.4)) * (5.5 - 1.1)) / 6.6",
//     "((8.8 / 2.2) + (7.7 * 2.2)) * (9.9 - 1.1",
//     "2.2 * (3.3 + 4.4) / (5.5 - 1.1))",
//     "(10.0 - 2.2) / (3.3 + (5.5 - 4.4)) + ",
//     "{4.4 * 6.6 + 3.3) / 2.2 - 1.1}",
//     "[3.3 * / 2.2]",
//     "{2.2+3.3)*(4.4-}",
//     "[5.5 + * 3.3]",
//     "{((7.7 - 2.2) * 4.4 / (3.3 + 1.1)}",
//     "[2.2 * (3.3 + 4.4)) * (5.5 - 1.1)] / 6.6",
//     "{((8.8 / 2.2) + (7.7 * 2.2)) * (9.9 - 1.1]",
//     "[2.2 * (3.3 + 4.4) / (5.5 - 1.1)}",
//     "{(10.0 - 2.2) / (3.3 + (5.5 - 4.4)] + "
//   ];

//   for (var expr in invalidExpressions) {
//     try {
//       validate(expr);
//       final result = evaluateExpression(expr);
//       print('Valid: $expr = $result');
//     } catch (e) {
//       print('Invalid: $expr');
//     }
//   }
// }

import 'dart:core';
import 'package:expressions/expressions.dart';

typedef Numbers = String;
typedef Parentheses = String;
typedef Signs = String;
typedef Braces = String;
typedef Brackets = String;

const List<Numbers> numbers = [
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '.'
];
const List<Parentheses> parentheses = ['(', ')'];
const List<Braces> braces = ['{', '}'];
const List<Brackets> brackets = ['[', ']'];
const List<Signs> signs = ['+', '-', '*', '/'];

bool isNumber(String char) => numbers.contains(char);
bool isParenthesis(String char) => parentheses.contains(char);
bool isBrace(String char) => braces.contains(char);
bool isBracket(String char) => brackets.contains(char);
bool isSign(String char) => signs.contains(char);

bool isEmpty(String str) => str.isEmpty;

String remove(String str, String toRemove) {
  return str.replaceAll(toRemove, '');
}

String first(String str) {
  return isEmpty(str) ? '' : str[0];
}

bool correctStart(String str) {
  if (isEmpty(str)) return false;
  String head = first(str);
  if (isNumber(head)) {
    return true;
  } else if (head == '(' || head == '{' || head == '[') {
    return true;
  }
  return false;
}

bool isNextAllowed(String str) {
  if (isEmpty(str)) return true;
  String head = first(str);
  String remaining = str.substring(1);
  if (isNumber(head)) {
    return isNextAllowed(remaining);
  } else if (isSign(head)) {
    return isNextAllowed(remaining);
  } else if (isParenthesis(head) || isBrace(head) || isBracket(head)) {
    return isNextAllowed(remaining);
  }
  return false;
}

String onlyBrackets(String str) {
  String result = str;
  for (var char in str.split('')) {
    if (!isParenthesis(char) && !isBrace(char) && !isBracket(char)) {
      result = remove(result, char);
    }
  }
  return result;
}

bool parenthesesCheck(String str, [List<String> stack = const []]) {
  if (isEmpty(str)) return stack.isEmpty;
  String head = first(str);
  String remaining = str.substring(1);
  if (head == '(' || head == '{' || head == '[') {
    return parenthesesCheck(remaining, [head, ...stack]);
  } else if (head == ')' || head == '}' || head == ']') {
    if (stack.isNotEmpty &&
        ((head == ')' && stack.first == '(') ||
            (head == '}' && stack.first == '{') ||
            (head == ']' && stack.first == '['))) {
      return parenthesesCheck(remaining, stack.sublist(1));
    } else {
      return false;
    }
  }
  return parenthesesCheck(remaining, stack);
}

bool calculator(String str) {
  String noSpace = remove(str, ' ');
  return parenthesesCheck(onlyBrackets(str)) &&
      correctStart(noSpace) &&
      isNextAllowed(noSpace);
}

void validate(String input) {
  if (!calculator(input)) {
    throw ArgumentError('Invalid input: $input');
  }
}

dynamic evaluateExpression(String expression) {
  final parser = ExpressionEvaluator();
  final exp = Expression.parse(expression
      .replaceAll('{', '(')
      .replaceAll('}', ')')
      .replaceAll('[', '(')
      .replaceAll(']', ')'));
  final evaluator = const ExpressionEvaluator();
  return evaluator.eval(exp, {});
}

String formatResult(dynamic result) {
  if (result is double) {
    return result
        .toStringAsFixed(2); // Adjust the number of decimal places as needed
  }
  return result.toString();
}

void main() {
  const expressions = [
    "(1.5 * (2.2 + 3.3))",
    "3.1 * (5.2 + 2.3) / (4.4 - 1.1)",
    "((7.7 - 2.2) * 4.4) / (3.3 + 1.1)",
    "10.0 - ((2.2 + 3.3) * 4.4)",
    "((2.2 * 3.3) + 5.5) / (6.6 - 1.1)",
    "(1.1 + 2.2) * 3.3 - 4.4 / (5.5 + 6.6)",
    "2.2 * ((3.3 + 4.4) * (5.5 - 1.1)) / 6.6",
    "((8.8 / 2.2) + (7.7 * 2.2)) * (9.9 - 1.1)",
    "(2.2 * (3.3 + 4.4) / (5.5 - 1.1))",
    "(10.0 - 2.2) / (3.3 + (5.5 - 4.4))",
    "{(1.1 + 2.2) * [3.3 - 4.4] / (5.5 + 6.6)}",
    "[2.2 * {3.3 + 4.4} * (5.5 - 1.1)] / 6.6",
    "{((8.8 / 2.2) + (7.7 * 2.2)) * (9.9 - 1.1)}",
    "[2.2 * (3.3 + 4.4) / (5.5 - 1.1)]",
    "{(10.0 - 2.2) / [3.3 + (5.5 - 4.4)]}",
    '0.1 +0.2'
  ];

  for (var expr in expressions) {
    try {
      validate(expr);
      final result = evaluateExpression(expr);
      print('Valid: $expr = ${formatResult(result)}');
    } catch (e) {
      print('Invalid: $expr');
    }
  }

  const invalidExpressions = [
    "(4.4 * 6.6 + 3.3) / )2.2 - 1.1(",
    "3.3 * / 2.2",
    "(2.2+3.3)*(4.4-)",
    "5.5 + * 3.3",
    "((7.7 - 2.2) * 4.4 / (3.3 + 1.1)",
    "2.2 * (3.3 + 4.4)) * (5.5 - 1.1)) / 6.6",
    "((8.8 / 2.2) + (7.7 * 2.2)) * (9.9 - 1.1",
    "2.2 * (3.3 + 4.4) / (5.5 - 1.1))",
    "(10.0 - 2.2) / (3.3 + (5.5 - 4.4)) + ",
    "{4.4 * 6.6 + 3.3) / 2.2 - 1.1}",
    "[3.3 * / 2.2]",
    "{2.2+3.3)*(4.4-}",
    "[5.5 + * 3.3]",
    "{((7.7 - 2.2) * 4.4 / (3.3 + 1.1)}",
    "[2.2 * (3.3 + 4.4)) * (5.5 - 1.1)] / 6.6",
    "{((8.8 / 2.2) + (7.7 * 2.2)) * (9.9 - 1.1]",
    "[2.2 * (3.3 + 4.4) / (5.5 - 1.1)}",
    "{(10.0 - 2.2) / (3.3 + (5.5 - 4.4)] + "
  ];

  for (var expr in invalidExpressions) {
    try {
      validate(expr);
      final result = evaluateExpression(expr);
      print('Valid: $expr = ${formatResult(result)}');
    } catch (e) {
      print('Invalid: $expr');
    }
  }
}
