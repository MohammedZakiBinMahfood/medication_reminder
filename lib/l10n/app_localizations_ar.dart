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
}
