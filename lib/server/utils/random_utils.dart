import 'dart:math';

final random = Random();
final randomSecure = Random.secure();

Random _getRandom(bool secure) => secure ? randomSecure : random;

int randomInt({
  bool secure = false,
  int max = 100,
  int min = 0,
}) {
  return min + _randomValue(secure, max.toDouble(), min.toDouble()).toInt();
}

double randomDouble({
  bool secure = false,
  double max = 1.0,
  double min = 0.0,
}) {
  return min + _randomValue(secure, max, min);
}

double _randomValue(bool secure, double max, double min) {
  final context = _getRandom(secure);

  final randomFactor = context.nextDouble();

  final diff = max - min;

  assert(diff >= 0);

  final value = diff * randomFactor;

  return value;
}
