import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  Isar? _isar;

  Future<Isar> init() async {
    if (_isar != null) return _isar!;

    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        // Add collections here later
      ],
      directory: dir.path,
    );

    return _isar!;
  }

  Isar get isar {
    if (_isar == null) {
      throw Exception("DatabaseService has not been initialized.");
    }
    return _isar!;
  }
}
