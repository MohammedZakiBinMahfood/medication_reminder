import 'package:flutter_test/flutter_test.dart';
import 'package:medication_reminder/core/services/uuid_service.dart';

void main() {
  group('UuidService', () {
    test('generate returns a non-empty string', () {
      final uuid = UuidService.generate();
      expect(uuid, isNotEmpty);
    });

    test('generate returns valid UUID v4 format', () {
      final uuid = UuidService.generate();
      final uuidV4Regex = RegExp(
        r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
      );
      expect(uuidV4Regex.hasMatch(uuid), isTrue);
    });

    test('generate returns unique values on successive calls', () {
      final uuid1 = UuidService.generate();
      final uuid2 = UuidService.generate();
      expect(uuid1, isNot(equals(uuid2)));
    });

    test('generate returns 36 characters (with hyphens)', () {
      final uuid = UuidService.generate();
      expect(uuid.length, equals(36));
    });
  });
}
