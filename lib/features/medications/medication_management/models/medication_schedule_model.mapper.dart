// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_schedule_model.dart';

class MedicationScheduleModelMapper
    extends ClassMapperBase<MedicationScheduleModel> {
  MedicationScheduleModelMapper._();

  static MedicationScheduleModelMapper? _instance;
  static MedicationScheduleModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = MedicationScheduleModelMapper._(),
      );
      RepeatTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MedicationScheduleModel';

  static String _$uuid(MedicationScheduleModel v) => v.uuid;
  static const Field<MedicationScheduleModel, String> _f$uuid = Field(
    'uuid',
    _$uuid,
  );
  static String _$medicationUuid(MedicationScheduleModel v) => v.medicationUuid;
  static const Field<MedicationScheduleModel, String> _f$medicationUuid = Field(
    'medicationUuid',
    _$medicationUuid,
  );
  static int _$minutesFromMidnight(MedicationScheduleModel v) =>
      v.minutesFromMidnight;
  static const Field<MedicationScheduleModel, int> _f$minutesFromMidnight =
      Field('minutesFromMidnight', _$minutesFromMidnight);
  static RepeatType _$repeatType(MedicationScheduleModel v) => v.repeatType;
  static const Field<MedicationScheduleModel, RepeatType> _f$repeatType = Field(
    'repeatType',
    _$repeatType,
  );
  static List<int> _$weekdays(MedicationScheduleModel v) => v.weekdays;
  static const Field<MedicationScheduleModel, List<int>> _f$weekdays = Field(
    'weekdays',
    _$weekdays,
  );
  static int _$interval(MedicationScheduleModel v) => v.interval;
  static const Field<MedicationScheduleModel, int> _f$interval = Field(
    'interval',
    _$interval,
  );
  static DateTime _$startDate(MedicationScheduleModel v) => v.startDate;
  static const Field<MedicationScheduleModel, DateTime> _f$startDate = Field(
    'startDate',
    _$startDate,
  );
  static DateTime? _$endDate(MedicationScheduleModel v) => v.endDate;
  static const Field<MedicationScheduleModel, DateTime> _f$endDate = Field(
    'endDate',
    _$endDate,
    opt: true,
  );
  static DateTime _$createdAt(MedicationScheduleModel v) => v.createdAt;
  static const Field<MedicationScheduleModel, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static DateTime _$updatedAt(MedicationScheduleModel v) => v.updatedAt;
  static const Field<MedicationScheduleModel, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
  );

  @override
  final MappableFields<MedicationScheduleModel> fields = const {
    #uuid: _f$uuid,
    #medicationUuid: _f$medicationUuid,
    #minutesFromMidnight: _f$minutesFromMidnight,
    #repeatType: _f$repeatType,
    #weekdays: _f$weekdays,
    #interval: _f$interval,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static MedicationScheduleModel _instantiate(DecodingData data) {
    return MedicationScheduleModel(
      uuid: data.dec(_f$uuid),
      medicationUuid: data.dec(_f$medicationUuid),
      minutesFromMidnight: data.dec(_f$minutesFromMidnight),
      repeatType: data.dec(_f$repeatType),
      weekdays: data.dec(_f$weekdays),
      interval: data.dec(_f$interval),
      startDate: data.dec(_f$startDate),
      endDate: data.dec(_f$endDate),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MedicationScheduleModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MedicationScheduleModel>(map);
  }

  static MedicationScheduleModel fromJson(String json) {
    return ensureInitialized().decodeJson<MedicationScheduleModel>(json);
  }
}

mixin MedicationScheduleModelMappable {
  String toJson() {
    return MedicationScheduleModelMapper.ensureInitialized()
        .encodeJson<MedicationScheduleModel>(this as MedicationScheduleModel);
  }

  Map<String, dynamic> toMap() {
    return MedicationScheduleModelMapper.ensureInitialized()
        .encodeMap<MedicationScheduleModel>(this as MedicationScheduleModel);
  }

  MedicationScheduleModelCopyWith<
    MedicationScheduleModel,
    MedicationScheduleModel,
    MedicationScheduleModel
  >
  get copyWith =>
      _MedicationScheduleModelCopyWithImpl<
        MedicationScheduleModel,
        MedicationScheduleModel
      >(this as MedicationScheduleModel, $identity, $identity);
  @override
  String toString() {
    return MedicationScheduleModelMapper.ensureInitialized().stringifyValue(
      this as MedicationScheduleModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return MedicationScheduleModelMapper.ensureInitialized().equalsValue(
      this as MedicationScheduleModel,
      other,
    );
  }

  @override
  int get hashCode {
    return MedicationScheduleModelMapper.ensureInitialized().hashValue(
      this as MedicationScheduleModel,
    );
  }
}

extension MedicationScheduleModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MedicationScheduleModel, $Out> {
  MedicationScheduleModelCopyWith<$R, MedicationScheduleModel, $Out>
  get $asMedicationScheduleModel => $base.as(
    (v, t, t2) => _MedicationScheduleModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class MedicationScheduleModelCopyWith<
  $R,
  $In extends MedicationScheduleModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get weekdays;
  $R call({
    String? uuid,
    String? medicationUuid,
    int? minutesFromMidnight,
    RepeatType? repeatType,
    List<int>? weekdays,
    int? interval,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  MedicationScheduleModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MedicationScheduleModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MedicationScheduleModel, $Out>
    implements
        MedicationScheduleModelCopyWith<$R, MedicationScheduleModel, $Out> {
  _MedicationScheduleModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MedicationScheduleModel> $mapper =
      MedicationScheduleModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get weekdays =>
      ListCopyWith(
        $value.weekdays,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(weekdays: v),
      );
  @override
  $R call({
    String? uuid,
    String? medicationUuid,
    int? minutesFromMidnight,
    RepeatType? repeatType,
    List<int>? weekdays,
    int? interval,
    DateTime? startDate,
    Object? endDate = $none,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => $apply(
    FieldCopyWithData({
      if (uuid != null) #uuid: uuid,
      if (medicationUuid != null) #medicationUuid: medicationUuid,
      if (minutesFromMidnight != null)
        #minutesFromMidnight: minutesFromMidnight,
      if (repeatType != null) #repeatType: repeatType,
      if (weekdays != null) #weekdays: weekdays,
      if (interval != null) #interval: interval,
      if (startDate != null) #startDate: startDate,
      if (endDate != $none) #endDate: endDate,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
    }),
  );
  @override
  MedicationScheduleModel $make(CopyWithData data) => MedicationScheduleModel(
    uuid: data.get(#uuid, or: $value.uuid),
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
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  MedicationScheduleModelCopyWith<$R2, MedicationScheduleModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MedicationScheduleModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

