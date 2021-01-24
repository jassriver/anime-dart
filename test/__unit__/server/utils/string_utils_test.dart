import 'package:anime_dart/server/utils/string_utils.dart';

import 'package:test/test.dart';

void main() {
  group('shuffleString() method', () {
    test('long string', () {
      final longString =
          '''Maecenas ex neque, pharetra sit amet lacus a, accumsan lacinia ex. Curabitur pulvinar vehicula est, nec suscipit tellus lacinia congue. Aenean est dui, eleifend eu urna sit amet, placerat lacinia tortor.''';

      final result = shuffleString(longString);

      expect(result.length, longString.length);
      expect(result.compareTo(longString) != 0, true);
      expect(result != longString, true);
    });
  });
}
