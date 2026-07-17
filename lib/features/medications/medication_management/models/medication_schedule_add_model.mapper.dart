// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_schedule_add_model.dart';

class MedicationScheduleAddModelMapper
    extends ClassMapperBase<MedicationScheduleAddModel> {
  MedicationScheduleAddModelMapper._();

  static MedicationScheduleAddModelMapper? _instance;
  static MedicationScheduleAddModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = MedicationScheduleAddModelMapper._(),
      );
      RepeatTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MedicationScheduleAddModel';

  static String _$medicationUuid(MedicationScheduleAddModel v) =>
      v.medicationUuid;
  static const Field<MedicationScheduleAddModel, String> _f$medicationUuid =
      Field('medicationUuid', _$medicationUuid);
  static int _$minutesFromMidnight(MedicationScheduleAddModel v) =>
      v.minutesFromMidnight;
  static const Field<MedicationScheduleAddModel, int> _f$minutesFromMidnight =
      Field('minutesFromMidnight', _$minutesFromMidnight);
  static RepeatType _$repeatType(MedicationScheduleAddModel v) => v.repeatType;
  static const Field<MedicationScheduleAddModel, RepeatType> _f$repeatType =
      Field('repeatType', _$repeatType);
  static List<int> _$weekdays(MedicationScheduleAddModel v) => v.weekdays;
  static const Field<MedicationScheduleAddModel, List<int>> _f$weekdays = Field(
    'weekdays',
    _$weekdays,
  );
  static int _$interval(MedicationScheduleAddModel v) => v.interval;
  static const Field<MedicationScheduleAddModel, int> _f$interval = Field(
    'interval',
    _$interval,
  );
  static DateTime _$startDate(MedicationScheduleAddModel v) => v.startDate;
  static const Field<MedicationScheduleAddModel, DateTime> _f$startDate = Field(
    'startDate',
    _$startDate,
  );
  static DateTime? _$endDate(MedicationScheduleAddModel v) => v.endDate;
  static const Field<MedicationScheduleAddModel, DateTime> _f$endDate = Field(
    'endDate',
    _$endDate,
    opt: true,
  );

  @override
  final MappableFields<MedicationScheduleAddModel> fields = const {
    #medicationUuid: _f$medicationUuid,
    #minutesFromMidnight: _f$minutesFromMidnight,
    #repeatType: _f$repeatType,
    #weekdays: _f$weekdays,
    #interval: _f$interval,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
  };

  static MedicationScheduleAddModel _instantiate(DecodingData data) {
    return MedicationScheduleAddModel(
      medicationUuid: data.dec(_f$medicationUuid),
      minutesFromMidnight: data.dec(_f$minutesFromMidnight),
      repeatType: data.dec(_f$repeatType),
      weekdays: data.dec(_f$weekdays),
      interval: data.dec(_f$interval),
      startDate: data.dec(_f$startDate),
      endDate: data.dec(_f$endDate),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MedicationScheduleAddModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MedicationScheduleAddModel>(map);
  }

  static MedicationScheduleAddModel fromJson(String json) {
    return ensureInitialized().decodeJson<MedicationScheduleAddModel>(json);
  }
}

mixin MedicationScheduleAddModelMappable {
  String toJson() {
    return MedicationScheduleAddModelMapper.ensureInitialized()
        .encodeJson<MedicationScheduleAddModel>(
          this as MedicationScheduleAddModel,
        );
  }

  Map<String, dynamic> toMap() {
    return MedicationScheduleAddModelMapper.ensureInitialized()
        .encodeMap<MedicationScheduleAddModel>(
          this as MedicationScheduleAddModel,
        );
  }

  MedicationScheduleAddModelCopyWith<
    MedicationScheduleAddModel,
    MedicationScheduleAddModel,
    MedicationScheduleAddModel
  >
  get copyWith =>
      _MedicationScheduleAddModelCopyWithImpl<
        MedicationScheduleAddModel,
        MedicationScheduleAddModel
      >(this as MedicationScheduleAddModel, $identity, $identity);
  @override
  String toString() {
    return MedicationScheduleAddModelMapper.ensureInitialized().stringifyValue(
      this as MedicationScheduleAddModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return MedicationScheduleAddModelMapper.ensureInitialized().equalsValue(
      this as MedicationScheduleAddModel,
      other,
    );
  }

  @override
  int get hashCode {
    return MedicationScheduleAddModelMapper.ensureInitialized().hashValue(
      this as MedicationScheduleAddModel,
    );
  }
}

extension MedicationScheduleAddModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MedicationScheduleAddModel, $Out> {
  MedicationScheduleAddModelCopyWith<$R, MedicationScheduleAddModel, $Out>
  get $asMedicationScheduleAddModel => $base.as(
    (v, t, t2) => _MedicationScheduleAddModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class MedicationScheduleAddModelCopyWith<
  $R,
  $In extends MedicationScheduleAddModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get weekdays;
  $R call({
    String? medicationUuid,
    int? minutesFromMidnight,
    RepeatType? repeatType,
    List<int>? weekdays,
    int? interval,
    DateTime? startDate,
    DateTime? endDate,
  });
  MedicationScheduleAddModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MedicationScheduleAddModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MedicationScheduleAddModel, $Out>
    implements
        MedicationScheduleAddModelCopyWith<
          $R,
          MedicationScheduleAddModel,
          $Out
        > {
  _MedicationScheduleAddModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MedicationScheduleAddModel> $mapper =
      MedicationScheduleAddModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get weekdays =>
      ListCopyWith(
        $value.weekdays,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(weekdays: v),
      );
  @override
  $R call({
    String? medicationUuid,
    int? minutesFromMidnight,
    RepeatType? repeatType,
    List<int>? weekdays,
    int? interval,
    DateTime? startDate,
    Object? endDate = $none,
  }) => $apply(
    FieldCopyWithData({
      if (medicationUuid != null) #medicationUuid: medicationUuid,
      if (minutesFromMidnight != null)
        #minutesFromMidnight: minutesFromMidnight,
      if (repeatType != null) #repeatType: repeatType,
      if (weekdays != null) #weekdays: weekdays,
      if (interval != null) #interval: interval,
      if (startDate != null) #startDate: startDate,
      if (endDate != $none) #endDate: endDate,
    }),
  );
  @override
  MedicationScheduleAddModel $make(CopyWithData data) =>
      MedicationScheduleAddModel(
        medicationUuid: data.get(#medicationUuid, or: $value.medicationUuid),
        minutesFromMidnight: data.get(
          #minutesFromMidnight,
          or: $value.minutesFromMidnight,
        ),
        repeatType: data.get(#repeatType, or: $value.repeatType),
        weekdays: data.get(#weekdays, or: $value.weekdays),
        interval: data.get(#interval, or: $value.interval),
        startDate: data.get(#startDate, or: $value.startDate),
        endDate: data.get(#endDate, or: $value.endDate),
      );

  @override
  MedicationScheduleAddModelCopyWith<$R2, MedicationScheduleAddModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MedicationScheduleAddModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

