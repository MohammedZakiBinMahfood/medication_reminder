import 'package:flutter_test/flutter_test.dart';
import 'package:medication_reminder/core/widgets/home_widget_sync_service.dart';
import 'package:medication_reminder/features/medications/medication_management/models/enums/medication_enums.dart';
import 'package:medication_reminder/features/medications/today_dashboard/models/dashboard_medication_model.dart';
import 'package:medication_reminder/features/medications/today_dashboard/models/dashboard_summary_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HomeWidgetSyncService', () {
    test('constants are correctly configured', () {
      expect(
        HomeWidgetSyncService.appGroupId,
        equals('group.com.example.medication_reminder'),
      );
      expect(
        HomeWidgetSyncService.androidWidgetProvider,
        equals('MedicationWidgetProvider'),
      );
      expect(
        HomeWidgetSyncService.iOSWidgetName,
        equals('MedicationWidget'),
      );
    });

    test('syncNextMedication handles null nextMedication safely', () async {
      final summary = DashboardSummaryModel(
        totalMedications: 0,
        completed: 0,
        missed: 0,
        upcoming: 0,
        nextMedication: null,
      );

      expect(
        () async => HomeWidgetSyncService.syncNextMedication(
          nextMedication: null,
          summary: summary,
        ),
        returnsNormally,
      );
    });

    test('syncNextMedication handles valid nextMedication safely', () async {
      final nextMed = DashboardMedicationModel(
        medicationUuid: 'med-1',
        scheduleUuid: 'sch-1',
        name: 'Aspirin',
        dosage: '100 mg',
        color: '#FF0000',
        priority: MedicationPriority.high,
        scheduledTime: DateTime(2026, 7, 23, 14, 30),
        doseStatus: DoseStatus.pending,
        isOverdue: false,
      );

      final summary = DashboardSummaryModel(
        totalMedications: 1,
        completed: 0,
        missed: 0,
        upcoming: 1,
        nextMedication: nextMed,
      );

      expect(
        () async => HomeWidgetSyncService.syncNextMedication(
          nextMedication: nextMed,
          summary: summary,
        ),
        returnsNormally,
      );
    });
  });
}
