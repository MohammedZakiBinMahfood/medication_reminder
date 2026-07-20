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

  @override
  String a11yMedicationActive(Object name) {
    return '$name, active';
  }

  @override
  String a11yMedicationInactive(Object name) {
    return '$name, inactive';
  }

  @override
  String get a11yMedicationCardHint => 'Double tap to edit';

  @override
  String get a11ySwitchOn => 'On';

  @override
  String get a11ySwitchOff => 'Off';

  @override
  String a11yColorSelected(Object color) {
    return '$color selected';
  }

  @override
  String a11yColorNotSelected(Object color) {
    return '$color';
  }

  @override
  String a11yDaySelected(Object day) {
    return '$day, selected';
  }

  @override
  String a11yDayNotSelected(Object day) {
    return '$day, not selected';
  }

  @override
  String a11yChipSelected(Object label) {
    return '$label, selected';
  }

  @override
  String a11yChipNotSelected(Object label) {
    return '$label';
  }

  @override
  String a11yPriorityLabel(Object priority) {
    return 'Priority: $priority';
  }

  @override
  String a11yDoseStatus(Object status) {
    return 'Status: $status';
  }

  @override
  String a11yScheduledTime(Object time) {
    return 'Scheduled at $time';
  }

  @override
  String a11yRemainingTime(Object time) {
    return '$time remaining';
  }

  @override
  String get a11yOverdue => 'Overdue';

  @override
  String a11yTakeDose(Object name) {
    return 'Take dose for $name';
  }

  @override
  String a11ySkipDose(Object name) {
    return 'Skip dose for $name';
  }

  @override
  String a11ySnoozeDose(Object name) {
    return 'Snooze dose for $name';
  }

  @override
  String get a11yDoseTaken => 'Dose taken';

  @override
  String get a11yDoseSkipped => 'Dose skipped';

  @override
  String get a11yAddMedication => 'Add medication';

  @override
  String get a11ySearchMedications => 'Search medications';

  @override
  String get a11yClearSearch => 'Clear search';

  @override
  String get a11yLoading => 'Loading';

  @override
  String get a11yError => 'Error';

  @override
  String get a11yRetry => 'Retry loading';

  @override
  String get a11yEmptyState => 'Empty state';

  @override
  String a11yProgress(Object percent) {
    return '$percent% completed';
  }

  @override
  String a11yAdherence(Object percent) {
    return 'Adherence: $percent percent';
  }

  @override
  String a11yStreakCurrent(Object count) {
    return 'Current streak: $count days';
  }

  @override
  String a11yStreakLongest(Object count) {
    return 'Longest streak: $count days';
  }

  @override
  String a11yFilterActive(Object label) {
    return 'Filter: $label';
  }

  @override
  String a11ySectionCount(Object count, Object label) {
    return '$label, $count items';
  }

  @override
  String a11yGroupHeader(Object count, Object label) {
    return '$label, $count doses';
  }

  @override
  String a11yHistoryItem(Object name, Object status, Object time) {
    return '$name, $status, $time';
  }

  @override
  String get a11yOpenDatePicker => 'Open date picker';

  @override
  String get a11yClearDate => 'Clear date';

  @override
  String get a11yFormRequired => 'Required field';

  @override
  String get a11yDialogConfirm => 'Confirm action';

  @override
  String get a11yDialogCancel => 'Cancel action';

  @override
  String get a11yLanguageArabic => 'Arabic';

  @override
  String get a11yLanguageEnglish => 'English';

  @override
  String get a11yThemeLight => 'Light theme';

  @override
  String get a11yThemeDark => 'Dark theme';

  @override
  String get a11yThemeSystem => 'System theme';

  @override
  String get a11yNotificationsOn => 'Notifications enabled';

  @override
  String get a11yNotificationsOff => 'Notifications disabled';

  @override
  String get wizardAppLogo => 'Mudawy app logo';

  @override
  String get wizardWelcomeDescription =>
      'Mudawy helps you remember your medications even without an internet connection, while keeping your data completely private.';

  @override
  String get wizardStart => 'Get Started';

  @override
  String get wizardSkip => 'Skip';

  @override
  String get wizardNext => 'Next';

  @override
  String get wizardNotificationIcon => 'Notification permission icon';

  @override
  String get wizardNotificationTitle => 'Notification Permission';

  @override
  String get wizardNotificationDescription =>
      'The app relies on local notifications to remind you of your medication schedules.';

  @override
  String get wizardGrantPermission => 'Grant Permission';

  @override
  String get wizardNotificationGranted => 'Permission granted';

  @override
  String get wizardExactAlarmIcon => 'Exact alarm icon';

  @override
  String get wizardExactAlarmTitle => 'Exact Alarm Permission';

  @override
  String get wizardExactAlarmDescription =>
      'Allowing exact alarms ensures your reminders arrive precisely on time, even Doze mode cannot delay them.';

  @override
  String get wizardEnableExactAlarm => 'Enable Exact Alarms';

  @override
  String get wizardExactAlarmGranted => 'Exact alarms enabled';

  @override
  String get wizardExactAlarmNotRequired => 'Not Required';

  @override
  String get wizardExactAlarmNotRequiredDescription =>
      'Your device does not require additional alarm permissions. You can proceed.';

  @override
  String get wizardBatteryIcon => 'Battery optimization icon';

  @override
  String get wizardBatteryTitle => 'Battery Optimization';

  @override
  String get wizardBatteryDescription =>
      'Some manufacturers restrict background activity, which may prevent reminders from appearing on time. Disable battery optimization for Mudawy to ensure reliable notifications.';

  @override
  String get wizardBatteryGranted => 'Battery optimization disabled';

  @override
  String get wizardOpenSettings => 'Open Settings';

  @override
  String get wizardCompletionIcon => 'Setup complete icon';

  @override
  String get wizardCompletionTitle => 'All Set!';

  @override
  String get wizardCompletionDescription =>
      'Everything is ready. You can now add your first medication.';

  @override
  String get wizardAddFirstMedication => 'Add Medication';

  @override
  String get wizardGoHome => 'Go to Home';

  @override
  String get firstRunWelcomeTitle => 'Welcome to Mudawy';

  @override
  String get firstRunWelcomeDescription =>
      'Start by adding your first medication to receive timely reminders and track your doses.';

  @override
  String get firstRunExploreApp => 'Explore the app';

  @override
  String get firstRunDismiss => 'Dismiss';

  @override
  String get firstRunNotificationHintTitle => 'Enable Notifications';

  @override
  String get firstRunNotificationHintDescription =>
      'Don\'t forget to enable notifications to receive timely medication reminders.';

  @override
  String get firstRunNotificationHintEnable => 'Enable';

  @override
  String get firstRunSuccessTitle => 'Medication Added!';

  @override
  String get firstRunSuccessDescription =>
      'Your first medication has been added successfully. You will receive reminders at the scheduled times.';

  @override
  String get firstRunSuccessContinue => 'Start Tracking';

  @override
  String get firstRunEmptyHistoryTitle => 'No dose history yet';

  @override
  String get firstRunEmptyHistoryDescription =>
      'Your compliance history will appear here once you start taking doses.';

  @override
  String get firstRunEmptySearchTitle => 'No matching medications';

  @override
  String get firstRunEmptySearchDescription =>
      'Try a different search term or clear filters.';

  @override
  String get healthSystemHealthTitle => 'System Health';

  @override
  String get healthNotificationPermissionTitle => 'Notification Permission';

  @override
  String get healthExactAlarmTitle => 'Exact Alarm Permission';

  @override
  String get healthBatteryTitle => 'Battery Optimization';

  @override
  String get healthNotificationServiceTitle => 'Notification Service';

  @override
  String get healthPendingNotificationsTitle => 'Pending Notifications';

  @override
  String get healthDatabaseTitle => 'Database';

  @override
  String get healthTimeZoneTitle => 'Time Zone';

  @override
  String get healthApplicationTitle => 'Application';

  @override
  String get healthNotificationGranted => 'Notifications are enabled';

  @override
  String get healthNotificationDenied => 'Notifications are disabled';

  @override
  String get healthNotificationUnknown => 'Notification status unknown';

  @override
  String get healthExactAlarmGranted => 'Exact alarms are enabled';

  @override
  String get healthExactAlarmDenied => 'Exact alarms are disabled';

  @override
  String get healthExactAlarmUnknown => 'Exact alarm status unknown';

  @override
  String get healthExactAlarmUnavailable => 'Not required on this platform';

  @override
  String get healthBatteryOptimized =>
      'Battery optimization may restrict reminders';

  @override
  String get healthBatteryIgnored => 'Battery optimization is disabled';

  @override
  String get healthBatteryUnknown => 'Battery optimization status unknown';

  @override
  String get healthServiceReady => 'Notification service is ready';

  @override
  String get healthServiceError => 'Notification service encountered an error';

  @override
  String get healthDatabaseHealthy => 'Database is open and healthy';

  @override
  String get healthDatabaseError => 'Database encountered an error';

  @override
  String get healthTimeZoneInfo => 'Time zone is configured correctly';

  @override
  String get healthTimeZoneError => 'Time zone detection failed';

  @override
  String get healthPendingNotificationsInfo => 'Notification slots available';

  @override
  String get healthPendingNotificationsError =>
      'Failed to query pending notifications';

  @override
  String get healthApplicationInfo => 'Application information loaded';

  @override
  String get healthApplicationError => 'Failed to load application info';

  @override
  String get healthActionEnableNotifications => 'Enable Notifications';

  @override
  String get healthActionGrantExactAlarm => 'Grant Exact Alarm';

  @override
  String get healthActionOpenBatterySettings => 'Open Battery Settings';

  @override
  String get healthQuickFixes => 'Quick Fixes';

  @override
  String get healthQuickFixesDescription =>
      'Fix issues that may prevent reminders';

  @override
  String get healthRefresh => 'Refresh';

  @override
  String get healthScoreExcellent => 'Excellent';

  @override
  String get healthScoreGood => 'Good';

  @override
  String get healthScoreNeedsAttention => 'Needs Attention';

  @override
  String get healthScoreCritical => 'Critical';

  @override
  String healthScorePassed(Object count) {
    return '$count passed';
  }

  @override
  String healthScoreFailed(Object count) {
    return '$count failed';
  }

  @override
  String a11yHealthCheckStatus(Object status) {
    return 'Status: $status';
  }

  @override
  String a11yHealthScore(Object percent) {
    return 'Score: $percent percent';
  }

  @override
  String a11yHealthOverall(Object label) {
    return 'Overall health: $label';
  }
}
