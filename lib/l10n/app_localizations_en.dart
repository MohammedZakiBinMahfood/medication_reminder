// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Medication Reminder';

  @override
  String get medications => 'Medications';

  @override
  String get searchMedications => 'Search medications...';

  @override
  String get noMedicationsFound => 'No medications found.\nTap + to add one.';

  @override
  String get addMedication => 'Add Medication';

  @override
  String get editMedication => 'Edit Medication';

  @override
  String get medicationName => 'Medication Name';

  @override
  String get medicationNameHint => 'e.g., Ibuprofen';

  @override
  String get dosage => 'Dosage';

  @override
  String get dosageHint => 'e.g., 200mg';

  @override
  String get color => 'Color';

  @override
  String get priority => 'Priority';

  @override
  String get repeatType => 'Repeat Type';

  @override
  String get selectDays => 'Select Days';

  @override
  String get intervalHours => 'Interval (hours)';

  @override
  String get intervalHint => 'e.g., 8';

  @override
  String get startDate => 'Start Date';

  @override
  String get endDateOptional => 'End Date (Optional)';

  @override
  String get save => 'Save';

  @override
  String get update => 'Update';

  @override
  String get selectDate => 'Select date';

  @override
  String get priorityLow => 'Low';

  @override
  String get priorityMedium => 'Medium';

  @override
  String get priorityHigh => 'High';

  @override
  String get priorityMed => 'Med';

  @override
  String get repeatDaily => 'Daily';

  @override
  String get repeatSpecificDays => 'Specific Days';

  @override
  String get repeatAsNeeded => 'As Needed';

  @override
  String get repeatInterval => 'Interval';

  @override
  String get dayMon => 'Mon';

  @override
  String get dayTue => 'Tue';

  @override
  String get dayWed => 'Wed';

  @override
  String get dayThu => 'Thu';

  @override
  String get dayFri => 'Fri';

  @override
  String get daySat => 'Sat';

  @override
  String get daySun => 'Sun';

  @override
  String get monthJan => 'January';

  @override
  String get monthFeb => 'February';

  @override
  String get monthMar => 'March';

  @override
  String get monthApr => 'April';

  @override
  String get monthMay => 'May';

  @override
  String get monthJun => 'June';

  @override
  String get monthJul => 'July';

  @override
  String get monthAug => 'August';

  @override
  String get monthSep => 'September';

  @override
  String get monthOct => 'October';

  @override
  String get monthNov => 'November';

  @override
  String get monthDec => 'December';

  @override
  String get todayDashboard => 'Today';

  @override
  String get dashboardTotal => 'Total';

  @override
  String get dashboardCompleted => 'Done';

  @override
  String get dashboardMissed => 'Missed';

  @override
  String get dashboardUpcoming => 'Upcoming';

  @override
  String get dashboardCompletedLower => 'completed';

  @override
  String get dashboardNext => 'Next';

  @override
  String get dashboardOverdue => 'Overdue';

  @override
  String get dashboardTaken => 'Taken';

  @override
  String get dashboardSkipped => 'Skipped';

  @override
  String get dashboardTake => 'Take';

  @override
  String get dashboardSkip => 'Skip';

  @override
  String get dashboardSnooze => 'Snooze';

  @override
  String get dashboardSnoozeDuration => 'Snooze for';

  @override
  String get dashboardMinutes => 'min';

  @override
  String get dashboardViewDetails => 'View Details';

  @override
  String get dashboardOverdueLabel => 'Overdue';

  @override
  String get dashboardFilterAll => 'All';

  @override
  String get dashboardFilterUpcoming => 'Upcoming';

  @override
  String get dashboardFilterCompleted => 'Completed';

  @override
  String get dashboardFilterMissed => 'Missed';

  @override
  String get dashboardFilterCritical => 'Critical';

  @override
  String get dashboardFilterNormal => 'Normal';

  @override
  String get dashboardFilterLow => 'Low';

  @override
  String get dashboardEmptyTitle => 'No medications scheduled today';

  @override
  String get dashboardEmptySubtitle =>
      'Add a medication to start tracking your doses';

  @override
  String get errorLoadingDashboard =>
      'Failed to load dashboard.\nPlease try again.';

  @override
  String get dashboardNoFilterResults => 'No medications match this filter';

  @override
  String get retry => 'Retry';

  @override
  String get historyTitle => 'Compliance History';

  @override
  String get historyStatistics => 'Statistics';

  @override
  String get historyAdherence => 'Adherence';

  @override
  String get historyTaken => 'Taken';

  @override
  String get historyMissed => 'Missed';

  @override
  String get historySkipped => 'Skipped';

  @override
  String get historySnoozed => 'Snoozed';

  @override
  String get historyCurrentStreak => 'Current Streak';

  @override
  String get historyLongestStreak => 'Longest Streak';

  @override
  String get historyDateRange7Days => 'Last 7 Days';

  @override
  String get historyDateRange30Days => 'Last 30 Days';

  @override
  String get historyDateRangeCustom => 'Custom';

  @override
  String get historyDateRangeAll => 'All History';

  @override
  String get historyGroupByDay => 'Group by Day';

  @override
  String get historyGroupByWeek => 'Group by Week';

  @override
  String get historyGroupByMonth => 'Group by Month';

  @override
  String get historyGroupByMedication => 'Group by Medication';

  @override
  String get historyLoading => 'Loading history...';

  @override
  String get historyErrorLoading =>
      'Failed to load history.\nPlease try again.';

  @override
  String get historyEmptyTitle => 'No history records found';

  @override
  String get historyEmptySubtitle =>
      'Your medication history will appear here once you start taking doses';

  @override
  String get historyTotalDoses => 'Total Doses';

  @override
  String get historyDailyAverage => 'Daily Average';

  @override
  String get viewHistory => 'View History';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsGeneral => 'General';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsHistory => 'History';

  @override
  String get settingsBackup => 'Backup';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageArabic => 'Arabic';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsFirstDayOfWeek => 'First Day of Week';

  @override
  String get settingsTimeFormat24 => '24-hour Format';

  @override
  String get settingsNotificationsEnabled => 'Enable Notifications';

  @override
  String get settingsNotificationSound => 'Notification Sound';

  @override
  String get settingsVibrationEnabled => 'Vibration';

  @override
  String get settingsDefaultSnooze => 'Default Snooze';

  @override
  String get settingsReminderBefore => 'Reminder Before Dose';

  @override
  String get settingsReminderAtTime => 'At scheduled time';

  @override
  String get settingsDefaultFilter => 'Default Filter';

  @override
  String get settingsDefaultGrouping => 'Default Grouping';

  @override
  String get settingsAutoBackup => 'Auto Backup';

  @override
  String get settingsAutoBackupDesc => 'Automatically backup your data';

  @override
  String get settingsManualBackup => 'Manual Backup';

  @override
  String get settingsRestoreBackup => 'Restore Backup';

  @override
  String get settingsComingSoon => 'Coming soon';

  @override
  String get settingsVersion => 'Version';

  @override
  String get settingsBuildNumber => 'Build Number';

  @override
  String get settingsLicenses => 'Licenses';

  @override
  String get settingsPrivacyPolicy => 'Privacy Policy';

  @override
  String get settingsPrivacyPolicyDesc => 'How we protect your data';

  @override
  String get settingsResetDefaults => 'Reset to Defaults';

  @override
  String get settingsResetConfirm =>
      'Are you sure you want to reset all settings to their default values?';

  @override
  String get settingsErrorLoading =>
      'Failed to load settings.\nPlease try again.';

  @override
  String get settingsSave => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get confirm => 'Confirm';

  @override
  String get undo => 'Undo';

  @override
  String get done => 'Done';

  @override
  String get loading => 'Loading...';

  @override
  String get medicationCreated => 'Medication created successfully';

  @override
  String get medicationUpdated => 'Medication updated successfully';

  @override
  String get medicationDeleted => 'Medication deleted';

  @override
  String get doseTaken => 'Dose marked as taken';

  @override
  String get doseSkipped => 'Dose skipped';

  @override
  String doseSnoozed(Object minutes) {
    return 'Dose snoozed for $minutes minutes';
  }

  @override
  String get doseSnoozedShort => 'Dose snoozed';

  @override
  String get settingsSaved => 'Settings saved';

  @override
  String get settingsResetDone => 'Settings reset to defaults';

  @override
  String get errorCreatingMedication =>
      'Failed to create medication.\nPlease try again.';

  @override
  String get errorUpdatingMedication =>
      'Failed to update medication.\nPlease try again.';

  @override
  String get errorDeletingMedication =>
      'Failed to delete medication.\nPlease try again.';

  @override
  String get errorMarkingDose => 'Failed to record dose.\nPlease try again.';

  @override
  String get confirmDeactivateMedication =>
      'Are you sure you want to deactivate this medication?';

  @override
  String get confirmDeleteMedication =>
      'Are you sure you want to delete this medication? This action cannot be undone.';

  @override
  String get noResultsFound => 'No results found';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get medicationNameRequired => 'Medication name is required';

  @override
  String get dosageRequired => 'Dosage is required';

  @override
  String get startDateRequired => 'Start date is required';

  @override
  String get endDateAfterStart => 'End date must be after start date';

  @override
  String get formUnsavedChanges => 'You have unsaved changes';
}
