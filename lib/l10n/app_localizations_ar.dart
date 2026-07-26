// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تذكير بالأدوية';

  @override
  String get medications => 'الأدوية';

  @override
  String get searchMedications => 'بحث عن دواء...';

  @override
  String get noMedicationsFound =>
      'لم يتم العثور على أدوية.\nاضغط + لإضافة دواء.';

  @override
  String get addMedication => 'إضافة دواء';

  @override
  String get editMedication => 'تعديل الدواء';

  @override
  String get medicationName => 'اسم الدواء';

  @override
  String get medicationNameHint => 'مثال: إيبوبروفين';

  @override
  String get dosage => 'الجرعة';

  @override
  String get dosageHint => 'مثال: 200 ملغ';

  @override
  String get color => 'اللون';

  @override
  String get priority => 'الأولوية';

  @override
  String get repeatType => 'نوع التكرار';

  @override
  String get selectDays => 'اختر الأيام';

  @override
  String get intervalHours => 'الفاصل الزمني (ساعات)';

  @override
  String get intervalHint => 'مثال: 8';

  @override
  String get startDate => 'تاريخ البدء';

  @override
  String get endDateOptional => 'تاريخ الانتهاء (اختياري)';

  @override
  String get time => 'الوقت';

  @override
  String get save => 'حفظ';

  @override
  String get update => 'تحديث';

  @override
  String get selectDate => 'اختر التاريخ';

  @override
  String get priorityLow => 'منخفضة';

  @override
  String get priorityMedium => 'متوسطة';

  @override
  String get priorityHigh => 'عالية';

  @override
  String get priorityMed => 'متوسطة';

  @override
  String get repeatDaily => 'يومي';

  @override
  String get repeatSpecificDays => 'أيام محددة';

  @override
  String get repeatAsNeeded => 'حسب الحاجة';

  @override
  String get repeatInterval => 'فاصل زمني';

  @override
  String get dayMon => 'اثنين';

  @override
  String get dayTue => 'ثلاثاء';

  @override
  String get dayWed => 'أربعاء';

  @override
  String get dayThu => 'خميس';

  @override
  String get dayFri => 'جمعة';

  @override
  String get daySat => 'سبت';

  @override
  String get daySun => 'أحد';

  @override
  String get monthJan => 'يناير';

  @override
  String get monthFeb => 'فبراير';

  @override
  String get monthMar => 'مارس';

  @override
  String get monthApr => 'أبريل';

  @override
  String get monthMay => 'مايو';

  @override
  String get monthJun => 'يونيو';

  @override
  String get monthJul => 'يوليو';

  @override
  String get monthAug => 'أغسطس';

  @override
  String get monthSep => 'سبتمبر';

  @override
  String get monthOct => 'أكتوبر';

  @override
  String get monthNov => 'نوفمبر';

  @override
  String get monthDec => 'ديسمبر';

  @override
  String get todayDashboard => 'اليوم';

  @override
  String get dashboardTotal => 'الإجمالي';

  @override
  String get dashboardCompleted => 'مكتمل';

  @override
  String get dashboardMissed => 'فائت';

  @override
  String get dashboardUpcoming => 'قادم';

  @override
  String get dashboardCompletedLower => 'مكتمل';

  @override
  String get dashboardNext => 'التالي';

  @override
  String get dashboardOverdue => 'متأخر';

  @override
  String get dashboardTaken => 'تم تناوله';

  @override
  String get dashboardSkipped => 'تم تخطيه';

  @override
  String get dashboardTake => 'تناول';

  @override
  String get dashboardSkip => 'تخطي';

  @override
  String get dashboardSnooze => 'تأجيل';

  @override
  String get dashboardSnoozeDuration => 'تأجيل لمدة';

  @override
  String get dashboardMinutes => 'دقيقة';

  @override
  String get dashboardViewDetails => 'عرض التفاصيل';

  @override
  String get dashboardOverdueLabel => 'متأخر';

  @override
  String get dashboardFilterAll => 'الكل';

  @override
  String get dashboardFilterUpcoming => 'قادم';

  @override
  String get dashboardFilterCompleted => 'مكتمل';

  @override
  String get dashboardFilterMissed => 'فائت';

  @override
  String get dashboardFilterCritical => 'حرج';

  @override
  String get dashboardFilterNormal => 'عادي';

  @override
  String get dashboardFilterLow => 'منخفض';

  @override
  String get dashboardEmptyTitle => 'لا توجد أدوية مجدولة اليوم';

  @override
  String get dashboardEmptySubtitle => 'أضف دواءً لبدء تتبع جرعاتك';

  @override
  String get errorLoadingDashboard =>
      'فشل تحميل لوحة التحكم.\nيرجى المحاولة مرة أخرى.';

  @override
  String get dashboardNoFilterResults => 'لا توجد أدوية تطابق هذا الفلتر';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get historyTitle => 'سجل الالتزام';

  @override
  String get historyStatistics => 'الإحصائيات';

  @override
  String get historyAdherence => 'نسبة الالتزام';

  @override
  String get historyTaken => 'تم تناوله';

  @override
  String get historyMissed => 'فائت';

  @override
  String get historySkipped => 'تم تخطيه';

  @override
  String get historySnoozed => 'مؤجل';

  @override
  String get historyCurrentStreak => 'السلسلة الحالية';

  @override
  String get historyLongestStreak => 'أطول سلسلة';

  @override
  String get historyDateRange7Days => 'آخر 7 أيام';

  @override
  String get historyDateRange30Days => 'آخر 30 يوم';

  @override
  String get historyDateRangeCustom => 'مخصص';

  @override
  String get historyDateRangeAll => 'كل السجلات';

  @override
  String get historyGroupByDay => 'تجميع حسب اليوم';

  @override
  String get historyGroupByWeek => 'تجميع حسب الأسبوع';

  @override
  String get historyGroupByMonth => 'تجميع حسب الشهر';

  @override
  String get historyGroupByMedication => 'تجميع حسب الدواء';

  @override
  String get historyLoading => 'جاري تحميل السجل...';

  @override
  String get historyErrorLoading => 'فشل تحميل السجل.\nيرجى المحاولة مرة أخرى.';

  @override
  String get historyEmptyTitle => 'لم يتم العثور على سجلات';

  @override
  String get historyEmptySubtitle =>
      'سيظهر سجل التزامك بالأدوية هنا بمجرد البدء في تناول الجرعات';

  @override
  String get historyTotalDoses => 'إجمالي الجرعات';

  @override
  String get historyDailyAverage => 'المتوسط اليومي';

  @override
  String get viewHistory => 'عرض السجل';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsProfiles => 'الحسابات';

  @override
  String get settingsGeneral => 'عام';

  @override
  String get settingsNotifications => 'الإشعارات';

  @override
  String get settingsHistory => 'السجل';

  @override
  String get settingsBackup => 'النسخ الاحتياطي';

  @override
  String get settingsAbout => 'حول التطبيق';

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get settingsLanguageArabic => 'العربية';

  @override
  String get settingsLanguageEnglish => 'الإنجليزية';

  @override
  String get settingsTheme => 'المظهر';

  @override
  String get settingsThemeLight => 'فاتح';

  @override
  String get settingsThemeDark => 'داكن';

  @override
  String get settingsThemeSystem => 'النظام';

  @override
  String get settingsFirstDayOfWeek => 'أول أيام الأسبوع';

  @override
  String get settingsTimeFormat24 => 'تنسيق الوقت 24 ساعة';

  @override
  String get settingsNotificationsEnabled => 'تفعيل الإشعارات';

  @override
  String get settingsNotificationSound => 'صوت الإشعار';

  @override
  String get settingsVibrationEnabled => 'الاهتزاز';

  @override
  String get settingsDefaultSnooze => 'التأجيل الافتراضي';

  @override
  String get settingsReminderBefore => 'تذكير قبل الجرعة';

  @override
  String get settingsReminderAtTime => 'في الوقت المحدد';

  @override
  String get settingsDefaultFilter => 'الفلتر الافتراضي';

  @override
  String get settingsDefaultGrouping => 'التجميع الافتراضي';

  @override
  String get settingsAutoBackup => 'النسخ الاحتياطي التلقائي';

  @override
  String get settingsAutoBackupDesc => 'نسخ احتياطي تلقائي لبياناتك';

  @override
  String get settingsManualBackup => 'النسخ الاحتياطي اليدوي';

  @override
  String get settingsRestoreBackup => 'استعادة النسخة الاحتياطية';

  @override
  String get settingsComingSoon => 'قريباً';

  @override
  String get settingsVersion => 'الإصدار';

  @override
  String get settingsBuildNumber => 'رقم البناء';

  @override
  String get settingsUpdate => 'التحقق من التحديثات';

  @override
  String get settingsUpdateDesc => 'التحقق من وجود إصدار أحدث';

  @override
  String get settingsUpdateAvailable => 'يتوفر تحديث';

  @override
  String get settingsUpdateCurrentVersion => 'الإصدار الحالي';

  @override
  String get settingsUpdateChecking => 'جارٍ التحقق من التحديثات...';

  @override
  String get settingsUpdateUpToDate => 'أنت تستخدم أحدث إصدار';

  @override
  String get settingsUpdateError => 'فشل التحقق من التحديثات';

  @override
  String get settingsUpdateNotPublished =>
      'التطبيق غير متاح حالياً على متجر Google Play';

  @override
  String get settingsUpdateNow => 'تحديث';

  @override
  String get settingsUpdateLater => 'لاحقاً';

  @override
  String get settingsLicenses => 'التراخيص';

  @override
  String get settingsPrivacyPolicy => 'سياسة الخصوصية';

  @override
  String get settingsPrivacyPolicyDesc => 'كيف نحمي بياناتك';

  @override
  String get settingsResetDefaults => 'إعادة التعيين';

  @override
  String get settingsResetConfirm =>
      'هل أنت متأكد من إعادة جميع الإعدادات إلى قيمها الافتراضية؟';

  @override
  String get settingsErrorLoading =>
      'فشل تحميل الإعدادات.\nيرجى المحاولة مرة أخرى.';

  @override
  String get settingsSave => 'حفظ';

  @override
  String get cancel => 'إلغاء';

  @override
  String get delete => 'حذف';

  @override
  String get confirm => 'تأكيد';

  @override
  String get undo => 'تراجع';

  @override
  String get done => 'تم';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get medicationCreated => 'تم إنشاء الدواء بنجاح';

  @override
  String get medicationUpdated => 'تم تحديث الدواء بنجاح';

  @override
  String get medicationDeleted => 'تم حذف الدواء';

  @override
  String get doseTaken => 'تم تسجيل تناول الجرعة';

  @override
  String get doseSkipped => 'تم تخطي الجرعة';

  @override
  String doseSnoozed(Object minutes) {
    return 'تم تأجيل الجرعة لمدة $minutes دقيقة';
  }

  @override
  String get doseSnoozedShort => 'تم تأجيل الجرعة';

  @override
  String get settingsSaved => 'تم حفظ الإعدادات';

  @override
  String get settingsResetDone => 'تم إعادة الإعدادات إلى الافتراضي';

  @override
  String get errorCreatingMedication =>
      'فشل إنشاء الدواء.\nيرجى المحاولة مرة أخرى.';

  @override
  String get errorUpdatingMedication =>
      'فشل تحديث الدواء.\nيرجى المحاولة مرة أخرى.';

  @override
  String get errorDeletingMedication =>
      'فشل حذف الدواء.\nيرجى المحاولة مرة أخرى.';

  @override
  String get errorMarkingDose => 'فشل تسجيل الجرعة.\nيرجى المحاولة مرة أخرى.';

  @override
  String get confirmDeactivateMedication => 'هل أنت متأكد من تعطيل هذا الدواء؟';

  @override
  String get confirmDeleteMedication =>
      'هل أنت متأكد من حذف هذا الدواء؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get noResultsFound => 'لم يتم العثور على نتائج';

  @override
  String get clearSearch => 'مسح البحث';

  @override
  String get medicationNameRequired => 'اسم الدواء مطلوب';

  @override
  String get dosageRequired => 'الجرعة مطلوبة';

  @override
  String get startDateRequired => 'تاريخ البدء مطلوب';

  @override
  String get endDateAfterStart => 'يجب أن يكون تاريخ الانتهاء بعد تاريخ البدء';

  @override
  String get formUnsavedChanges => 'لديك تغييرات غير محفوظة';

  @override
  String a11yMedicationActive(Object name) {
    return '$name, نشط';
  }

  @override
  String a11yMedicationInactive(Object name) {
    return '$name, غير نشط';
  }

  @override
  String get a11yMedicationCardHint => 'انقر مرتين للتعديل';

  @override
  String get a11ySwitchOn => 'مفعّل';

  @override
  String get a11ySwitchOff => 'غير مفعّل';

  @override
  String a11yColorSelected(Object color) {
    return '$color محدد';
  }

  @override
  String a11yColorNotSelected(Object color) {
    return '$color';
  }

  @override
  String a11yDaySelected(Object day) {
    return '$day, محدد';
  }

  @override
  String a11yDayNotSelected(Object day) {
    return '$day, غير محدد';
  }

  @override
  String a11yChipSelected(Object label) {
    return '$label, محدد';
  }

  @override
  String a11yChipNotSelected(Object label) {
    return '$label';
  }

  @override
  String a11yPriorityLabel(Object priority) {
    return 'الأولوية: $priority';
  }

  @override
  String a11yDoseStatus(Object status) {
    return 'الحالة: $status';
  }

  @override
  String a11yScheduledTime(Object time) {
    return 'مجدول في $time';
  }

  @override
  String a11yRemainingTime(Object time) {
    return '$time متبقي';
  }

  @override
  String get a11yOverdue => 'متأخر';

  @override
  String a11yTakeDose(Object name) {
    return 'تناول جرعة $name';
  }

  @override
  String a11ySkipDose(Object name) {
    return 'تخطي جرعة $name';
  }

  @override
  String a11ySnoozeDose(Object name) {
    return 'تأجيل جرعة $name';
  }

  @override
  String get a11yDoseTaken => 'تم تناول الجرعة';

  @override
  String get a11yDoseSkipped => 'تم تخطي الجرعة';

  @override
  String get a11yAddMedication => 'إضافة دواء';

  @override
  String get a11ySearchMedications => 'بحث عن أدوية';

  @override
  String get a11yClearSearch => 'مسح البحث';

  @override
  String get a11yLoading => 'جاري التحميل';

  @override
  String get a11yError => 'خطأ';

  @override
  String get a11yRetry => 'إعادة المحاولة';

  @override
  String get a11yEmptyState => 'حالة فارغة';

  @override
  String a11yProgress(Object percent) {
    return '$percent% مكتمل';
  }

  @override
  String a11yAdherence(Object percent) {
    return 'نسبة الالتزام: $percent%';
  }

  @override
  String a11yStreakCurrent(Object count) {
    return 'السلسلة الحالية: $count أيام';
  }

  @override
  String a11yStreakLongest(Object count) {
    return 'أطول سلسلة: $count أيام';
  }

  @override
  String a11yFilterActive(Object label) {
    return 'فلتر: $label';
  }

  @override
  String a11ySectionCount(Object count, Object label) {
    return '$label, $count عناصر';
  }

  @override
  String a11yGroupHeader(Object count, Object label) {
    return '$label, $count جرعات';
  }

  @override
  String a11yHistoryItem(Object name, Object status, Object time) {
    return '$name, $status, $time';
  }

  @override
  String get a11yOpenDatePicker => 'فتح منتقي التاريخ';

  @override
  String get a11yClearDate => 'مسح التاريخ';

  @override
  String get a11yFormRequired => 'حقل مطلوب';

  @override
  String get a11yDialogConfirm => 'تأكيد الإجراء';

  @override
  String get a11yDialogCancel => 'إلغاء الإجراء';

  @override
  String get a11yLanguageArabic => 'العربية';

  @override
  String get a11yLanguageEnglish => 'الإنجليزية';

  @override
  String get a11yThemeLight => 'المظهر الفاتح';

  @override
  String get a11yThemeDark => 'المظهر الداكن';

  @override
  String get a11yThemeSystem => 'مظهر النظام';

  @override
  String get a11yNotificationsOn => 'الإشعارات مفعّلة';

  @override
  String get a11yNotificationsOff => 'الإشعارات غير مفعّلة';

  @override
  String get wizardAppLogo => 'شعار تطبيق مداوي';

  @override
  String get wizardWelcomeDescription =>
      'يساعدك مداوي على تذكّر أدويتك حتى بدون اتصال بالإنترنت، مع الحفاظ الكامل على خصوصية بياناتك.';

  @override
  String get wizardStart => 'ابدأ';

  @override
  String get wizardSkip => 'تخطي';

  @override
  String get wizardNext => 'التالي';

  @override
  String get wizardNotificationIcon => 'أيقونة صلاحية الإشعارات';

  @override
  String get wizardNotificationTitle => 'صلاحية الإشعارات';

  @override
  String get wizardNotificationDescription =>
      'يعتمد التطبيق على الإشعارات المحلية لتذكيرك بمواعيد أدويةك.';

  @override
  String get wizardGrantPermission => 'منح الصلاحية';

  @override
  String get wizardNotificationGranted => 'تم منح الصلاحية';

  @override
  String get wizardExactAlarmIcon => 'أيقونة المنبه الدقيق';

  @override
  String get wizardExactAlarmTitle => 'صلاحية المنبه الدقيق';

  @override
  String get wizardExactAlarmDescription =>
      'السماح بالمنبهات الدقيقة يضمن وصول تذكيراتك في الوقت المحدد تماماً، حتى وضع توفير البطارية لا يمكنه تأخيرها.';

  @override
  String get wizardEnableExactAlarm => 'تفعيل المنبهات الدقيقة';

  @override
  String get wizardExactAlarmGranted => 'تم تفعيل المنبهات الدقيقة';

  @override
  String get wizardExactAlarmNotRequired => 'غير مطلوب';

  @override
  String get wizardExactAlarmNotRequiredDescription =>
      'لا يتطلب جهازك صلاحيات منبه إضافية. يمكنك المتابعة.';

  @override
  String get wizardBatteryIcon => 'أيقونة تحسين البطارية';

  @override
  String get wizardBatteryTitle => 'تحسين البطارية';

  @override
  String get wizardBatteryDescription =>
      'تمنع بعض الشركات النشاط في الخلفية، مما قد يمنع التذكيرات من الظهور في موعدها. قم بتعطيل تحسين البطارية لمداوي لضمان إشعارات موثوقة.';

  @override
  String get wizardBatteryGranted => 'تم تعطيل تحسين البطارية';

  @override
  String get wizardOpenSettings => 'فتح الإعدادات';

  @override
  String get wizardCompletionIcon => 'أيقونة اكتمال الإعداد';

  @override
  String get wizardCompletionTitle => 'كل شيء جاهز.';

  @override
  String get wizardCompletionDescription => 'يمكنك الآن إضافة أول دواء.';

  @override
  String get wizardAddFirstMedication => 'إضافة دواء';

  @override
  String get wizardGoHome => 'الانتقال للرئيسية';

  @override
  String get firstRunWelcomeTitle => 'مرحباً بك في مداوي';

  @override
  String get firstRunWelcomeDescription =>
      'ابدأ بإضافة أول دواء لتتلقى تذكيرات في الوقت المناسب وتتابع جرعاتك.';

  @override
  String get firstRunExploreApp => 'استكشف التطبيق';

  @override
  String get firstRunDismiss => 'إغلاق';

  @override
  String get firstRunNotificationHintTitle => 'تفعيل الإشعارات';

  @override
  String get firstRunNotificationHintDescription =>
      'لا تنسَ تفعيل الإشعارات لتتلقى تذكيرات الأدوية في الوقت المناسب.';

  @override
  String get firstRunNotificationHintEnable => 'تفعيل';

  @override
  String get firstRunSuccessTitle => 'تمت إضافة الدواء!';

  @override
  String get firstRunSuccessDescription =>
      'تمت إضافة أول دواء بنجاح. ستتلقى تذكيرات في المواعيد المحددة.';

  @override
  String get firstRunSuccessContinue => 'بدء التتبع';

  @override
  String get firstRunEmptyHistoryTitle => 'لا يوجد سجل جرعات بعد';

  @override
  String get firstRunEmptyHistoryDescription =>
      'سيظهر سجل التزامك بالأدوية هنا بمجرد البدء في تناول الجرعات.';

  @override
  String get firstRunEmptySearchTitle => 'لا توجد أدوية مطابقة';

  @override
  String get firstRunEmptySearchDescription =>
      'جرّب مصطلح بحث مختلف أو امسح الفلاتر.';

  @override
  String get healthSystemHealthTitle => 'صحة النظام';

  @override
  String get healthNotificationPermissionTitle => 'صلاحية الإشعارات';

  @override
  String get healthExactAlarmTitle => 'صلاحية المنبه الدقيق';

  @override
  String get healthBatteryTitle => 'تحسين البطارية';

  @override
  String get healthNotificationServiceTitle => 'خدمة الإشعارات';

  @override
  String get healthPendingNotificationsTitle => 'الإشعارات المعلقة';

  @override
  String get healthDatabaseTitle => 'قاعدة البيانات';

  @override
  String get healthTimeZoneTitle => 'المنطقة الزمنية';

  @override
  String get healthApplicationTitle => 'التطبيق';

  @override
  String get healthNotificationGranted => 'الإشعارات مفعّلة';

  @override
  String get healthNotificationDenied => 'الإشعارات معطّلة';

  @override
  String get healthNotificationUnknown => 'حالة الإشعارات غير معروفة';

  @override
  String get healthExactAlarmGranted => 'المنبهات الدقيقة مفعّلة';

  @override
  String get healthExactAlarmDenied => 'المنبهات الدقيقة معطّلة';

  @override
  String get healthExactAlarmUnknown => 'حالة المنبه الدقيق غير معروفة';

  @override
  String get healthExactAlarmUnavailable => 'غير مطلوب على هذا النظام';

  @override
  String get healthBatteryOptimized => 'تحسين البطارية قد يمنع التذكيرات';

  @override
  String get healthBatteryIgnored => 'تحسين البطارية معطّل';

  @override
  String get healthBatteryUnknown => 'حالة تحسين البطارية غير معروفة';

  @override
  String get healthServiceReady => 'خدمة الإشعارات جاهزة';

  @override
  String get healthServiceError => 'خدمة الإشعارات واجهت خطأ';

  @override
  String get healthDatabaseHealthy => 'قاعدة البيانات مفتوحة وسليمة';

  @override
  String get healthDatabaseError => 'قاعدة البيانات واجهت خطأ';

  @override
  String get healthTimeZoneInfo => 'المنطقة الزمنية مضبوطة بشكل صحيح';

  @override
  String get healthTimeZoneError => 'فشل تحديد المنطقة الزمنية';

  @override
  String get healthPendingNotificationsInfo => 'Slots الإشعارات متاحة';

  @override
  String get healthPendingNotificationsError =>
      'فشل الاستعلام عن الإشعارات المعلقة';

  @override
  String get healthApplicationInfo => 'تم تحميل معلومات التطبيق';

  @override
  String get healthApplicationError => 'فشل تحميل معلومات التطبيق';

  @override
  String get healthActionEnableNotifications => 'تفعيل الإشعارات';

  @override
  String get healthActionGrantExactAlarm => 'منح صلاحية المنبه الدقيق';

  @override
  String get healthActionOpenBatterySettings => 'فتح إعدادات البطارية';

  @override
  String get healthQuickFixes => 'إصلاحات سريعة';

  @override
  String get healthQuickFixesDescription =>
      'إصلاح المشاكل التي قد تمنع التذكيرات';

  @override
  String get healthRefresh => 'تحديث';

  @override
  String get healthScoreExcellent => 'ممتاز';

  @override
  String get healthScoreGood => 'جيد';

  @override
  String get healthScoreNeedsAttention => 'يحتاج انتباه';

  @override
  String get healthScoreCritical => 'حرج';

  @override
  String healthScorePassed(Object count) {
    return '$count ناجح';
  }

  @override
  String healthScoreFailed(Object count) {
    return '$count فاشل';
  }

  @override
  String a11yHealthCheckStatus(Object status) {
    return 'الحالة: $status';
  }

  @override
  String a11yHealthScore(Object percent) {
    return 'النتيجة: $percent%';
  }

  @override
  String a11yHealthOverall(Object label) {
    return 'الصحة العامة: $label';
  }

  @override
  String get settingsContactDeveloper => 'تواصل مع المطور';

  @override
  String get settingsCopiedToClipboard => 'تم النسخ إلى الحافظة';

  @override
  String get backupExportTitle => 'تصدير نسخة احتياطية';

  @override
  String get backupExportDesc =>
      'إنشاء نسخة احتياطية كاملة لجميع أدويتك وجداول الجرعات وسجل الجرعات.';

  @override
  String get backupSaveToDevice => 'تصدير';

  @override
  String get backupImportTitle => 'استيراد نسخة احتياطية';

  @override
  String get backupImportDesc => 'استعادة بياناتك من ملف نسخة احتياطية.';

  @override
  String get backupChooseFile => 'اختيار ملف';

  @override
  String get backupValidFile => 'ملف نسخة احتياطية صالح';

  @override
  String get backupInvalidFile => 'ملف نسخة احتياطية غير صالح';

  @override
  String get backupRestoreNow => 'استعادة الآن';

  @override
  String get backupRestoreConfirmTitle => 'استعادة النسخة الاحتياطية';

  @override
  String get backupRestoreConfirmDesc =>
      'سيتم استبدال البيانات الحالية بناءً على وضع الاستعادة المحدد. هل أنت متأكد من الاستمرار؟';

  @override
  String get backupRestoreSuccess => 'تمت استعادة النسخة الاحتياطية بنجاح';

  @override
  String get backupRestoreMode => 'وضع الاستعادة';

  @override
  String get backupRestoreModeDesc => 'اختر كيفية استعادة بياناتك';

  @override
  String get backupModeMerge => 'دمج';

  @override
  String get backupModeMergeDesc =>
      'إضافة البيانات المستوردة مع الاحتفاظ بالسجلات الحالية';

  @override
  String get backupModeReplace => 'استبدال';

  @override
  String get backupModeReplaceDesc => 'مسح جميع البيانات الحالية قبل الاستعادة';

  @override
  String get backupLastExport => 'معلومات آخر تصدير';

  @override
  String get backupVersion => 'الإصدار';

  @override
  String get backupDevice => 'الجهاز';

  @override
  String get backupExported => 'تم التصدير';

  @override
  String get backupMedicationsCount => 'الأدوية';

  @override
  String get backupSchedulesCount => 'الجداول';

  @override
  String get backupDoseLogsCount => 'سجل الجرعات';

  @override
  String get medicationStockTrackingOptional => 'تتبع المخزون (اختياري)';

  @override
  String get medicationStockQuantity => 'كمية المخزون';

  @override
  String get medicationStockQuantityHint => 'مثال: 30';

  @override
  String get medicationStockThreshold => 'التنبيه عند المتبقي';

  @override
  String get medicationStockThresholdHint => 'مثال: 5';

  @override
  String settingsProfileCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ملف شخصي',
      many: '$count ملفاً شخصياً',
      few: '$count ملفات شخصية',
      two: 'ملفان شخصيان',
      one: 'ملف شخصي واحد',
    );
    return '$_temp0';
  }

  @override
  String settingsProfileActive(Object activeName, num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ملف شخصي',
      many: '$count ملفاً شخصياً',
      few: '$count ملفات شخصية',
      two: 'ملفان شخصيان',
      one: 'ملف شخصي واحد',
    );
    return '$activeName · $_temp0';
  }

  @override
  String get profileNameHint => 'مثال: أمي، أبي، طفل';

  @override
  String get profileDeleteDialogTitle => 'حذف الملف الشخصي';

  @override
  String get profileAddTitle => 'إضافة ملف شخصي';

  @override
  String get profileEditTitle => 'تعديل الملف الشخصي';

  @override
  String get profileNameLabel => 'الاسم';

  @override
  String get profileColorLabel => 'اللون';

  @override
  String get profileIconLabel => 'الأيقونة';

  @override
  String profileDeleteConfirm(Object name) {
    return 'هل أنت متأكد من حذف \"$name\"؟ سيتم حذف جميع الأدوية في هذا الملف الشخصي نهائياً.';
  }

  @override
  String get settingsSystemHealthSubtitle => 'التحقق من حالة صحة التطبيق';

  @override
  String get systemHealthChecksSection => 'فحوصات النظام';

  @override
  String get historyDays => 'أيام';

  @override
  String wizardStepProgress(Object current, Object total) {
    return 'الخطوة $current من $total';
  }

  @override
  String get notificationActionTaken => 'تم التناول';

  @override
  String get notificationActionSnooze15 => 'تأجيل 15 دقيقة';

  @override
  String get notificationTitleCritical => '⚠️ تنبيه دواء حرج';

  @override
  String get notificationTitleRegular => 'تذكير بموعد الدواء';

  @override
  String get notificationBodyCritical =>
      'حان وقت تناول دوائك الحرج الآن، نرجو عدم التأخير';

  @override
  String get notificationBodyRegular => 'حان وقت تناول الدواء';

  @override
  String get homeWidgetNoDosesRemaining => 'لا توجد جرعات متبقية اليوم';

  @override
  String get backupIncludesSettings => 'يتضمن الإعدادات';

  @override
  String get foodInstructionLabel => 'تعليمات التناول مع الطعام';

  @override
  String get foodInstructionNone => 'بدون تعليمات خاصة';

  @override
  String get foodInstructionBeforeMeal => 'قبل الطعام';

  @override
  String get foodInstructionWithMeal => 'مع الطعام';

  @override
  String get foodInstructionAfterMeal => 'بعد الطعام';

  @override
  String get foodInstructionOnEmptyStomach => 'على معدة فارغة';

  @override
  String get foodInstructionBeforeBed => 'قبل النوم';

  @override
  String get medicationPhotoLabel => 'صورة الدواء/العلبة (اختياري)';

  @override
  String get medicationPhotoAdd => 'إضافة صورة';

  @override
  String get medicationPhotoRemove => 'إزالة الصورة';

  @override
  String get refillAlertTitle => 'تنبيه إكمال المخزون';

  @override
  String refillAlertMessage(Object count, Object name) {
    return 'تنبيه المخزون: متبقي من $name عدد $count جرعات فقط!';
  }

  @override
  String get accentThemeLabel => 'اللون الأساسي للتطبيق';

  @override
  String get accentIndigo => 'بنفسجي نيلي';

  @override
  String get accentEmerald => 'أخضر زمردي';

  @override
  String get accentOcean => 'أزرق محيطي';

  @override
  String get accentSunset => 'برتقالي الغروب';

  @override
  String get accentViolet => 'بنفسجي ملكي';

  @override
  String get medicationBasicInfo => 'البيانات الأساسية';

  @override
  String get medicationScheduleHeading => 'جدول التناول والتوقيت';

  @override
  String get medicationStockAndPhotoHeading => 'المخزون والصورة';

  @override
  String get celebrationTitle => 'أحسنت! أكملت جميع جرعات اليوم 🎉';

  @override
  String get celebrationSubtitle =>
      'ممتاز! واصل الالتزام بجدول أدويتك لصحة أفضل.';
}
