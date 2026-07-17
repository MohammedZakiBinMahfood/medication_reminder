// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_schedule_list_model.dart';

class MedicationScheduleListModelMapper
    extends ClassMapperBase<MedicationScheduleListModel> {
  MedicationScheduleListModelMapper._();

  static MedicationScheduleListModelMapper? _instance;
  static MedicationScheduleListModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = MedicationScheduleListModelMapper._(),
      );
      RepeatTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MedicationScheduleListModel';

  static String _$id(MedicationScheduleListModel v) => v.id;
  static const Field<MedicationScheduleListModel, String> _f$id = Field(
    'id',
    _$id,
  );
  static String _$medicationUuid(MedicationScheduleListModel v) =>
      v.medicationUuid;
  static const Field<MedicationScheduleListModel, String> _f$medicationUuid =
      Field('medicationUuid', _$medicationUuid);
  static int _$minutesFromMidnight(MedicationScheduleListModel v) =>
      v.minutesFromMidnight;
  static const Field<MedicationScheduleListModel, int> _f$minutesFromMidnight =
      Field('minutesFromMidnight', _$minutesFromMidnight);
  static RepeatType _$repeatType(MedicationScheduleListModel v) => v.repeatType;
  static const Field<MedicationScheduleListModel, RepeatType> _f$repeatType =
      Field('repeatType', _$repeatType);
  static List<int> _$weekdays(MedicationScheduleListModel v) => v.weekdays;
  static const Field<MedicationScheduleListModel, List<int>> _f$weekdays =
      Field('weekdays', _$weekdays);
  static int _$interval(MedicationScheduleListModel v) => v.interval;
  static const Field<MedicationScheduleListModel, int> _f$interval = Field(
    'interval',
    _$interval,
  );
  static DateTime _$startDate(MedicationScheduleListModel v) => v.startDate;
  static const Field<MedicationScheduleListModel, DateTime> _f$startDate =
      Field('startDate', _$startDate);
  static DateTime? _$endDate(MedicationScheduleListModel v) => v.endDate;
  static const Field<MedicationScheduleListModel, DateTime> _f$endDate = Field(
    'endDate',
    _$endDate,
    opt: true,
  );

  @override
  final MappableFields<MedicationScheduleListModel> fields = const {
    #id: _f$id,
    #medicationUuid: _f$medicationUuid,
    #minutesFromMidnight: _f$minutesFromMidnight,
    #repeatType: _f$repeatType,
    #weekdays: _f$weekdays,
    #interval: _f$interval,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
  };

  static MedicationScheduleListModel _instantiate(DecodingData data) {
    return MedicationScheduleListModel(
      id: data.dec(_f$id),
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

  static MedicationScheduleListModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MedicationScheduleListModel>(map);
  }

  static MedicationScheduleListModel fromJson(String json) {
    return ensureInitialized().decodeJson<MedicationScheduleListModel>(json);
  }
}

mixin MedicationScheduleListModelMappable {
  String toJson() {
    return MedicationScheduleListModelMapper.ensureInitialized()
        .encodeJson<MedicationScheduleListModel>(
          this as MedicationScheduleListModel,
        );
  }

  Map<String, dynamic> toMap() {
    return MedicationScheduleListModelMapper.ensureInitialized()
        .encodeMap<MedicationScheduleListModel>(
          this as MedicationScheduleListModel,
        );
  }

  MedicationScheduleListModelCopyWith<
    MedicationScheduleListModel,
    MedicationScheduleListModel,
    MedicationScheduleListModel
  >
  get copyWith =>
      _MedicationScheduleListModelCopyWithImpl<
        MedicationScheduleListModel,
        MedicationScheduleListModel
      >(this as MedicationScheduleListModel, $identity, $identity);
  @override
  String toString() {
    return MedicationScheduleListModelMapper.ensureInitialized().stringifyValue(
      this as MedicationScheduleListModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return MedicationScheduleListModelMapper.ensureInitialized().equalsValue(
      this as MedicationScheduleListModel,
      other,
    );
  }

  @override
  int get hashCode {
    return MedicationScheduleListModelMapper.ensureInitialized().hashValue(
      this as MedicationScheduleListModel,
    );
  }
}

extension MedicationScheduleListModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MedicationScheduleListModel, $Out> {
  MedicationScheduleListModelCopyWith<$R, MedicationScheduleListModel, $Out>
  get $asMedicationScheduleListModel => $base.as(
    (v, t, t2) => _MedicationScheduleListModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class MedicationScheduleListModelCopyWith<
  $R,
  $In extends MedicationScheduleListModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get weekdays;
  $R call({
    String? id,
    String? medicationUuid,
    int? minutesFromMidnight,
    RepeatType? repeatType,
    List<int>? weekdays,
    int? interval,
    DateTime? startDate,
    DateTime? endDate,
  });
  MedicationScheduleListModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MedicationScheduleListModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MedicationScheduleListModel, $Out>
    implements
        MedicationScheduleListModelCopyWith<
          $R,
          MedicationScheduleListModel,
          $Out
        > {
  _MedicationScheduleListModelCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<MedicationScheduleListModel> $mapper =
      MedicationScheduleListModelMapper.ensureInitialized();
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
    String? medicationUuid,
    int? minutesFromMidnight,
    RepeatType? repeatType,
    List<int>? weekdays,
    int? interval,
    DateTime? startDate,
    Object? endDate = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
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
  MedicationScheduleListModel $make(CopyWithData data) =>
      MedicationScheduleListModel(
        id: data.get(#id, or: $value.id),
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
  MedicationScheduleListModelCopyWith<$R2, MedicationScheduleListModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MedicationScheduleListModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

