import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';

final medicationStateProvider =
    NotifierProvider<MedicationStateNotifier, MedicationStateModel>(
      MedicationStateNotifier.new,
    );

class MedicationStateNotifier extends Notifier<MedicationStateModel> {
  @override
  MedicationStateModel build() => MedicationStateModel.empty();

  void setId(String? v) => state = state.copyWith(id: v);
  void setName(String? v) => state = state.copyWith(name: v);
  void setDosage(String? v) => state = state.copyWith(dosage: v);
  void setColor(String? v) => state = state.copyWith(color: v);
  void setPriority(MedicationPriority v) => state = state.copyWith(priority: v);
  void setRepeatType(RepeatType v) => state = state.copyWith(repeatType: v);
  void setWeekdays(List<int> v) => state = state.copyWith(weekdays: v);
  void setInterval(int v) => state = state.copyWith(interval: v);
  void setStartDate(DateTime? v) => state = state.copyWith(startDate: v);
  void setEndDate(DateTime? v) => state = state.copyWith(endDate: v);
  void setMinutesFromMidnight(int v) =>
      state = state.copyWith(minutesFromMidnight: v);
  void setIsActive(bool v) => state = state.copyWith(isActive: v);

  void reset() => state = MedicationStateModel.empty();

  void loadFromField(MedicationField field) {
    state = MedicationStateModel(
      id: field.id,
      name: field.name,
      dosage: field.dosage,
      color: field.color,
      priority: field.priority,
      repeatType: field.repeatType,
      weekdays: field.weekdays,
      interval: field.interval,
      startDate: field.startDate,
      endDate: field.endDate,
      minutesFromMidnight: field.minutesFromMidnight,
      isActive: field.isActive,
    );
  }
}
