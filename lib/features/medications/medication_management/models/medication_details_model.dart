import 'package:dart_mappable/dart_mappable.dart';
import 'medication_field.dart';

part 'medication_details_model.mapper.dart';

@MappableClass()
class MedicationDetailsModel with MedicationDetailsModelMappable {
  final MedicationField medication;
  // This will later contain the history or schedule of doses. 
  // Defined as generic lists or simple states for now.
  final List<dynamic> upcomingDoses; 

  const MedicationDetailsModel({
    required this.medication,
    this.upcomingDoses = const [],
  });
}
