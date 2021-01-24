import 'random_utils.dart';

String shuffleString(String target) {
  final chars = target.split('');

  for (var i = 0; i < chars.length; i++) {
    final temp = chars[i];

    final randomI = randomInt(max: chars.length, min: 0);

    chars[i] = chars[randomI];
    chars[randomI] = temp;
  }

  return chars.join();
}
