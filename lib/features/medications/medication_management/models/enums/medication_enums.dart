import 'package:dart_mappable/dart_mappable.dart';

part 'medication_enums.mapper.dart';

@MappableEnum()
enum MedicationPriority { low, medium, high }

@MappableEnum()
enum RepeatType { daily, specificDays, asNeeded, interval }

@MappableEnum()
enum DoseStatus { pending, taken, skipped, missed }
