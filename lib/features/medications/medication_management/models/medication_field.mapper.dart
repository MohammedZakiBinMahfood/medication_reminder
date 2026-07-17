// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_field.dart';

class MedicationFieldMapper extends ClassMapperBase<MedicationField> {
  MedicationFieldMapper._();

  static MedicationFieldMapper? _instance;
  static MedicationFieldMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MedicationFieldMapper._());
      MedicationPriorityMapper.ensureInitialized();
      RepeatTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MedicationField';

  static String _$id(MedicationField v) => v.id;
  static const Field<MedicationField, String> _f$id = Field('id', _$id);
  static String _$name(MedicationField v) => v.name;
  static const Field<MedicationField, String> _f$name = Field('name', _$name);
  static String _$dosage(MedicationField v) => v.dosage;
  static const Field<MedicationField, String> _f$dosage = Field(
    'dosage',
    _$dosage,
  );
  static String _$color(MedicationField v) => v.color;
  static const Field<MedicationField, String> _f$color = Field(
    'color',
    _$color,
  );
  static MedicationPriority _$priority(MedicationField v) => v.priority;
  static const Field<MedicationField, MedicationPriority> _f$priority = Field(
    'priority',
    _$priority,
  );
  static RepeatType _$repeatType(MedicationField v) => v.repeatType;
  static const Field<MedicationField, RepeatType> _f$repeatType = Field(
    'repeatType',
    _$repeatType,
  );
  static List<int> _$weekdays(MedicationField v) => v.weekdays;
  static const Field<MedicationField, List<int>> _f$weekdays = Field(
    'weekdays',
    _$weekdays,
  );
  static int _$interval(MedicationField v) => v.interval;
  static const Field<MedicationField, int> _f$interval = Field(
    'interval',
    _$interval,
  );
  static DateTime _$startDate(MedicationField v) => v.startDate;
  static const Field<MedicationField, DateTime> _f$startDate = Field(
    'startDate',
    _$startDate,
  );
  static DateTime? _$endDate(MedicationField v) => v.endDate;
  static const Field<MedicationField, DateTime> _f$endDate = Field(
    'endDate',
    _$endDate,
    opt: true,
  );
  static bool _$isActive(MedicationField v) => v.isActive;
  static const Field<MedicationField, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
  );

  @override
  final MappableFields<MedicationField> fields = const {
    #id: _f$id,
    #name: _f$name,
    #dosage: _f$dosage,
    #color: _f$color,
    #priority: _f$priority,
    #repeatType: _f$repeatType,
    #weekdays: _f$weekdays,
    #interval: _f$interval,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #isActive: _f$isActive,
  };

  static MedicationField _instantiate(DecodingData data) {
    return MedicationField(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      dosage: data.dec(_f$dosage),
      color: data.dec(_f$color),
      priority: data.dec(_f$priority),
      repeatType: data.dec(_f$repeatType),
      weekdays: data.dec(_f$weekdays),
      interval: data.dec(_f$interval),
      startDate: data.dec(_f$startDate),
      endDate: data.dec(_f$endDate),
      isActive: data.dec(_f$isActive),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MedicationField fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MedicationField>(map);
  }

  static MedicationField fromJson(String json) {
    return ensureInitialized().decodeJson<MedicationField>(json);
  }
}

mixin MedicationFieldMappable {
  String toJson() {
    return MedicationFieldMapper.ensureInitialized()
        .encodeJson<MedicationField>(this as MedicationField);
  }

  Map<String, dynamic> toMap() {
    return MedicationFieldMapper.ensureInitialized().encodeMap<MedicationField>(
      this as MedicationField,
    );
  }

  MedicationFieldCopyWith<MedicationField, MedicationField, MedicationField>
  get copyWith =>
      _MedicationFieldCopyWithImpl<MedicationField, MedicationField>(
        this as MedicationField,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MedicationFieldMapper.ensureInitialized().stringifyValue(
      this as MedicationField,
    );
  }

  @override
  bool operator ==(Object other) {
    return MedicationFieldMapper.ensureInitialized().equalsValue(
      this as MedicationField,
      other,
    );
  }

  @override
  int get hashCode {
    return MedicationFieldMapper.ensureInitialized().hashValue(
      this as MedicationField,
    );
  }
}

extension MedicationFieldValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MedicationField, $Out> {
  MedicationFieldCopyWith<$R, MedicationField, $Out> get $asMedicationField =>
      $base.as((v, t, t2) => _MedicationFieldCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MedicationFieldCopyWith<$R, $In extends MedicationField, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get weekdays;
  $R call({
    String? id,
    String? name,
    String? dosage,
    String? color,
    MedicationPriority? priority,
    RepeatType? repeatType,
    List<int>? weekdays,
    int? interval,
    DateTime? startDate,
    DateTime? endDate,
    bool? isActive,
  });
  MedicationFieldCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MedicationFieldCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MedicationField, $Out>
    implements MedicationFieldCopyWith<$R, MedicationField, $Out> {
  _MedicationFieldCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MedicationField> $mapper =
      MedicationFieldMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get weekdays =>
      ListCopyWith(
        $value.weekdays,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(weekdays: v),
      );
  @override
  $R call({
    String? id,
    String? name,
    String? dosage,
    String? color,
    MedicationPriority? priority,
    RepeatType? repeatType,
    List<int>? weekdays,
    int? interval,
    DateTime? startDate,
    Object? endDate = $none,
    bool? isActive,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (dosage != null) #dosage: dosage,
      if (color != null) #color: color,
      if (priority != null) #priority: priority,
      if (repeatType != null) #repeatType: repeatType,
      if (weekdays != null) #weekdays: weekdays,
      if (interval != null) #interval: interval,
      if (startDate != null) #startDate: startDate,
      if (endDate != $none) #endDate: endDate,
      if (isActive != null) #isActive: isActive,
    }),
  );
  @override
  MedicationField $make(CopyWithData data) => MedicationField(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    dosage: data.get(#dosage, or: $value.dosage),
    color: data.get(#color, or: $value.color),
    priority: data.get(#priority, or: $value.priority),
    repeatType: data.get(#repeatType, or: $value.repeatType),
    weekdays: data.get(#weekdays, or: $value.weekdays),
    interval: data.get(#interval, or: $value.interval),
    startDate: data.get(#startDate, or: $value.startDate),
    endDate: data.get(#endDate, or: $value.endDate),
    isActive: data.get(#isActive, or: $value.isActive),
  );

  @override
  MedicationFieldCopyWith<$R2, MedicationField, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MedicationFieldCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

