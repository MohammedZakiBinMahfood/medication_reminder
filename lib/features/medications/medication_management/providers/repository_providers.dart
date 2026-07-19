import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../repositories/medication_repository.dart';
import '../repositories/medication_repository_impl.dart';

final medicationRepositoryProvider = Provider<MedicationRepository>((ref) {
  return MedicationRepositoryImpl(isar: ref.read(isarProvider));
});
