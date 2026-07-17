import 'package:app_platform_core/core.dart';

extension ResultExtensions<T> on Result<T> {
  /// Returns the data if the result is a Success, otherwise returns null.
  T? getOrNull() {
    if (this case Success(:final data)) {
      return data;
    }
    return null;
  }

  /// Returns the data if the result is a Success, otherwise returns the provided fallback.
  T getOrDefault(T fallback) {
    if (this case Success(:final data)) {
      return data;
    }
    return fallback;
  }

  /// Executes the given callback if the result is a Success.
  void onSuccess(void Function(T data) callback) {
    if (this case Success(:final data)) {
      callback(data);
    }
  }

  /// Executes the given callback if the result is a Failure.
  void onFailure(void Function(AppError error) callback) {
    if (this case Failure(:final error)) {
      callback(error);
    }
  }
}
