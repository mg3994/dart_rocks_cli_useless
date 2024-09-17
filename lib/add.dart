// typedef MyReturnType<T> = T Function();

T add<T extends num>(T a, T b) {
  return (a + b) as T;
}

void main() {
  final addResult = add(0.1, 2);
  print('Add Result: $addResult'); // Output: Add Result: 3
}
