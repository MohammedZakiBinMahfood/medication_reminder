import '../../features/medications/medication_management/models/enums/medication_enums.dart';
import '../../features/medications/medication_management/models/medication_schedule_model.dart';
import 'notification_constants.dart';
import 'next_occurrence_calculator.dart';
import 'notification_service.dart';

/// Manages the platform's pending-notification queue within the iOS 64-limit.
///
/// Responsibilities:
/// - Tracks which notification slots are occupied
/// - Determines which schedules can be registered without exceeding the limit
/// - Provides slot-count queries for callers
///
/// Does NOT perform scheduling — only manages slot accounting.
class NotificationQueueManager {
  final NotificationService _service;
  final NextOccurrenceCalculator _calculator;

  NotificationQueueManager({required this._service, required this._calculator});

  /// Returns the number of pending (scheduled) notifications on the platform.
  Future<int> get pendingCount async {
    final pending = await _service.getPending();
    return pending.length;
  }

  /// Returns the number of available notification slots remaining.
  Future<int> get availableSlots async {
    final pending = await _service.getPending();
    return NotificationConstants.maxPendingNotifications - pending.length;
  }

  /// Determines how many notification IDs a schedule will consume.
  ///
  /// - `daily` → 1 slot (OS repeats via matchDateTimeComponents)
  /// - `specificDays` → N slots (one per selected weekday)
  /// - `interval` → 1 slot per occurrence (up to maxCount)
  /// - `asNeeded` → 0 slots
  int slotsRequired(
    MedicationScheduleModel schedule, {
    int maxIntervalOccurrences = 3,
  }) {
    return switch (schedule.repeatType) {
      RepeatType.daily => 1,
      RepeatType.specificDays => schedule.weekdays.length,
      RepeatType.interval =>
        _calculator
            .upcomingOccurrences(schedule, maxCount: maxIntervalOccurrences)
            .length,
      RepeatType.asNeeded => 0,
    };
  }

  /// Checks if there are enough slots for a given schedule.
  Future<bool> canSchedule(
    MedicationScheduleModel schedule, {
    int maxIntervalOccurrences = 3,
  }) async {
    final required = slotsRequired(
      schedule,
      maxIntervalOccurrences: maxIntervalOccurrences,
    );
    final available = await availableSlots;
    return available >= required;
  }

  /// Returns the maximum number of interval occurrences that fit within
  /// the available slots.
  int maxOccurrencesThatFit(int availableSlots) {
    return availableSlots.clamp(
      0,
      NotificationConstants.maxIntervalNotifications,
    );
  }
}
