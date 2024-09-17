// // // String toCamelCase(String input) {
// // //   final separators = ['_', '-'];
// // //   final buffer = StringBuffer();
// // //   bool uppercaseNext = false;

// // //   for (var i = 0; i < input.length; i++) {
// // //     final char = input[i];
// // //     if (separators.contains(char)) {
// // //       uppercaseNext = true;
// // //     } else {
// // //       if (uppercaseNext) {
// // //         buffer.write(char.toUpperCase());
// // //         uppercaseNext = false;
// // //       } else {
// // //         buffer.write(char);
// // //       }
// // //     }
// // //   }

// // //   return buffer.toString();
// // // }

// // // void main() {
// // //   const snakeCased = 'hello_youtube';
// // //   final camelCased = toCamelCase(snakeCased);

// // //   print('Snake Cased: $snakeCased');
// // //   print('Camel Cased: $camelCased');
// // // }

// // ///////////
// // ///
// // ///
// // String toCamelCase(String input) {
// //   final separators = ['_', '-'];
// //   final buffer = StringBuffer();
// //   bool uppercaseNext = false;

// //   for (var i = 0; i < input.length; i++) {
// //     final char = input[i];
// //     if (separators.contains(char)) {
// //       uppercaseNext = true;
// //     } else {
// //       if (uppercaseNext) {
// //         buffer.write(char.toUpperCase());
// //         uppercaseNext = false;
// //       } else {
// //         buffer.write(char);
// //       }
// //     }
// //   }

// //   return buffer.toString();
// // }

// // String toPascalCase(String input) {
// //   final camelCase = toCamelCase(input);
// //   return camelCase[0].toUpperCase() + camelCase.substring(1);
// // }

// // String toKebabCase(String input) {
// //   return input.replaceAll('_', '-').toLowerCase();
// // }

// // String toSnakeCase(String input) {
// //   return input.replaceAll('-', '_').toLowerCase();
// // }

// // void main() {
// //    String snakeCased = 'hello_youtube';
// //   const kebabCased = 'hello-youtube';

// //   final camelCased = toCamelCase(snakeCased);
// //   final pascalCased = toPascalCase(snakeCased);
// //   final kebabCasedFromSnake = toKebabCase(snakeCased);
// //   final snakeCasedFromKebab = toSnakeCase(kebabCased);

// //   print('Snake Cased: $snakeCased');
// //   print('Camel Cased: $camelCased');
// //   print('Pascal Cased: $pascalCased');
// //   print('Kebab Cased from Snake: $kebabCasedFromSnake');
// //   print('Snake Cased from Kebab: $snakeCasedFromKebab');
// // }

// //////////
// ///
// ///
// extension StringCasingExtensions on String {
//   String toCamelCase() {
//     final separators = ['_', '-'];
//     final buffer = StringBuffer();
//     bool uppercaseNext = false;

//     for (var i = 0; i < length; i++) {
//       final char = this[i];
//       if (separators.contains(char)) {
//         uppercaseNext = true;
//       } else {
//         if (uppercaseNext) {
//           buffer.write(char.toUpperCase());
//           uppercaseNext = false;
//         } else {
//           buffer.write(char);
//         }
//       }
//     }

//     return buffer.toString();
//   }

//   String toPascalCase() {
//     final camelCase = toCamelCase();
//     return camelCase[0].toUpperCase() + camelCase.substring(1);
//   }

//   String toKebabCase() {
//     return replaceAll('_', '-').toLowerCase();
//   }

//   String toSnakeCase() {
//     return replaceAll('-', '_').toLowerCase();
//   }
// }

// void main() {
//   const snakeCased = 'hello9_youtube';
//   const kebabCased = 'hello-youtube9';

//   final camelCased = snakeCased.toCamelCase();
//   final pascalCased = snakeCased.toPascalCase();
//   final kebabCasedFromSnake = snakeCased.toKebabCase();
//   final snakeCasedFromKebab = kebabCased.toSnakeCase();

//   print('Snake Cased: $snakeCased');
//   print('Camel Cased: $camelCased');
//   print('Pascal Cased: $pascalCased');
//   print('Kebab Cased from Snake: $kebabCasedFromSnake');
//   print('Snake Cased from Kebab: $snakeCasedFromKebab');
// }

class ReCase {
  final RegExp _upperAlphaRegex = RegExp(r'[A-Z]');

  final symbolSet = {' ', '.', '/', '_', '\\', '-'};

  late String originalText;
  late List<String> _words;

  ReCase(String text) {
    this.originalText = text;
    this._words = _groupIntoWords(text);
  }

  List<String> _groupIntoWords(String text) {
    StringBuffer sb = StringBuffer();
    List<String> words = [];
    bool isAllCaps = text.toUpperCase() == text;

    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      String? nextChar = i + 1 == text.length ? null : text[i + 1];

      if (symbolSet.contains(char)) {
        continue;
      }

      sb.write(char);

      bool isEndOfWord = nextChar == null ||
          (_upperAlphaRegex.hasMatch(nextChar) && !isAllCaps) ||
          symbolSet.contains(nextChar);

      if (isEndOfWord) {
        words.add(sb.toString());
        sb.clear();
      }
    }

    return words;
  }

  /// camelCase
  String get camelCase => _getCamelCase();

  /// CONSTANT_CASE
  String get constantCase => _getConstantCase();

  /// Sentence case
  String get sentenceCase => _getSentenceCase();

  /// snake_case
  String get snakeCase => _getSnakeCase();

  /// dot.case
  String get dotCase => _getSnakeCase(separator: '.');

  /// param-case
  String get paramCase => _getSnakeCase(separator: '-');

  /// path/case
  String get pathCase => _getSnakeCase(separator: '/');

  /// PascalCase
  String get pascalCase => _getPascalCase();

  /// Header-Case
  String get headerCase => _getPascalCase(separator: '-');

  /// Title Case
  String get titleCase => _getPascalCase(separator: ' ');

  String _getCamelCase({String separator = ''}) {
    List<String> words = this._words.map(_upperCaseFirstLetter).toList();
    if (_words.isNotEmpty) {
      words[0] = words[0].toLowerCase();
    }

    return words.join(separator);
  }

  String _getConstantCase({String separator = '_'}) {
    List<String> words = this._words.map((word) => word.toUpperCase()).toList();

    return words.join(separator);
  }

  String _getPascalCase({String separator = ''}) {
    List<String> words = this._words.map(_upperCaseFirstLetter).toList();

    return words.join(separator);
  }

  String _getSentenceCase({String separator = ' '}) {
    List<String> words = this._words.map((word) => word.toLowerCase()).toList();
    if (_words.isNotEmpty) {
      words[0] = _upperCaseFirstLetter(words[0]);
    }

    return words.join(separator);
  }

  String _getSnakeCase({String separator = '_'}) {
    List<String> words = this._words.map((word) => word.toLowerCase()).toList();

    return words.join(separator);
  }

  String _upperCaseFirstLetter(String word) {
    return '${word.substring(0, 1).toUpperCase()}${word.substring(1).toLowerCase()}';
  }
}

extension StringReCase on String {
  String get camelCase => ReCase(this).camelCase;

  String get constantCase => ReCase(this).constantCase;

  String get sentenceCase => ReCase(this).sentenceCase;

  String get snakeCase => ReCase(this).snakeCase;

  String get dotCase => ReCase(this).dotCase;

  String get paramCase => ReCase(this).paramCase;

  String get pathCase => ReCase(this).pathCase;

  String get pascalCase => ReCase(this).pascalCase;

  String get headerCase => ReCase(this).headerCase;

  String get titleCase => ReCase(this).titleCase;
}
