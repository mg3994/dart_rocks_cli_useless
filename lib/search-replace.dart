class Rating {
  final String aBadLanguage;

  Rating({required this.aBadLanguage});
}

String replace(String input, String from, String to) {
  return input.replaceAll(from, to);
}

class ReplaceInObject {
  final String aCoolLanguage;

  ReplaceInObject({required this.aCoolLanguage});
}

ReplaceInObject transformRating(Rating rating) {
  return ReplaceInObject(
    aCoolLanguage: replace(rating.aBadLanguage, 'Bad', 'Cool'),
  );
}

void main() {
  var rating = Rating(aBadLanguage: 'BadCool');
  var transformedRating = transformRating(rating);

  print('Original: ${rating.aBadLanguage}');
  print('Transformed: ${transformedRating.aCoolLanguage}');
}
