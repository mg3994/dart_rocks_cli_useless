typedef Position = List<dynamic>;

bool isLength(List<dynamic> list, int length) {
  return list.length == length;
}

List<int> inc(List<int> list) {
  return [0, ...list];
}

List<int> initCount(int length, [List<int> count = const []]) {
  return count.length == length ? count : initCount(length, [...count, 0]);
}

List<Position> writeHorizontal(List<int> xStart, int yStart, String str,
    [List<Position> writeArray = const []]) {
  if (str.isEmpty) return writeArray;
  var head = str[0];
  var rest = str.substring(1);
  return writeHorizontal(inc(xStart), yStart, rest, [
    ...writeArray,
    [xStart.length, yStart, head]
  ]);
}

List<Position> writeVertical(List<int> yStart, int xStart, String str,
    [List<Position> writeArray = const []]) {
  if (str.isEmpty) return writeArray;
  var head = str[0];
  var rest = str.substring(1);
  return writeVertical(inc(yStart), xStart, rest, [
    ...writeArray,
    [xStart, yStart.length, head]
  ]);
}

List<Position> writeWord(int xStart, int yStart, String str) {
  return writeHorizontal(initCount(xStart), yStart, str);
}

String checkBox(int done) {
  return done == 1
      ? '✅'
      : done == 0
          ? '🔲'
          : '🔥';
}

List<Position> todo(int done, String todo, int line) {
  return writeWord(1, line, '${checkBox(done)} $todo');
}

Position? getPositionMatching(
    List<Position> positions, int xSearch, int ySearch) {
  for (var position in positions) {
    if (position[0] == xSearch && position[1] == ySearch) {
      return position;
    }
  }
  return null;
}

String drawAt(List<Position> positions, int width, int height, String empty,
    [String r = '', List<int> xCount = const [], List<int> yCount = const []]) {
  if (isLength(xCount, width)) {
    if (isLength(yCount, height)) {
      return r;
    } else {
      return drawAt(positions, width, height, empty, '$r\n', [], inc(yCount));
    }
  } else {
    var position = getPositionMatching(positions, xCount.length, yCount.length);
    if (position != null) {
      return drawAt(positions, width, height, empty, '$r${position[2]}',
          inc(xCount), yCount);
    } else {
      return drawAt(
          positions, width, height, empty, '$r$empty', inc(xCount), yCount);
    }
  }
}

String repeat(String char, int times) {
  return List.filled(times, char).join();
}

List<Position> horizontalLine(int xStart, int yStart, int length) {
  return writeHorizontal(initCount(xStart), yStart, repeat('-', length));
}

List<Position> verticalLine(int xStart, int yStart, int length) {
  return writeVertical(initCount(yStart), xStart, repeat('|', length));
}

List<Position> block() {
  return [
    ...horizontalLine(0, 0, 23),
    ...horizontalLine(0, 2, 23),
    ...horizontalLine(0, 16, 23),
    ...verticalLine(0, 1, 1),
    ...verticalLine(22, 1, 1),
  ];
}

List<Position> todos(List<int> r) {
  return [
    ...writeWord(6, 1, 'Antinna CLI'),
    ...writeWord(5, 3, 'Subscribe Now'),
    ...todo(r[0], 'mapped types', 4),
    ...todo(r[1], 'template literals', 6),
    ...todo(r[2], 'never/conditionals', 8),
    ...todo(r[3], 'infer', 10),
    ...todo(r[4], 'recursion', 12),
    ...todo(r[5], 'branded types', 14),
  ];
}

void main() {
  List<int> state = [0, 0, 1, 1, 1, 1]; // 0 is false 1 is true tick  check
  var result = drawAt([...block(), ...todos(state)], 23, 16, ' ');
  print(result);
}
