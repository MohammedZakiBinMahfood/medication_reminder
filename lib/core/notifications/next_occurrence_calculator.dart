import 'package:timezone/timezone.dart' as tz;

import '../../features/medications/medication_management/models/enums/medication_enums.dart';
import '../../features/medications/medication_management/models/medication_schedule_model.dart';

/// Unified calculator for the next occurrence of any schedule repeat type.
///
/// This class centralises all scheduling logic for:
/// - **daily**: fires at `minutesFromMidnight` every day
/// - **specificDays**: fires on selected weekdays at `minutesFromMidnight`
/// - **interval**: fires every N hours from `startDate`
/// - **asNeeded**: never fires (returns null)
///
/// All methods are pure — no database or platform side effects.
class NextOccurrenceCalculator {
  /// Returns the next future occurrence for [schedule], or `null` if the
  /// schedule has expired or is `asNeeded`.
  tz.TZDateTime? nextOccurrence(MedicationScheduleModel schedule) {
    if (schedule.repeatType == RepeatType.asNeeded) return null;
    if (_isExpired(schedule)) return null;

    final now = tz.TZDateTime.now(tz.local);

    return switch (schedule.repeatType) {
      RepeatType.daily => _nextDaily(now, schedule.minutesFromMidnight),
      RepeatType.specificDays => _nextSpecificDay(now, schedule),
      RepeatType.interval => _nextInterval(now, schedule),
      RepeatType.asNeeded => null,
    };
  }

  /// Returns up to [maxCount] future occurrences for [schedule].
  ///
  /// For `daily` and `specificDays` uses `matchDateTimeComponents`
  /// so only the nearest occurrence is needed (OS repeats it).
  /// For `interval` we compute multiple occurrences up to the limit.
  List<tz.TZDateTime> upcomingOccurrences(
    MedicationScheduleModel schedule, {
    int maxCount = 3,
  }) {
    if (schedule.repeatType == RepeatType.asNeeded) return [];
    if (_isExpired(schedule)) return [];

    final now = tz.TZDateTime.now(tz.local);
    final results = <tz.TZDateTime>[];

    switch (schedule.repeatType) {
      case RepeatType.daily:
        // Daily only needs one occurrence — OS repeats via matchDateTimeComponents
        final next = _nextDaily(now, schedule.minutesFromMidnight);
        if (next != null) results.add(next);
        break;

      case RepeatType.specificDays:
        // SpecificDays: one per selected weekday — OS repeats weekly
        var candidate = now;
        while (results.length < maxCount &&
            results.length < schedule.weekdays.length) {
          final next = _nextSpecificDay(candidate, schedule);
          if (next == null) break;
          results.add(next);
          // Move past this occurrence to find the next weekday
          candidate = next.add(const Duration(hours: 1));
        }
        break;

      case RepeatType.interval:
        // Interval: compute multiple occurrences (OS won't repeat these)
        final intervalHours = schedule.interval > 0 ? schedule.interval : 1;
        var candidate = _nextInterval(now, schedule);
        while (candidate != null && results.length < maxCount) {
          results.add(candidate);
          candidate = candidate.add(Duration(hours: intervalHours));
        }
        break;

      case RepeatType.asNeeded:
        break;
    }

    return results;
  }

  /// Generates a deterministic notification ID for a given occurrence.
  ///
  /// Formula: `medicationId + scheduleId + occurrenceDate` → stable hash.
  /// This ensures the same medication/schedule/date always maps to the same
  /// ID, while different dates produce different IDs for interval scheduling.
  static int generateNotificationId({
    required String medicationId,
    required String scheduleId,
    required DateTime occurrenceDate,
    int? weekday,
  }) {
    final dateKey =
        '${occurrenceDate.year}-${occurrenceDate.month}-${occurrenceDate.day}';
    final input = weekday != null
        ? '$medicationId:$scheduleId:$dateKey:$weekday'
        : '$medicationId:$scheduleId:$dateKey';
    return input.hashCode & 0x7FFFFFFF;
  }

  /// Generates a snooze notification ID that won't collide with schedule IDs.
  static int generateSnoozeId({
    required String medicationId,
    required String scheduleId,
    required DateTime occurrenceDate,
    required int snoozeMinutes,
  }) {
    final dateKey =
        '${occurrenceDate.year}-${occurrenceDate.month}-${occurrenceDate.day}';
    final input = 'snooze:$medicationId:$scheduleId:$dateKey:${snoozeMinutes}m';
    return input.hashCode & 0x7FFFFFFF;
  }

  // ── Private helpers ────────────────────────────────────────────────────

  bool _isExpired(MedicationScheduleModel schedule) {
    if (schedule.endDate == null) return false;
    final now = tz.TZDateTime.now(tz.local);
    return schedule.endDate!.isBefore(DateTime(now.year, now.month, now.day));
  }

  tz.TZDateTime? _nextDaily(tz.TZDateTime now, int minutesFromMidnight) {
    final candidate = _applyTimeOfDay(now, minutesFromMidnight);
    if (candidate.isBefore(now)) {
      return candidate.add(const Duration(days: 1));
    }
    return candidate;
  }

  tz.TZDateTime? _nextSpecificDay(
    tz.TZDateTime now,
    MedicationScheduleModel schedule,
  ) {
    for (int daysAhead = 0; daysAhead < 7; daysAhead++) {
      final candidate = now.add(Duration(days: daysAhead));
      final weekday = candidate.weekday; // 1=Mon..7=Sun
      if (schedule.weekdays.contains(weekday)) {
        final scheduled = _applyTimeOfDay(
          candidate,
          schedule.minutesFromMidnight,
        );
        if (scheduled.isAfter(now)) return scheduled;
      }
    }
    return null;
  }

  tz.TZDateTime? _nextInterval(
    tz.TZDateTime now,
    MedicationScheduleModel schedule,
  ) {
    final intervalHours = schedule.interval > 0 ? schedule.interval : 1;
    final startDate = tz.TZDateTime.from(schedule.startDate, tz.local);

    // Find the next occurrence after now, based on start + N*interval
    var candidate = startDate;
    while (candidate.isBefore(now)) {
      candidate = candidate.add(Duration(hours: intervalHours));
    }
    return candidate;
  }

  static tz.TZDateTime _applyTimeOfDay(
    tz.TZDateTime date,
    int minutesFromMidnight,
  ) {
    final hours = minutesFromMidnight ~/ 60;
    final minutes = minutesFromMidnight % 60;
    return tz.TZDateTime(
      date.location,
      date.year,
      date.month,
      date.day,
      hours,
      minutes,
    );
  }
}
