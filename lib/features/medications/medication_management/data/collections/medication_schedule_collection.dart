import 'package:isar_community/isar.dart';

part 'medication_schedule_collection.g.dart';

@collection
class MedicationScheduleCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  @Index()
  late String profileUuid;

  @Index()
  late String medicationUuid;

  /// Stored as minutes from midnight for faster comparisons, sorting,
  /// and locale-independent queries. (e.g., 08:00 -> 480).
  late short minutesFromMidnight;

  /// Stored as an integer to decouple from the RepeatType domain enum.
  late short repeatType;

  /// Stored as `List<byte>` (values 1-7).
  /// Reason: Isar does NOT have native bitwise query operators (like &).
  /// Using a bitmask would force queries to pull all records and evaluate in Dart memory,
  /// severely impacting performance. `List<byte>` allows native indexed Isar queries like:
  /// `.weekdaysElementEqualTo(DateTime.monday)`.
  late List<byte> weekdays;

  late int interval;

  @Index()
  late DateTime startDate;

  @Index()
  DateTime? endDate;

  // Audit & Sync Fields
  late DateTime createdAt;
  late DateTime updatedAt;
  late bool isDeleted;
}
