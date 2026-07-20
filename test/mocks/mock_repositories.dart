import 'package:mocktail/mocktail.dart';
import 'package:medication_reminder/features/medications/medication_management/repositories/medication_repository.dart';
import 'package:medication_reminder/features/settings/repositories/settings_repository.dart';
import 'package:medication_reminder/features/medications/today_dashboard/repositories/today_dashboard_repository.dart';
import 'package:medication_reminder/features/medications/compliance_history/repositories/compliance_history_repository.dart';
import 'package:medication_reminder/core/notifications/notification_manager.dart';

class MockMedicationRepository extends Mock implements MedicationRepository {}

class MockSettingsRepository extends Mock implements SettingsRepository {}

class MockTodayDashboardRepository extends Mock
    implements TodayDashboardRepository {}

class MockComplianceHistoryRepository extends Mock
    implements ComplianceHistoryRepository {}

class MockNotificationManager extends Mock implements NotificationManager {}
