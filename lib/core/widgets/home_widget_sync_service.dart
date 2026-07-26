import 'package:flutter/foundation.dart';
import 'package:home_widget/home_widget.dart';
import 'package:medication_reminder/core/utils/time_formatter.dart';
import '../../features/medications/today_dashboard/models/dashboard_medication_model.dart';
import '../../features/medications/today_dashboard/models/dashboard_summary_model.dart';

/// Cross-platform synchronization service for Home Screen & Lock Screen Widgets.
class HomeWidgetSyncService {
  HomeWidgetSyncService._();

  static const String appGroupId = 'group.com.mohammedzaki.medication_reminder';
  static const String androidWidgetProvider = 'MedicationWidgetProvider';
  static const String iOSWidgetName = 'MedicationWidget';

  /// Synchronizes next medication details & summary counters to Home Screen Widgets.
  static Future<void> syncNextMedication({
    required DashboardMedicationModel? nextMedication,
    required DashboardSummaryModel? summary,
    String? emptyMessage,
  }) async {
    try {
      if (nextMedication != null) {
        final formattedTime = AppTimeFormatter.formatDateTime(
          nextMedication.scheduledTime,
          isArabic: true,
        );

        await HomeWidget.saveWidgetData<String>(
          'next_med_name',
          nextMedication.name,
        );
        await HomeWidget.saveWidgetData<String>(
          'next_med_dosage',
          nextMedication.dosage,
        );
        await HomeWidget.saveWidgetData<String>(
          'next_med_time',
          formattedTime,
        );
      } else {
        await HomeWidget.saveWidgetData<String>(
          'next_med_name',
          emptyMessage ?? 'لا توجد جرعات متبقية اليوم',
        );
        await HomeWidget.saveWidgetData<String>('next_med_dosage', '');
        await HomeWidget.saveWidgetData<String>('next_med_time', '--:--');
      }

      if (summary != null) {
        await HomeWidget.saveWidgetData<int>(
          'upcoming_count',
          summary.upcoming,
        );
        await HomeWidget.saveWidgetData<int>(
          'completed_count',
          summary.completed,
        );
      }

      await HomeWidget.updateWidget(
        name: androidWidgetProvider,
        iOSName: iOSWidgetName,
      );
    } catch (e) {
      debugPrint('HomeWidgetSyncService error: $e');
    }
  }
}
