// Define ChessLetters as an enum
enum ChessLetters { A, B, C, D, E, F, G, H }

// Define ChessNumbers as an enum
enum ChessNumbers { one, two, three, four, five, six, seven, eight }

// Define BoardPositions as a list of strings
typedef BoardPositions = List<String>;

// Define GapType and GapPosition as enums
enum GapType { margin, padding }

enum GapPosition { left, right, top, bottom }

// Define GapCss as a union of GapType and GapType-GapPosition
typedef GapCss = String;

// Define SizeType as an enum
enum SizeType { rem, px }

// Define SizeCss as a string
typedef SizeCss = String;

void main() {
  // Initialize BoardPositions
  BoardPositions b = ['A1'];

  // Define RgbCss and RgbaCss as strings
  String rgbCss = 'rgb(1,2,3)';
  String rgbaCss = 'rgb(1,2,3,2)';

  // Define MarginPadding as a map
  Map<String, SizeCss> margin = {"margin-left": '1rem'};

  // Define FirstChar and StartsWithNumber as functions
  String firstChar(String str) => str.isNotEmpty ? str[0] : '';
  String startsWithNumber(String str) =>
      RegExp(r'^\d').hasMatch(str) ? str[0] : '';

  // Test the functions
  String first = firstChar('hello youtube');
  String starts = startsWithNumber('1asdf');

  print('First character: $first');
  print('Starts with number: $starts');
}
