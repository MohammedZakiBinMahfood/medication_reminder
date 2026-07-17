import 'package:uuid/uuid.dart';

class UuidService {
  UuidService._();

  static const _uuid = Uuid();

  /// Generates a v4 (random) UUID string.
  static String generate() {
    return _uuid.v4();
  }
}
