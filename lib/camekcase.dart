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

// // void main() {
// //   const snakeCased = 'hello_youtube';
// //   final camelCased = toCamelCase(snakeCased);

// //   print('Snake Cased: $snakeCased');
// //   print('Camel Cased: $camelCased');
// // }

// ///////////
// ///
// ///
// String toCamelCase(String input) {
//   final separators = ['_', '-'];
//   final buffer = StringBuffer();
//   bool uppercaseNext = false;

//   for (var i = 0; i < input.length; i++) {
//     final char = input[i];
//     if (separators.contains(char)) {
//       uppercaseNext = true;
//     } else {
//       if (uppercaseNext) {
//         buffer.write(char.toUpperCase());
//         uppercaseNext = false;
//       } else {
//         buffer.write(char);
//       }
//     }
//   }

//   return buffer.toString();
// }

// String toPascalCase(String input) {
//   final camelCase = toCamelCase(input);
//   return camelCase[0].toUpperCase() + camelCase.substring(1);
// }

// String toKebabCase(String input) {
//   return input.replaceAll('_', '-').toLowerCase();
// }

// String toSnakeCase(String input) {
//   return input.replaceAll('-', '_').toLowerCase();
// }

// void main() {
//    String snakeCased = 'hello_youtube';
//   const kebabCased = 'hello-youtube';

//   final camelCased = toCamelCase(snakeCased);
//   final pascalCased = toPascalCase(snakeCased);
//   final kebabCasedFromSnake = toKebabCase(snakeCased);
//   final snakeCasedFromKebab = toSnakeCase(kebabCased);

//   print('Snake Cased: $snakeCased');
//   print('Camel Cased: $camelCased');
//   print('Pascal Cased: $pascalCased');
//   print('Kebab Cased from Snake: $kebabCasedFromSnake');
//   print('Snake Cased from Kebab: $snakeCasedFromKebab');
// }

//////////
///
///
extension StringCasingExtensions on String {
  String toCamelCase() {
    final separators = ['_', '-'];
    final buffer = StringBuffer();
    bool uppercaseNext = false;

    for (var i = 0; i < length; i++) {
      final char = this[i];
      if (separators.contains(char)) {
        uppercaseNext = true;
      } else {
        if (uppercaseNext) {
          buffer.write(char.toUpperCase());
          uppercaseNext = false;
        } else {
          buffer.write(char);
        }
      }
    }

    return buffer.toString();
  }

  String toPascalCase() {
    final camelCase = toCamelCase();
    return camelCase[0].toUpperCase() + camelCase.substring(1);
  }

  String toKebabCase() {
    return replaceAll('_', '-').toLowerCase();
  }

  String toSnakeCase() {
    return replaceAll('-', '_').toLowerCase();
  }
}

void main() {
  const snakeCased = 'hello9_youtube';
  const kebabCased = 'hello-youtube9';

  final camelCased = snakeCased.toCamelCase();
  final pascalCased = snakeCased.toPascalCase();
  final kebabCasedFromSnake = snakeCased.toKebabCase();
  final snakeCasedFromKebab = kebabCased.toSnakeCase();

  print('Snake Cased: $snakeCased');
  print('Camel Cased: $camelCased');
  print('Pascal Cased: $pascalCased');
  print('Kebab Cased from Snake: $kebabCasedFromSnake');
  print('Snake Cased from Kebab: $snakeCasedFromKebab');
}
