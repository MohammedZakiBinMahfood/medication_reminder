import 'package:flutter_test/flutter_test.dart';
import 'package:app_platform_core/core.dart';
import 'package:medication_reminder/core/extensions/result_extensions.dart';

void main() {
  group('ResultExtensions', () {
    group('getOrNull', () {
      test('returns data for Success', () {
        final result = Success<String>('hello');
        expect(result.getOrNull(), equals('hello'));
      });

      test('returns null for Failure', () {
        final result = Failure<String>(UnknownError('error'));
        expect(result.getOrNull(), isNull);
      });
    });

    group('getOrDefault', () {
      test('returns data for Success', () {
        final result = Success<int>(42);
        expect(result.getOrDefault(0), equals(42));
      });

      test('returns fallback for Failure', () {
        final result = Failure<int>(UnknownError('error'));
        expect(result.getOrDefault(0), equals(0));
      });
    });

    group('onSuccess', () {
      test('calls callback for Success', () {
        final result = Success<String>('hello');
        String? captured;
        result.onSuccess((data) => captured = data);
        expect(captured, equals('hello'));
      });

      test('does not call callback for Failure', () {
        final result = Failure<String>(UnknownError('error'));
        String? captured;
        result.onSuccess((data) => captured = data);
        expect(captured, isNull);
      });
    });

    group('onFailure', () {
      test('calls callback for Failure', () {
        final error = UnknownError('test error');
        final result = Failure<String>(error);
        AppError? captured;
        result.onFailure((err) => captured = err);
        expect(captured, equals(error));
      });

      test('does not call callback for Success', () {
        final result = Success<String>('hello');
        AppError? captured;
        result.onFailure((err) => captured = err);
        expect(captured, isNull);
      });
    });
  });

  group('Result.when', () {
    test('calls success branch for Success', () {
      final result = Success<int>(42);
      final output = result.when(
        success: (data) => 'Got: $data',
        failure: (error) => 'Error: ${error.errorMessage}',
      );
      expect(output, equals('Got: 42'));
    });

    test('calls failure branch for Failure', () {
      final result = Failure<int>(UnknownError('oops'));
      final output = result.when(
        success: (data) => 'Got: $data',
        failure: (error) => 'Error: ${error.errorMessage}',
      );
      expect(output, equals('Error: oops'));
    });
  });

  group('Paginated', () {
    test('creates with default isLoadingMore false', () {
      final paginated = Paginated<int>(
        items: [1, 2, 3],
        pagination: const Pagination(page: 1, limit: 20),
        hasNext: true,
      );
      expect(paginated.isLoadingMore, isFalse);
      expect(paginated.paginationError, isNull);
    });

    test('copyWith updates items', () {
      final original = Paginated<int>(
        items: [1, 2],
        pagination: const Pagination(page: 1, limit: 20),
        hasNext: true,
      );

      final updated = original.copyWith(items: [1, 2, 3, 4]);
      expect(updated.items, equals([1, 2, 3, 4]));
      expect(updated.hasNext, isTrue);
    });

    test('copyWith with isLoadingMore', () {
      final original = Paginated<int>(
        items: [1, 2],
        pagination: const Pagination(page: 1, limit: 20),
        hasNext: true,
      );

      final loading = original.copyWith(isLoadingMore: true);
      expect(loading.isLoadingMore, isTrue);
    });
  });

  group('Pagination', () {
    test('first() returns page 1', () {
      const pagination = Pagination(page: 5, limit: 20);
      final first = pagination.first();
      expect(first.page, equals(1));
      expect(first.limit, equals(20));
    });

    test('next() increments page', () {
      const pagination = Pagination(page: 1, limit: 20);
      final next = pagination.next();
      expect(next.page, equals(2));
      expect(next.limit, equals(20));
    });

    test('copyWith updates fields', () {
      const pagination = Pagination(page: 1, limit: 20);
      final modified = pagination.copyWith(page: 3, limit: 10);
      expect(modified.page, equals(3));
      expect(modified.limit, equals(10));
    });
  });
}
