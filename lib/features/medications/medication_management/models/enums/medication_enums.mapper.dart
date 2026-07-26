// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_enums.dart';

class MedicationPriorityMapper extends EnumMapper<MedicationPriority> {
  MedicationPriorityMapper._();

  static MedicationPriorityMapper? _instance;
  static MedicationPriorityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MedicationPriorityMapper._());
    }
    return _instance!;
  }

  static MedicationPriority fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MedicationPriority decode(dynamic value) {
    switch (value) {
      case r'low':
        return MedicationPriority.low;
      case r'medium':
        return MedicationPriority.medium;
      case r'high':
        return MedicationPriority.high;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MedicationPriority self) {
    switch (self) {
      case MedicationPriority.low:
        return r'low';
      case MedicationPriority.medium:
        return r'medium';
      case MedicationPriority.high:
        return r'high';
    }
  }
}

extension MedicationPriorityMapperExtension on MedicationPriority {
  String toValue() {
    MedicationPriorityMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MedicationPriority>(this) as String;
  }
}

class RepeatTypeMapper extends EnumMapper<RepeatType> {
  RepeatTypeMapper._();

  static RepeatTypeMapper? _instance;
  static RepeatTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RepeatTypeMapper._());
    }
    return _instance!;
  }

  static RepeatType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  RepeatType decode(dynamic value) {
    switch (value) {
      case r'daily':
        return RepeatType.daily;
      case r'specificDays':
        return RepeatType.specificDays;
      case r'asNeeded':
        return RepeatType.asNeeded;
      case r'interval':
        return RepeatType.interval;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(RepeatType self) {
    switch (self) {
      case RepeatType.daily:
        return r'daily';
      case RepeatType.specificDays:
        return r'specificDays';
      case RepeatType.asNeeded:
        return r'asNeeded';
      case RepeatType.interval:
        return r'interval';
    }
  }
}

extension RepeatTypeMapperExtension on RepeatType {
  String toValue() {
    RepeatTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<RepeatType>(this) as String;
  }
}

class DoseStatusMapper extends EnumMapper<DoseStatus> {
  DoseStatusMapper._();

  static DoseStatusMapper? _instance;
  static DoseStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DoseStatusMapper._());
    }
    return _instance!;
  }

  static DoseStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  DoseStatus decode(dynamic value) {
    switch (value) {
      case r'pending':
        return DoseStatus.pending;
      case r'taken':
        return DoseStatus.taken;
      case r'skipped':
        return DoseStatus.skipped;
      case r'missed':
        return DoseStatus.missed;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(DoseStatus self) {
    switch (self) {
      case DoseStatus.pending:
        return r'pending';
      case DoseStatus.taken:
        return r'taken';
      case DoseStatus.skipped:
        return r'skipped';
      case DoseStatus.missed:
        return r'missed';
    }
  }
}

extension DoseStatusMapperExtension on DoseStatus {
  String toValue() {
    DoseStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<DoseStatus>(this) as String;
  }
}

class FoodInstructionMapper extends EnumMapper<FoodInstruction> {
  FoodInstructionMapper._();

  static FoodInstructionMapper? _instance;
  static FoodInstructionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FoodInstructionMapper._());
    }
    return _instance!;
  }

  static FoodInstruction fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  FoodInstruction decode(dynamic value) {
    switch (value) {
      case r'none':
        return FoodInstruction.none;
      case r'beforeMeal':
        return FoodInstruction.beforeMeal;
      case r'withMeal':
        return FoodInstruction.withMeal;
      case r'afterMeal':
        return FoodInstruction.afterMeal;
      case r'onEmptyStomach':
        return FoodInstruction.onEmptyStomach;
      case r'beforeBed':
        return FoodInstruction.beforeBed;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(FoodInstruction self) {
    switch (self) {
      case FoodInstruction.none:
        return r'none';
      case FoodInstruction.beforeMeal:
        return r'beforeMeal';
      case FoodInstruction.withMeal:
        return r'withMeal';
      case FoodInstruction.afterMeal:
        return r'afterMeal';
      case FoodInstruction.onEmptyStomach:
        return r'onEmptyStomach';
      case FoodInstruction.beforeBed:
        return r'beforeBed';
    }
  }
}

extension FoodInstructionMapperExtension on FoodInstruction {
  String toValue() {
    FoodInstructionMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FoodInstruction>(this) as String;
  }
}

