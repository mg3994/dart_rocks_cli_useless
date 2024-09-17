List<String> rgbInfer(String rgb) {
  final regex = RegExp(r'rgb\((\d+),(\d+),(\d+)\)');
  final match = regex.firstMatch(rgb);
  if (match != null) {
    return [match.group(1)!, match.group(2)!, match.group(3)!];
  }
  return [];
}

List<int> rgbInferNumber(String rgb) {
  final regex = RegExp(r'rgb\((\d+),(\d+),(\d+)\)');
  final match = regex.firstMatch(rgb);
  if (match != null) {
    return [
      int.parse(match.group(1)!),
      int.parse(match.group(2)!),
      int.parse(match.group(3)!)
    ];
  }
  return [];
}

void main() {
  final validRgb = rgbInfer('rgb(1,2,3)');
  print('Valid RGB: $validRgb'); // Output: Valid RGB: [1, 2, 3]

  final validRgbNumber = rgbInferNumber('rgb(1,2,3)');
  print(
      'Valid RGB Number: $validRgbNumber'); // Output: Valid RGB Number: [1, 2, 3]

  final invalidRgb = rgbInferNumber('rgb(1,2,a)');
  print('Invalid RGB: $invalidRgb'); // Output: Invalid RGB: []
}
