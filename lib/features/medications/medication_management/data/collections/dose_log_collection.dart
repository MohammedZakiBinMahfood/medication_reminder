import 'package:isar_community/isar.dart';

part 'dose_log_collection.g.dart';

@collection
class DoseLogCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  @Index()
  late String profileUuid;

  @Index()
  late String medicationUuid;

  @Index()
  late String scheduleUuid;

  @Index()
  late DateTime scheduledAt;

  DateTime? actionAt;

  /// Stored as an integer to decouple from DoseStatus domain enum.
  /// (0=pending, 1=taken, 2=skipped, 3=missed)
  @Index()
  late short status;

  // Audit & Sync Fields
  late DateTime createdAt;
  late DateTime updatedAt;
  late bool isDeleted;
}
