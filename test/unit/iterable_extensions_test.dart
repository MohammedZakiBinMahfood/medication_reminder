import 'package:flutter_test/flutter_test.dart';
import 'package:medication_reminder/core/extensions/iterable_extensions.dart';

void main() {
  group('IterableExtensions', () {
    group('firstWhereOrNull', () {
      test('returns first matching element', () {
        final list = [1, 2, 3, 4, 5];
        final result = list.firstWhereOrNull((e) => e > 3);
        expect(result, equals(4));
      });

      test('returns null when no element matches', () {
        final list = [1, 2, 3];
        final result = list.firstWhereOrNull((e) => e > 10);
        expect(result, isNull);
      });

      test('returns null for empty iterable', () {
        final list = <int>[];
        final result = list.firstWhereOrNull((e) => e > 0);
        expect(result, isNull);
      });

      test('returns first element when multiple match', () {
        final list = [1, 2, 3, 4, 5];
        final result = list.firstWhereOrNull((e) => e.isEven);
        expect(result, equals(2));
      });
    });

    group('mapIndexed', () {
      test('maps with index', () {
        final list = ['a', 'b', 'c'];
        final result = list.mapIndexed((i, e) => '$i:$e');
        expect(result, equals(['0:a', '1:b', '2:c']));
      });

      test('returns empty list for empty iterable', () {
        final list = <String>[];
        final result = list.mapIndexed((i, e) => '$i:$e');
        expect(result, isEmpty);
      });

      test('returns single element list for single item', () {
        final list = ['only'];
        final result = list.mapIndexed((i, e) => '$i:$e');
        expect(result, equals(['0:only']));
      });
    });
  });
}
