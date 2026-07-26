import 'package:medication_reminder/features/medications/medication_management/models/models.dart';
import 'package:medication_reminder/features/settings/models/settings_model.dart';
import 'package:medication_reminder/features/settings/models/settings_enums.dart';

class TestFixtures {
  TestFixtures._();

  static final DateTime fixedNow = DateTime(2026, 7, 19, 10, 0, 0);

  static MedicationModel medication({
    String uuid = 'test-med-uuid-001',
    String name = 'Ibuprofen',
    String dosage = '200mg',
    String color = '#FF4F46E5',
    MedicationPriority priority = MedicationPriority.medium,
    bool isActive = true,
  }) {
    return MedicationModel(
      uuid: uuid,
      profileUuid: 'test-profile',
      name: name,
      dosage: dosage,
      color: color,
      priority: priority,
      isActive: isActive,
      createdAt: fixedNow,
      updatedAt: fixedNow,
    );
  }

  static MedicationScheduleModel schedule({
    String uuid = 'test-schedule-uuid-001',
    String medicationUuid = 'test-med-uuid-001',
    int minutesFromMidnight = 480,
    RepeatType repeatType = RepeatType.daily,
    List<int> weekdays = const [],
    int interval = 1,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return MedicationScheduleModel(
      uuid: uuid,
      profileUuid: 'test-profile',
      medicationUuid: medicationUuid,
      minutesFromMidnight: minutesFromMidnight,
      repeatType: repeatType,
      weekdays: weekdays,
      interval: interval,
      startDate: startDate ?? fixedNow,
      endDate: endDate,
      createdAt: fixedNow,
      updatedAt: fixedNow,
    );
  }

  static DoseLogModel doseLog({
    String uuid = 'test-log-uuid-001',
    String medicationUuid = 'test-med-uuid-001',
    String scheduleUuid = 'test-schedule-uuid-001',
    DateTime? scheduledAt,
    DateTime? actionAt,
    DoseStatus status = DoseStatus.pending,
  }) {
    return DoseLogModel(
      uuid: uuid,
      profileUuid: 'test-profile',
      medicationUuid: medicationUuid,
      scheduleUuid: scheduleUuid,
      scheduledAt: scheduledAt ?? fixedNow,
      actionAt: actionAt,
      status: status,
      createdAt: fixedNow,
      updatedAt: fixedNow,
    );
  }

  static MedicationListModel medicationList({
    String id = 'test-med-uuid-001',
    String name = 'Ibuprofen',
    String dosage = '200mg',
    String color = '#FF4F46E5',
    MedicationPriority priority = MedicationPriority.medium,
    bool isActive = true,
  }) {
    return MedicationListModel(
      id: id,
      name: name,
      dosage: dosage,
      color: color,
      priority: priority,
      isActive: isActive,
    );
  }

  static MedicationField medicationField({
    String id = 'test-med-uuid-001',
    String name = 'Ibuprofen',
    String dosage = '200mg',
    String color = '#FF4F46E5',
    MedicationPriority priority = MedicationPriority.medium,
    RepeatType repeatType = RepeatType.daily,
    List<int> weekdays = const [],
    int interval = 1,
    bool isActive = true,
  }) {
    return MedicationField(
      id: id,
      profileUuid: 'test-profile',
      name: name,
      dosage: dosage,
      color: color,
      priority: priority,
      repeatType: repeatType,
      weekdays: weekdays,
      interval: interval,
      startDate: fixedNow,
      isActive: isActive,
    );
  }

  static MedicationStateModel medicationState({
    String? id,
    String? name = 'Ibuprofen',
    String? dosage = '200mg',
    String? color = '#FF4F46E5',
    MedicationPriority priority = MedicationPriority.medium,
    RepeatType repeatType = RepeatType.daily,
  }) {
    return MedicationStateModel(
      id: id,
      name: name,
      dosage: dosage,
      color: color,
      priority: priority,
      repeatType: repeatType,
      startDate: fixedNow,
      isActive: true,
    );
  }

  static MedicationAddModel medicationAdd({
    String name = 'Ibuprofen',
    String dosage = '200mg',
    String color = '#FF4F46E5',
    MedicationPriority priority = MedicationPriority.medium,
    RepeatType repeatType = RepeatType.daily,
  }) {
    return MedicationAddModel(
      profileUuid: 'test-profile',
      name: name,
      dosage: dosage,
      color: color,
      priority: priority,
      repeatType: repeatType,
      weekdays: const [],
      interval: 1,
      startDate: fixedNow,
      isActive: true,
    );
  }

  static MedicationEditModel medicationEdit({
    String id = 'test-med-uuid-001',
    String name = 'Ibuprofen',
    String dosage = '200mg',
    String color = '#FF4F46E5',
    MedicationPriority priority = MedicationPriority.medium,
    RepeatType repeatType = RepeatType.daily,
  }) {
    return MedicationEditModel(
      id: id,
      profileUuid: 'test-profile',
      name: name,
      dosage: dosage,
      color: color,
      priority: priority,
      repeatType: repeatType,
      weekdays: const [],
      interval: 1,
      startDate: fixedNow,
      isActive: true,
    );
  }

  static SettingsModel settings({
    String uuid = 'test-settings-uuid',
    String language = 'ar',
    AppThemeMode themeMode = AppThemeMode.light,
  }) {
    return SettingsModel(
      uuid: uuid,
      language: language,
      themeMode: themeMode,
      firstDayOfWeek: 6,
      timeFormat24: false,
      notificationsEnabled: true,
      notificationSound: true,
      vibrationEnabled: true,
      defaultSnoozeMinutes: 10,
      reminderBeforeMinutes: 0,
      defaultHistoryFilter: AppHistoryFilter.last7Days,
      defaultHistoryGrouping: AppHistoryGrouping.day,
      autoBackupEnabled: false,
      appVersion: '1.0.0',
      buildNumber: '1',
      createdAt: fixedNow,
      updatedAt: fixedNow,
    );
  }
}
