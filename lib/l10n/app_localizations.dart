import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Medication Reminder'**
  String get appTitle;

  /// No description provided for @medications.
  ///
  /// In en, this message translates to:
  /// **'Medications'**
  String get medications;

  /// No description provided for @searchMedications.
  ///
  /// In en, this message translates to:
  /// **'Search medications...'**
  String get searchMedications;

  /// No description provided for @noMedicationsFound.
  ///
  /// In en, this message translates to:
  /// **'No medications found.\nTap + to add one.'**
  String get noMedicationsFound;

  /// No description provided for @addMedication.
  ///
  /// In en, this message translates to:
  /// **'Add Medication'**
  String get addMedication;

  /// No description provided for @editMedication.
  ///
  /// In en, this message translates to:
  /// **'Edit Medication'**
  String get editMedication;

  /// No description provided for @medicationName.
  ///
  /// In en, this message translates to:
  /// **'Medication Name'**
  String get medicationName;

  /// No description provided for @medicationNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Ibuprofen'**
  String get medicationNameHint;

  /// No description provided for @dosage.
  ///
  /// In en, this message translates to:
  /// **'Dosage'**
  String get dosage;

  /// No description provided for @dosageHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., 200mg'**
  String get dosageHint;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @priority.
  ///
  /// In en, this message translates to:
  /// **'Priority'**
  String get priority;

  /// No description provided for @repeatType.
  ///
  /// In en, this message translates to:
  /// **'Repeat Type'**
  String get repeatType;

  /// No description provided for @selectDays.
  ///
  /// In en, this message translates to:
  /// **'Select Days'**
  String get selectDays;

  /// No description provided for @intervalHours.
  ///
  /// In en, this message translates to:
  /// **'Interval (hours)'**
  String get intervalHours;

  /// No description provided for @intervalHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., 8'**
  String get intervalHint;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @endDateOptional.
  ///
  /// In en, this message translates to:
  /// **'End Date (Optional)'**
  String get endDateOptional;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get selectDate;

  /// No description provided for @priorityLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get priorityLow;

  /// No description provided for @priorityMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get priorityMedium;

  /// No description provided for @priorityHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get priorityHigh;

  /// No description provided for @priorityMed.
  ///
  /// In en, this message translates to:
  /// **'Med'**
  String get priorityMed;

  /// No description provided for @repeatDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get repeatDaily;

  /// No description provided for @repeatSpecificDays.
  ///
  /// In en, this message translates to:
  /// **'Specific Days'**
  String get repeatSpecificDays;

  /// No description provided for @repeatAsNeeded.
  ///
  /// In en, this message translates to:
  /// **'As Needed'**
  String get repeatAsNeeded;

  /// No description provided for @repeatInterval.
  ///
  /// In en, this message translates to:
  /// **'Interval'**
  String get repeatInterval;

  /// No description provided for @dayMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get dayMon;

  /// No description provided for @dayTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get dayTue;

  /// No description provided for @dayWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get dayWed;

  /// No description provided for @dayThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get dayThu;

  /// No description provided for @dayFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get dayFri;

  /// No description provided for @daySat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get daySat;

  /// No description provided for @daySun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get daySun;

  /// No description provided for @monthJan.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get monthJan;

  /// No description provided for @monthFeb.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get monthFeb;

  /// No description provided for @monthMar.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get monthMar;

  /// No description provided for @monthApr.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get monthApr;

  /// No description provided for @monthMay.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get monthMay;

  /// No description provided for @monthJun.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get monthJun;

  /// No description provided for @monthJul.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get monthJul;

  /// No description provided for @monthAug.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get monthAug;

  /// No description provided for @monthSep.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get monthSep;

  /// No description provided for @monthOct.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get monthOct;

  /// No description provided for @monthNov.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get monthNov;

  /// No description provided for @monthDec.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get monthDec;

  /// No description provided for @todayDashboard.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayDashboard;

  /// No description provided for @dashboardTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get dashboardTotal;

  /// No description provided for @dashboardCompleted.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get dashboardCompleted;

  /// No description provided for @dashboardMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get dashboardMissed;

  /// No description provided for @dashboardUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get dashboardUpcoming;

  /// No description provided for @dashboardCompletedLower.
  ///
  /// In en, this message translates to:
  /// **'completed'**
  String get dashboardCompletedLower;

  /// No description provided for @dashboardNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get dashboardNext;

  /// No description provided for @dashboardOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get dashboardOverdue;

  /// No description provided for @dashboardTaken.
  ///
  /// In en, this message translates to:
  /// **'Taken'**
  String get dashboardTaken;

  /// No description provided for @dashboardSkipped.
  ///
  /// In en, this message translates to:
  /// **'Skipped'**
  String get dashboardSkipped;

  /// No description provided for @dashboardTake.
  ///
  /// In en, this message translates to:
  /// **'Take'**
  String get dashboardTake;

  /// No description provided for @dashboardSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get dashboardSkip;

  /// No description provided for @dashboardSnooze.
  ///
  /// In en, this message translates to:
  /// **'Snooze'**
  String get dashboardSnooze;

  /// No description provided for @dashboardSnoozeDuration.
  ///
  /// In en, this message translates to:
  /// **'Snooze for'**
  String get dashboardSnoozeDuration;

  /// No description provided for @dashboardMinutes.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get dashboardMinutes;

  /// No description provided for @dashboardViewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get dashboardViewDetails;

  /// No description provided for @dashboardOverdueLabel.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get dashboardOverdueLabel;

  /// No description provided for @dashboardFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get dashboardFilterAll;

  /// No description provided for @dashboardFilterUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get dashboardFilterUpcoming;

  /// No description provided for @dashboardFilterCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get dashboardFilterCompleted;

  /// No description provided for @dashboardFilterMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get dashboardFilterMissed;

  /// No description provided for @dashboardFilterCritical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get dashboardFilterCritical;

  /// No description provided for @dashboardFilterNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get dashboardFilterNormal;

  /// No description provided for @dashboardFilterLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get dashboardFilterLow;

  /// No description provided for @dashboardEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No medications scheduled today'**
  String get dashboardEmptyTitle;

  /// No description provided for @dashboardEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add a medication to start tracking your doses'**
  String get dashboardEmptySubtitle;

  /// No description provided for @errorLoadingDashboard.
  ///
  /// In en, this message translates to:
  /// **'Failed to load dashboard.\nPlease try again.'**
  String get errorLoadingDashboard;

  /// No description provided for @dashboardNoFilterResults.
  ///
  /// In en, this message translates to:
  /// **'No medications match this filter'**
  String get dashboardNoFilterResults;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'Compliance History'**
  String get historyTitle;

  /// No description provided for @historyStatistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get historyStatistics;

  /// No description provided for @historyAdherence.
  ///
  /// In en, this message translates to:
  /// **'Adherence'**
  String get historyAdherence;

  /// No description provided for @historyTaken.
  ///
  /// In en, this message translates to:
  /// **'Taken'**
  String get historyTaken;

  /// No description provided for @historyMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get historyMissed;

  /// No description provided for @historySkipped.
  ///
  /// In en, this message translates to:
  /// **'Skipped'**
  String get historySkipped;

  /// No description provided for @historySnoozed.
  ///
  /// In en, this message translates to:
  /// **'Snoozed'**
  String get historySnoozed;

  /// No description provided for @historyCurrentStreak.
  ///
  /// In en, this message translates to:
  /// **'Current Streak'**
  String get historyCurrentStreak;

  /// No description provided for @historyLongestStreak.
  ///
  /// In en, this message translates to:
  /// **'Longest Streak'**
  String get historyLongestStreak;

  /// No description provided for @historyDateRange7Days.
  ///
  /// In en, this message translates to:
  /// **'Last 7 Days'**
  String get historyDateRange7Days;

  /// No description provided for @historyDateRange30Days.
  ///
  /// In en, this message translates to:
  /// **'Last 30 Days'**
  String get historyDateRange30Days;

  /// No description provided for @historyDateRangeCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get historyDateRangeCustom;

  /// No description provided for @historyDateRangeAll.
  ///
  /// In en, this message translates to:
  /// **'All History'**
  String get historyDateRangeAll;

  /// No description provided for @historyGroupByDay.
  ///
  /// In en, this message translates to:
  /// **'Group by Day'**
  String get historyGroupByDay;

  /// No description provided for @historyGroupByWeek.
  ///
  /// In en, this message translates to:
  /// **'Group by Week'**
  String get historyGroupByWeek;

  /// No description provided for @historyGroupByMonth.
  ///
  /// In en, this message translates to:
  /// **'Group by Month'**
  String get historyGroupByMonth;

  /// No description provided for @historyGroupByMedication.
  ///
  /// In en, this message translates to:
  /// **'Group by Medication'**
  String get historyGroupByMedication;

  /// No description provided for @historyLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading history...'**
  String get historyLoading;

  /// No description provided for @historyErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Failed to load history.\nPlease try again.'**
  String get historyErrorLoading;

  /// No description provided for @historyEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No history records found'**
  String get historyEmptyTitle;

  /// No description provided for @historyEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your medication history will appear here once you start taking doses'**
  String get historyEmptySubtitle;

  /// No description provided for @historyTotalDoses.
  ///
  /// In en, this message translates to:
  /// **'Total Doses'**
  String get historyTotalDoses;

  /// No description provided for @historyDailyAverage.
  ///
  /// In en, this message translates to:
  /// **'Daily Average'**
  String get historyDailyAverage;

  /// No description provided for @viewHistory.
  ///
  /// In en, this message translates to:
  /// **'View History'**
  String get viewHistory;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settingsGeneral;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get settingsHistory;

  /// No description provided for @settingsBackup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get settingsBackup;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get settingsLanguageArabic;

  /// No description provided for @settingsLanguageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguageEnglish;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @settingsThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeLight;

  /// No description provided for @settingsThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeDark;

  /// No description provided for @settingsThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsThemeSystem;

  /// No description provided for @settingsFirstDayOfWeek.
  ///
  /// In en, this message translates to:
  /// **'First Day of Week'**
  String get settingsFirstDayOfWeek;

  /// No description provided for @settingsTimeFormat24.
  ///
  /// In en, this message translates to:
  /// **'24-hour Format'**
  String get settingsTimeFormat24;

  /// No description provided for @settingsNotificationsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
  String get settingsNotificationsEnabled;

  /// No description provided for @settingsNotificationSound.
  ///
  /// In en, this message translates to:
  /// **'Notification Sound'**
  String get settingsNotificationSound;

  /// No description provided for @settingsVibrationEnabled.
  ///
  /// In en, this message translates to:
  /// **'Vibration'**
  String get settingsVibrationEnabled;

  /// No description provided for @settingsDefaultSnooze.
  ///
  /// In en, this message translates to:
  /// **'Default Snooze'**
  String get settingsDefaultSnooze;

  /// No description provided for @settingsReminderBefore.
  ///
  /// In en, this message translates to:
  /// **'Reminder Before Dose'**
  String get settingsReminderBefore;

  /// No description provided for @settingsReminderAtTime.
  ///
  /// In en, this message translates to:
  /// **'At scheduled time'**
  String get settingsReminderAtTime;

  /// No description provided for @settingsDefaultFilter.
  ///
  /// In en, this message translates to:
  /// **'Default Filter'**
  String get settingsDefaultFilter;

  /// No description provided for @settingsDefaultGrouping.
  ///
  /// In en, this message translates to:
  /// **'Default Grouping'**
  String get settingsDefaultGrouping;

  /// No description provided for @settingsAutoBackup.
  ///
  /// In en, this message translates to:
  /// **'Auto Backup'**
  String get settingsAutoBackup;

  /// No description provided for @settingsAutoBackupDesc.
  ///
  /// In en, this message translates to:
  /// **'Automatically backup your data'**
  String get settingsAutoBackupDesc;

  /// No description provided for @settingsManualBackup.
  ///
  /// In en, this message translates to:
  /// **'Manual Backup'**
  String get settingsManualBackup;

  /// No description provided for @settingsRestoreBackup.
  ///
  /// In en, this message translates to:
  /// **'Restore Backup'**
  String get settingsRestoreBackup;

  /// No description provided for @settingsComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get settingsComingSoon;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settingsVersion;

  /// No description provided for @settingsBuildNumber.
  ///
  /// In en, this message translates to:
  /// **'Build Number'**
  String get settingsBuildNumber;

  /// No description provided for @settingsLicenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get settingsLicenses;

  /// No description provided for @settingsPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacyPolicy;

  /// No description provided for @settingsPrivacyPolicyDesc.
  ///
  /// In en, this message translates to:
  /// **'How we protect your data'**
  String get settingsPrivacyPolicyDesc;

  /// No description provided for @settingsResetDefaults.
  ///
  /// In en, this message translates to:
  /// **'Reset to Defaults'**
  String get settingsResetDefaults;

  /// No description provided for @settingsResetConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset all settings to their default values?'**
  String get settingsResetConfirm;

  /// No description provided for @settingsErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Failed to load settings.\nPlease try again.'**
  String get settingsErrorLoading;

  /// No description provided for @settingsSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get settingsSave;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @medicationCreated.
  ///
  /// In en, this message translates to:
  /// **'Medication created successfully'**
  String get medicationCreated;

  /// No description provided for @medicationUpdated.
  ///
  /// In en, this message translates to:
  /// **'Medication updated successfully'**
  String get medicationUpdated;

  /// No description provided for @medicationDeleted.
  ///
  /// In en, this message translates to:
  /// **'Medication deleted'**
  String get medicationDeleted;

  /// No description provided for @doseTaken.
  ///
  /// In en, this message translates to:
  /// **'Dose marked as taken'**
  String get doseTaken;

  /// No description provided for @doseSkipped.
  ///
  /// In en, this message translates to:
  /// **'Dose skipped'**
  String get doseSkipped;

  /// No description provided for @doseSnoozed.
  ///
  /// In en, this message translates to:
  /// **'Dose snoozed for {minutes} minutes'**
  String doseSnoozed(Object minutes);

  /// No description provided for @doseSnoozedShort.
  ///
  /// In en, this message translates to:
  /// **'Dose snoozed'**
  String get doseSnoozedShort;

  /// No description provided for @settingsSaved.
  ///
  /// In en, this message translates to:
  /// **'Settings saved'**
  String get settingsSaved;

  /// No description provided for @settingsResetDone.
  ///
  /// In en, this message translates to:
  /// **'Settings reset to defaults'**
  String get settingsResetDone;

  /// No description provided for @errorCreatingMedication.
  ///
  /// In en, this message translates to:
  /// **'Failed to create medication.\nPlease try again.'**
  String get errorCreatingMedication;

  /// No description provided for @errorUpdatingMedication.
  ///
  /// In en, this message translates to:
  /// **'Failed to update medication.\nPlease try again.'**
  String get errorUpdatingMedication;

  /// No description provided for @errorDeletingMedication.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete medication.\nPlease try again.'**
  String get errorDeletingMedication;

  /// No description provided for @errorMarkingDose.
  ///
  /// In en, this message translates to:
  /// **'Failed to record dose.\nPlease try again.'**
  String get errorMarkingDose;

  /// No description provided for @confirmDeactivateMedication.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to deactivate this medication?'**
  String get confirmDeactivateMedication;

  /// No description provided for @confirmDeleteMedication.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this medication? This action cannot be undone.'**
  String get confirmDeleteMedication;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @clearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get clearSearch;

  /// No description provided for @medicationNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Medication name is required'**
  String get medicationNameRequired;

  /// No description provided for @dosageRequired.
  ///
  /// In en, this message translates to:
  /// **'Dosage is required'**
  String get dosageRequired;

  /// No description provided for @startDateRequired.
  ///
  /// In en, this message translates to:
  /// **'Start date is required'**
  String get startDateRequired;

  /// No description provided for @endDateAfterStart.
  ///
  /// In en, this message translates to:
  /// **'End date must be after start date'**
  String get endDateAfterStart;

  /// No description provided for @formUnsavedChanges.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes'**
  String get formUnsavedChanges;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
