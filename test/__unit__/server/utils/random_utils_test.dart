import 'package:anime_dart/server/utils/random_utils.dart';

import 'package:test/test.dart';

void main() {
  final precision = 5000;

  group('randomInt() method', () {
    test('positive numbers', () {
      final min = 0, max = 5;

      final results = <int>[
        for (var i = 0; i < precision; i++) randomInt(min: min, max: max)
      ];

      expect(results.every((result) => result >= min && result < max), true);
    });
    test('negative numbers', () {
      final min = -10, max = 0;

      final results = <int>[
        for (var i = 0; i < precision; i++) randomInt(min: min, max: max)
      ];

      expect(results.every((result) => result >= min && result < max), true);
    });
    test('zero range', () {
      final value = -10;

      final results = <int>[
        for (var i = 0; i < precision; i++) randomInt(min: value, max: value),
      ];

      expect(results.every((result) => result == value), true);
    });
    test('max and min values', () {
      final min = 0, max = 2;

      final results = <int>[
        for (var i = 0; i < precision; i++) randomInt(min: min, max: max),
      ];

      expect(results.every((result) => result < max), true);
      expect(results.any((result) => result == min), true);
    });
    test('invalid range', () {
      final min = -10, max = -20;

      List<int> getResults() => <int>[
            for (var i = 0; i < precision; i++) randomInt(min: min, max: max),
          ];

      expect(getResults, throwsA(isA<AssertionError>()));
    });
  });
  group('randomDouble() method', () {
    test('positive numbers', () {
      final results = <double>[
        for (var i = 0; i < precision; i++) randomDouble(min: 0.0, max: 5.0)
      ];

      expect(results.every((result) => result >= 0.0 && result <= 5.0), true);
      expect(results.any((result) => result % 1 != 0), true);
    });

    test('negative numbers', () {
      final min = -10.0, max = 0.0;

      final results = <double>[
        for (var i = 0; i < precision; i++) randomDouble(min: min, max: max)
      ];

      expect(results.every((result) => result >= min && result < max), true);
      expect(results.any((result) => result % 1 != 0.0), true);
    });
    test('zero range', () {
      final value = -10.5;

      final results = <double>[
        for (var i = 0; i < precision; i++) randomDouble(min: value, max: value)
      ];

      expect(results.every((result) => result == value), true);
    });
    test('invalid range', () {
      final min = -10.0, max = -15.0;

      List<double> getResults() => <double>[
            for (var i = 0; i < precision; i++)
              randomDouble(min: min, max: max),
          ];

      expect(getResults, throwsA(isA<AssertionError>()));
    });
    test('max and min values', () {
      final min = 0.0, max = 2.0;

      final results = <double>[
        for (var i = 0; i < precision; i++) randomDouble(min: min, max: max),
      ];

      expect(results.every((result) => result < max), true);
    });
  });
}
