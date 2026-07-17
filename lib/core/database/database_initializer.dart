import 'database_service.dart';

class DatabaseInitializer {
  static Future<void> initialize(DatabaseService service) async {
    await service.init();
  }
}
