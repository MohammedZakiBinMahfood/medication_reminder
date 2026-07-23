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

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

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

  /// No description provided for @settingsUpdate.
  ///
  /// In en, this message translates to:
  /// **'Check for Updates'**
  String get settingsUpdate;

  /// No description provided for @settingsUpdateDesc.
  ///
  /// In en, this message translates to:
  /// **'Check if a newer version is available'**
  String get settingsUpdateDesc;

  /// No description provided for @settingsUpdateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get settingsUpdateAvailable;

  /// No description provided for @settingsUpdateCurrentVersion.
  ///
  /// In en, this message translates to:
  /// **'Current version'**
  String get settingsUpdateCurrentVersion;

  /// No description provided for @settingsUpdateChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking for updates...'**
  String get settingsUpdateChecking;

  /// No description provided for @settingsUpdateUpToDate.
  ///
  /// In en, this message translates to:
  /// **'You are using the latest version'**
  String get settingsUpdateUpToDate;

  /// No description provided for @settingsUpdateError.
  ///
  /// In en, this message translates to:
  /// **'Failed to check for updates'**
  String get settingsUpdateError;

  /// No description provided for @settingsUpdateNotPublished.
  ///
  /// In en, this message translates to:
  /// **'App not yet available on Play Store'**
  String get settingsUpdateNotPublished;

  /// No description provided for @settingsUpdateNow.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get settingsUpdateNow;

  /// No description provided for @settingsUpdateLater.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get settingsUpdateLater;

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

  /// No description provided for @a11yMedicationActive.
  ///
  /// In en, this message translates to:
  /// **'{name}, active'**
  String a11yMedicationActive(Object name);

  /// No description provided for @a11yMedicationInactive.
  ///
  /// In en, this message translates to:
  /// **'{name}, inactive'**
  String a11yMedicationInactive(Object name);

  /// No description provided for @a11yMedicationCardHint.
  ///
  /// In en, this message translates to:
  /// **'Double tap to edit'**
  String get a11yMedicationCardHint;

  /// No description provided for @a11ySwitchOn.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get a11ySwitchOn;

  /// No description provided for @a11ySwitchOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get a11ySwitchOff;

  /// No description provided for @a11yColorSelected.
  ///
  /// In en, this message translates to:
  /// **'{color} selected'**
  String a11yColorSelected(Object color);

  /// No description provided for @a11yColorNotSelected.
  ///
  /// In en, this message translates to:
  /// **'{color}'**
  String a11yColorNotSelected(Object color);

  /// No description provided for @a11yDaySelected.
  ///
  /// In en, this message translates to:
  /// **'{day}, selected'**
  String a11yDaySelected(Object day);

  /// No description provided for @a11yDayNotSelected.
  ///
  /// In en, this message translates to:
  /// **'{day}, not selected'**
  String a11yDayNotSelected(Object day);

  /// No description provided for @a11yChipSelected.
  ///
  /// In en, this message translates to:
  /// **'{label}, selected'**
  String a11yChipSelected(Object label);

  /// No description provided for @a11yChipNotSelected.
  ///
  /// In en, this message translates to:
  /// **'{label}'**
  String a11yChipNotSelected(Object label);

  /// No description provided for @a11yPriorityLabel.
  ///
  /// In en, this message translates to:
  /// **'Priority: {priority}'**
  String a11yPriorityLabel(Object priority);

  /// No description provided for @a11yDoseStatus.
  ///
  /// In en, this message translates to:
  /// **'Status: {status}'**
  String a11yDoseStatus(Object status);

  /// No description provided for @a11yScheduledTime.
  ///
  /// In en, this message translates to:
  /// **'Scheduled at {time}'**
  String a11yScheduledTime(Object time);

  /// No description provided for @a11yRemainingTime.
  ///
  /// In en, this message translates to:
  /// **'{time} remaining'**
  String a11yRemainingTime(Object time);

  /// No description provided for @a11yOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get a11yOverdue;

  /// No description provided for @a11yTakeDose.
  ///
  /// In en, this message translates to:
  /// **'Take dose for {name}'**
  String a11yTakeDose(Object name);

  /// No description provided for @a11ySkipDose.
  ///
  /// In en, this message translates to:
  /// **'Skip dose for {name}'**
  String a11ySkipDose(Object name);

  /// No description provided for @a11ySnoozeDose.
  ///
  /// In en, this message translates to:
  /// **'Snooze dose for {name}'**
  String a11ySnoozeDose(Object name);

  /// No description provided for @a11yDoseTaken.
  ///
  /// In en, this message translates to:
  /// **'Dose taken'**
  String get a11yDoseTaken;

  /// No description provided for @a11yDoseSkipped.
  ///
  /// In en, this message translates to:
  /// **'Dose skipped'**
  String get a11yDoseSkipped;

  /// No description provided for @a11yAddMedication.
  ///
  /// In en, this message translates to:
  /// **'Add medication'**
  String get a11yAddMedication;

  /// No description provided for @a11ySearchMedications.
  ///
  /// In en, this message translates to:
  /// **'Search medications'**
  String get a11ySearchMedications;

  /// No description provided for @a11yClearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get a11yClearSearch;

  /// No description provided for @a11yLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get a11yLoading;

  /// No description provided for @a11yError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get a11yError;

  /// No description provided for @a11yRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry loading'**
  String get a11yRetry;

  /// No description provided for @a11yEmptyState.
  ///
  /// In en, this message translates to:
  /// **'Empty state'**
  String get a11yEmptyState;

  /// No description provided for @a11yProgress.
  ///
  /// In en, this message translates to:
  /// **'{percent}% completed'**
  String a11yProgress(Object percent);

  /// No description provided for @a11yAdherence.
  ///
  /// In en, this message translates to:
  /// **'Adherence: {percent} percent'**
  String a11yAdherence(Object percent);

  /// No description provided for @a11yStreakCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current streak: {count} days'**
  String a11yStreakCurrent(Object count);

  /// No description provided for @a11yStreakLongest.
  ///
  /// In en, this message translates to:
  /// **'Longest streak: {count} days'**
  String a11yStreakLongest(Object count);

  /// No description provided for @a11yFilterActive.
  ///
  /// In en, this message translates to:
  /// **'Filter: {label}'**
  String a11yFilterActive(Object label);

  /// No description provided for @a11ySectionCount.
  ///
  /// In en, this message translates to:
  /// **'{label}, {count} items'**
  String a11ySectionCount(Object count, Object label);

  /// No description provided for @a11yGroupHeader.
  ///
  /// In en, this message translates to:
  /// **'{label}, {count} doses'**
  String a11yGroupHeader(Object count, Object label);

  /// No description provided for @a11yHistoryItem.
  ///
  /// In en, this message translates to:
  /// **'{name}, {status}, {time}'**
  String a11yHistoryItem(Object name, Object status, Object time);

  /// No description provided for @a11yOpenDatePicker.
  ///
  /// In en, this message translates to:
  /// **'Open date picker'**
  String get a11yOpenDatePicker;

  /// No description provided for @a11yClearDate.
  ///
  /// In en, this message translates to:
  /// **'Clear date'**
  String get a11yClearDate;

  /// No description provided for @a11yFormRequired.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get a11yFormRequired;

  /// No description provided for @a11yDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm action'**
  String get a11yDialogConfirm;

  /// No description provided for @a11yDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel action'**
  String get a11yDialogCancel;

  /// No description provided for @a11yLanguageArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get a11yLanguageArabic;

  /// No description provided for @a11yLanguageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get a11yLanguageEnglish;

  /// No description provided for @a11yThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light theme'**
  String get a11yThemeLight;

  /// No description provided for @a11yThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark theme'**
  String get a11yThemeDark;

  /// No description provided for @a11yThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System theme'**
  String get a11yThemeSystem;

  /// No description provided for @a11yNotificationsOn.
  ///
  /// In en, this message translates to:
  /// **'Notifications enabled'**
  String get a11yNotificationsOn;

  /// No description provided for @a11yNotificationsOff.
  ///
  /// In en, this message translates to:
  /// **'Notifications disabled'**
  String get a11yNotificationsOff;

  /// No description provided for @wizardAppLogo.
  ///
  /// In en, this message translates to:
  /// **'Mudawy app logo'**
  String get wizardAppLogo;

  /// No description provided for @wizardWelcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Mudawy helps you remember your medications even without an internet connection, while keeping your data completely private.'**
  String get wizardWelcomeDescription;

  /// No description provided for @wizardStart.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get wizardStart;

  /// No description provided for @wizardSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get wizardSkip;

  /// No description provided for @wizardNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get wizardNext;

  /// No description provided for @wizardNotificationIcon.
  ///
  /// In en, this message translates to:
  /// **'Notification permission icon'**
  String get wizardNotificationIcon;

  /// No description provided for @wizardNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Permission'**
  String get wizardNotificationTitle;

  /// No description provided for @wizardNotificationDescription.
  ///
  /// In en, this message translates to:
  /// **'The app relies on local notifications to remind you of your medication schedules.'**
  String get wizardNotificationDescription;

  /// No description provided for @wizardGrantPermission.
  ///
  /// In en, this message translates to:
  /// **'Grant Permission'**
  String get wizardGrantPermission;

  /// No description provided for @wizardNotificationGranted.
  ///
  /// In en, this message translates to:
  /// **'Permission granted'**
  String get wizardNotificationGranted;

  /// No description provided for @wizardExactAlarmIcon.
  ///
  /// In en, this message translates to:
  /// **'Exact alarm icon'**
  String get wizardExactAlarmIcon;

  /// No description provided for @wizardExactAlarmTitle.
  ///
  /// In en, this message translates to:
  /// **'Exact Alarm Permission'**
  String get wizardExactAlarmTitle;

  /// No description provided for @wizardExactAlarmDescription.
  ///
  /// In en, this message translates to:
  /// **'Allowing exact alarms ensures your reminders arrive precisely on time, even Doze mode cannot delay them.'**
  String get wizardExactAlarmDescription;

  /// No description provided for @wizardEnableExactAlarm.
  ///
  /// In en, this message translates to:
  /// **'Enable Exact Alarms'**
  String get wizardEnableExactAlarm;

  /// No description provided for @wizardExactAlarmGranted.
  ///
  /// In en, this message translates to:
  /// **'Exact alarms enabled'**
  String get wizardExactAlarmGranted;

  /// No description provided for @wizardExactAlarmNotRequired.
  ///
  /// In en, this message translates to:
  /// **'Not Required'**
  String get wizardExactAlarmNotRequired;

  /// No description provided for @wizardExactAlarmNotRequiredDescription.
  ///
  /// In en, this message translates to:
  /// **'Your device does not require additional alarm permissions. You can proceed.'**
  String get wizardExactAlarmNotRequiredDescription;

  /// No description provided for @wizardBatteryIcon.
  ///
  /// In en, this message translates to:
  /// **'Battery optimization icon'**
  String get wizardBatteryIcon;

  /// No description provided for @wizardBatteryTitle.
  ///
  /// In en, this message translates to:
  /// **'Battery Optimization'**
  String get wizardBatteryTitle;

  /// No description provided for @wizardBatteryDescription.
  ///
  /// In en, this message translates to:
  /// **'Some manufacturers restrict background activity, which may prevent reminders from appearing on time. Disable battery optimization for Mudawy to ensure reliable notifications.'**
  String get wizardBatteryDescription;

  /// No description provided for @wizardBatteryGranted.
  ///
  /// In en, this message translates to:
  /// **'Battery optimization disabled'**
  String get wizardBatteryGranted;

  /// No description provided for @wizardOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get wizardOpenSettings;

  /// No description provided for @wizardCompletionIcon.
  ///
  /// In en, this message translates to:
  /// **'Setup complete icon'**
  String get wizardCompletionIcon;

  /// No description provided for @wizardCompletionTitle.
  ///
  /// In en, this message translates to:
  /// **'All Set!'**
  String get wizardCompletionTitle;

  /// No description provided for @wizardCompletionDescription.
  ///
  /// In en, this message translates to:
  /// **'Everything is ready. You can now add your first medication.'**
  String get wizardCompletionDescription;

  /// No description provided for @wizardAddFirstMedication.
  ///
  /// In en, this message translates to:
  /// **'Add Medication'**
  String get wizardAddFirstMedication;

  /// No description provided for @wizardGoHome.
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get wizardGoHome;

  /// No description provided for @firstRunWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Mudawy'**
  String get firstRunWelcomeTitle;

  /// No description provided for @firstRunWelcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Start by adding your first medication to receive timely reminders and track your doses.'**
  String get firstRunWelcomeDescription;

  /// No description provided for @firstRunExploreApp.
  ///
  /// In en, this message translates to:
  /// **'Explore the app'**
  String get firstRunExploreApp;

  /// No description provided for @firstRunDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get firstRunDismiss;

  /// No description provided for @firstRunNotificationHintTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
  String get firstRunNotificationHintTitle;

  /// No description provided for @firstRunNotificationHintDescription.
  ///
  /// In en, this message translates to:
  /// **'Don\'t forget to enable notifications to receive timely medication reminders.'**
  String get firstRunNotificationHintDescription;

  /// No description provided for @firstRunNotificationHintEnable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get firstRunNotificationHintEnable;

  /// No description provided for @firstRunSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Medication Added!'**
  String get firstRunSuccessTitle;

  /// No description provided for @firstRunSuccessDescription.
  ///
  /// In en, this message translates to:
  /// **'Your first medication has been added successfully. You will receive reminders at the scheduled times.'**
  String get firstRunSuccessDescription;

  /// No description provided for @firstRunSuccessContinue.
  ///
  /// In en, this message translates to:
  /// **'Start Tracking'**
  String get firstRunSuccessContinue;

  /// No description provided for @firstRunEmptyHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'No dose history yet'**
  String get firstRunEmptyHistoryTitle;

  /// No description provided for @firstRunEmptyHistoryDescription.
  ///
  /// In en, this message translates to:
  /// **'Your compliance history will appear here once you start taking doses.'**
  String get firstRunEmptyHistoryDescription;

  /// No description provided for @firstRunEmptySearchTitle.
  ///
  /// In en, this message translates to:
  /// **'No matching medications'**
  String get firstRunEmptySearchTitle;

  /// No description provided for @firstRunEmptySearchDescription.
  ///
  /// In en, this message translates to:
  /// **'Try a different search term or clear filters.'**
  String get firstRunEmptySearchDescription;

  /// No description provided for @healthSystemHealthTitle.
  ///
  /// In en, this message translates to:
  /// **'System Health'**
  String get healthSystemHealthTitle;

  /// No description provided for @healthNotificationPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Permission'**
  String get healthNotificationPermissionTitle;

  /// No description provided for @healthExactAlarmTitle.
  ///
  /// In en, this message translates to:
  /// **'Exact Alarm Permission'**
  String get healthExactAlarmTitle;

  /// No description provided for @healthBatteryTitle.
  ///
  /// In en, this message translates to:
  /// **'Battery Optimization'**
  String get healthBatteryTitle;

  /// No description provided for @healthNotificationServiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Service'**
  String get healthNotificationServiceTitle;

  /// No description provided for @healthPendingNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Pending Notifications'**
  String get healthPendingNotificationsTitle;

  /// No description provided for @healthDatabaseTitle.
  ///
  /// In en, this message translates to:
  /// **'Database'**
  String get healthDatabaseTitle;

  /// No description provided for @healthTimeZoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Time Zone'**
  String get healthTimeZoneTitle;

  /// No description provided for @healthApplicationTitle.
  ///
  /// In en, this message translates to:
  /// **'Application'**
  String get healthApplicationTitle;

  /// No description provided for @healthNotificationGranted.
  ///
  /// In en, this message translates to:
  /// **'Notifications are enabled'**
  String get healthNotificationGranted;

  /// No description provided for @healthNotificationDenied.
  ///
  /// In en, this message translates to:
  /// **'Notifications are disabled'**
  String get healthNotificationDenied;

  /// No description provided for @healthNotificationUnknown.
  ///
  /// In en, this message translates to:
  /// **'Notification status unknown'**
  String get healthNotificationUnknown;

  /// No description provided for @healthExactAlarmGranted.
  ///
  /// In en, this message translates to:
  /// **'Exact alarms are enabled'**
  String get healthExactAlarmGranted;

  /// No description provided for @healthExactAlarmDenied.
  ///
  /// In en, this message translates to:
  /// **'Exact alarms are disabled'**
  String get healthExactAlarmDenied;

  /// No description provided for @healthExactAlarmUnknown.
  ///
  /// In en, this message translates to:
  /// **'Exact alarm status unknown'**
  String get healthExactAlarmUnknown;

  /// No description provided for @healthExactAlarmUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Not required on this platform'**
  String get healthExactAlarmUnavailable;

  /// No description provided for @healthBatteryOptimized.
  ///
  /// In en, this message translates to:
  /// **'Battery optimization may restrict reminders'**
  String get healthBatteryOptimized;

  /// No description provided for @healthBatteryIgnored.
  ///
  /// In en, this message translates to:
  /// **'Battery optimization is disabled'**
  String get healthBatteryIgnored;

  /// No description provided for @healthBatteryUnknown.
  ///
  /// In en, this message translates to:
  /// **'Battery optimization status unknown'**
  String get healthBatteryUnknown;

  /// No description provided for @healthServiceReady.
  ///
  /// In en, this message translates to:
  /// **'Notification service is ready'**
  String get healthServiceReady;

  /// No description provided for @healthServiceError.
  ///
  /// In en, this message translates to:
  /// **'Notification service encountered an error'**
  String get healthServiceError;

  /// No description provided for @healthDatabaseHealthy.
  ///
  /// In en, this message translates to:
  /// **'Database is open and healthy'**
  String get healthDatabaseHealthy;

  /// No description provided for @healthDatabaseError.
  ///
  /// In en, this message translates to:
  /// **'Database encountered an error'**
  String get healthDatabaseError;

  /// No description provided for @healthTimeZoneInfo.
  ///
  /// In en, this message translates to:
  /// **'Time zone is configured correctly'**
  String get healthTimeZoneInfo;

  /// No description provided for @healthTimeZoneError.
  ///
  /// In en, this message translates to:
  /// **'Time zone detection failed'**
  String get healthTimeZoneError;

  /// No description provided for @healthPendingNotificationsInfo.
  ///
  /// In en, this message translates to:
  /// **'Notification slots available'**
  String get healthPendingNotificationsInfo;

  /// No description provided for @healthPendingNotificationsError.
  ///
  /// In en, this message translates to:
  /// **'Failed to query pending notifications'**
  String get healthPendingNotificationsError;

  /// No description provided for @healthApplicationInfo.
  ///
  /// In en, this message translates to:
  /// **'Application information loaded'**
  String get healthApplicationInfo;

  /// No description provided for @healthApplicationError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load application info'**
  String get healthApplicationError;

  /// No description provided for @healthActionEnableNotifications.
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
  String get healthActionEnableNotifications;

  /// No description provided for @healthActionGrantExactAlarm.
  ///
  /// In en, this message translates to:
  /// **'Grant Exact Alarm'**
  String get healthActionGrantExactAlarm;

  /// No description provided for @healthActionOpenBatterySettings.
  ///
  /// In en, this message translates to:
  /// **'Open Battery Settings'**
  String get healthActionOpenBatterySettings;

  /// No description provided for @healthQuickFixes.
  ///
  /// In en, this message translates to:
  /// **'Quick Fixes'**
  String get healthQuickFixes;

  /// No description provided for @healthQuickFixesDescription.
  ///
  /// In en, this message translates to:
  /// **'Fix issues that may prevent reminders'**
  String get healthQuickFixesDescription;

  /// No description provided for @healthRefresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get healthRefresh;

  /// No description provided for @healthScoreExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get healthScoreExcellent;

  /// No description provided for @healthScoreGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get healthScoreGood;

  /// No description provided for @healthScoreNeedsAttention.
  ///
  /// In en, this message translates to:
  /// **'Needs Attention'**
  String get healthScoreNeedsAttention;

  /// No description provided for @healthScoreCritical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get healthScoreCritical;

  /// No description provided for @healthScorePassed.
  ///
  /// In en, this message translates to:
  /// **'{count} passed'**
  String healthScorePassed(Object count);

  /// No description provided for @healthScoreFailed.
  ///
  /// In en, this message translates to:
  /// **'{count} failed'**
  String healthScoreFailed(Object count);

  /// No description provided for @a11yHealthCheckStatus.
  ///
  /// In en, this message translates to:
  /// **'Status: {status}'**
  String a11yHealthCheckStatus(Object status);

  /// No description provided for @a11yHealthScore.
  ///
  /// In en, this message translates to:
  /// **'Score: {percent} percent'**
  String a11yHealthScore(Object percent);

  /// No description provided for @a11yHealthOverall.
  ///
  /// In en, this message translates to:
  /// **'Overall health: {label}'**
  String a11yHealthOverall(Object label);

  /// No description provided for @settingsContactDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Contact Developer'**
  String get settingsContactDeveloper;

  /// No description provided for @settingsCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get settingsCopiedToClipboard;

  /// No description provided for @backupExportTitle.
  ///
  /// In en, this message translates to:
  /// **'Export Backup'**
  String get backupExportTitle;

  /// No description provided for @backupExportDesc.
  ///
  /// In en, this message translates to:
  /// **'Create a full backup of all your medications, schedules, and dose logs.'**
  String get backupExportDesc;

  /// No description provided for @backupSaveToDevice.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get backupSaveToDevice;

  /// No description provided for @backupImportTitle.
  ///
  /// In en, this message translates to:
  /// **'Import Backup'**
  String get backupImportTitle;

  /// No description provided for @backupImportDesc.
  ///
  /// In en, this message translates to:
  /// **'Restore your data from a backup file.'**
  String get backupImportDesc;

  /// No description provided for @backupChooseFile.
  ///
  /// In en, this message translates to:
  /// **'Choose File'**
  String get backupChooseFile;

  /// No description provided for @backupValidFile.
  ///
  /// In en, this message translates to:
  /// **'Valid backup file'**
  String get backupValidFile;

  /// No description provided for @backupInvalidFile.
  ///
  /// In en, this message translates to:
  /// **'Invalid backup file'**
  String get backupInvalidFile;

  /// No description provided for @backupRestoreNow.
  ///
  /// In en, this message translates to:
  /// **'Restore Now'**
  String get backupRestoreNow;

  /// No description provided for @backupRestoreConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore Backup'**
  String get backupRestoreConfirmTitle;

  /// No description provided for @backupRestoreConfirmDesc.
  ///
  /// In en, this message translates to:
  /// **'This will overwrite existing data based on the selected restore mode. Are you sure you want to continue?'**
  String get backupRestoreConfirmDesc;

  /// No description provided for @backupRestoreSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup restored successfully'**
  String get backupRestoreSuccess;

  /// No description provided for @backupRestoreMode.
  ///
  /// In en, this message translates to:
  /// **'Restore Mode'**
  String get backupRestoreMode;

  /// No description provided for @backupRestoreModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Choose how you want to restore your data'**
  String get backupRestoreModeDesc;

  /// No description provided for @backupModeMerge.
  ///
  /// In en, this message translates to:
  /// **'Merge'**
  String get backupModeMerge;

  /// No description provided for @backupModeMergeDesc.
  ///
  /// In en, this message translates to:
  /// **'Add imported data while keeping existing records'**
  String get backupModeMergeDesc;

  /// No description provided for @backupModeReplace.
  ///
  /// In en, this message translates to:
  /// **'Replace'**
  String get backupModeReplace;

  /// No description provided for @backupModeReplaceDesc.
  ///
  /// In en, this message translates to:
  /// **'Clear all existing data before restoring'**
  String get backupModeReplaceDesc;

  /// No description provided for @backupLastExport.
  ///
  /// In en, this message translates to:
  /// **'Last Export Info'**
  String get backupLastExport;

  /// No description provided for @backupVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get backupVersion;

  /// No description provided for @backupDevice.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get backupDevice;

  /// No description provided for @backupExported.
  ///
  /// In en, this message translates to:
  /// **'Exported'**
  String get backupExported;

  /// No description provided for @backupMedicationsCount.
  ///
  /// In en, this message translates to:
  /// **'Medications'**
  String get backupMedicationsCount;

  /// No description provided for @backupSchedulesCount.
  ///
  /// In en, this message translates to:
  /// **'Schedules'**
  String get backupSchedulesCount;

  /// No description provided for @backupDoseLogsCount.
  ///
  /// In en, this message translates to:
  /// **'Dose Logs'**
  String get backupDoseLogsCount;

  /// No description provided for @backupIncludesSettings.
  ///
  /// In en, this message translates to:
  /// **'Includes settings'**
  String get backupIncludesSettings;
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
