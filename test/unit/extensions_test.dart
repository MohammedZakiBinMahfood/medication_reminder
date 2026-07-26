import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder/core/extensions/string_extensions.dart';
import 'package:medication_reminder/core/extensions/color_extensions.dart';

void main() {
  group('StringExtensions', () {
    group('capitalizeFirst', () {
      test('capitalizes first letter', () {
        expect('hello'.capitalizeFirst(), equals('Hello'));
      });

      test('returns empty string unchanged', () {
        expect(''.capitalizeFirst(), equals(''));
      });

      test('handles already capitalized', () {
        expect('Hello'.capitalizeFirst(), equals('Hello'));
      });

      test('handles single character', () {
        expect('a'.capitalizeFirst(), equals('A'));
      });
    });

    group('limitLength', () {
      test('returns original string if within limit', () {
        expect('hello'.limitLength(10), equals('hello'));
      });

      test('truncates and appends suffix when exceeding limit', () {
        expect('hello world'.limitLength(5), equals('hello...'));
      });

      test('uses custom suffix', () {
        expect('hello world'.limitLength(5, suffix: '…'), equals('hello…'));
      });

      test('returns original when length equals max', () {
        expect('hello'.limitLength(5), equals('hello'));
      });
    });

    group('isNullOrEmpty (non-nullable)', () {
      test('returns true for empty string', () {
        expect(''.isNullOrEmpty, isTrue);
      });

      test('returns true for whitespace-only string', () {
        expect('   '.isNullOrEmpty, isTrue);
      });

      test('returns false for non-empty string', () {
        expect('hello'.isNullOrEmpty, isFalse);
      });
    });

    group('isNullOrEmpty (nullable)', () {
      test('returns true for null', () {
        String? value;
        expect(value.isNullOrEmpty, isTrue);
      });

      test('returns true for empty string', () {
        String? value = '';
        expect(value.isNullOrEmpty, isTrue);
      });

      test('returns true for whitespace-only', () {
        String? value = '   ';
        expect(value.isNullOrEmpty, isTrue);
      });

      test('returns false for non-empty', () {
        String? value = 'hello';
        expect(value.isNullOrEmpty, isFalse);
      });
    });
  });

  group('ColorExtensions', () {
    group('toHex', () {
      test('converts Color to hex string with hash', () {
        const color = Color(0xFF4F46E5);
        expect(color.toHex(), equals('#FF4F46E5'));
      });

      test('converts Color to hex string without hash', () {
        const color = Color(0xFFFF0000);
        expect(color.toHex(leadingHashSign: false), equals('FFFF0000'));
      });

      test('converts Colors.white to hex', () {
        expect(Colors.white.toHex(), equals('#FFFFFFFF'));
      });

      test('converts Colors.black to hex', () {
        expect(Colors.black.toHex(), equals('#FF000000'));
      });
    });

    group('toColor (String extension)', () {
      test('parses 8-char hex string with hash', () {
        final color = '#FF4F46E5'.toColor();
        expect(color, equals(const Color(0xFF4F46E5)));
      });

      test('parses 8-char hex string without hash', () {
        final color = 'FF4F46E5'.toColor();
        expect(color, equals(const Color(0xFF4F46E5)));
      });

      test('parses 6-char hex string (adds ff prefix)', () {
        final color = 'FF0000'.toColor();
        expect(color, equals(const Color(0xFFFF0000)));
      });

      test('parses 7-char hex string with hash', () {
        final color = '#FF0000'.toColor();
        expect(color, equals(const Color(0xFFFF0000)));
      });

      test('returns fallback for invalid hex', () {
        final color = 'invalid'.toColor();
        expect(color, equals(Colors.transparent));
      });

      test('returns custom fallback when provided', () {
        final color = 'invalid'.toColor(fallback: Colors.red);
        expect(color, equals(Colors.red));
      });
    });
  });
}
