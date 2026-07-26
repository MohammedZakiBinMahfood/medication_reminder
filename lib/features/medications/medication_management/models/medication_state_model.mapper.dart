// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_state_model.dart';

class MedicationStateModelMapper extends ClassMapperBase<MedicationStateModel> {
  MedicationStateModelMapper._();

  static MedicationStateModelMapper? _instance;
  static MedicationStateModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MedicationStateModelMapper._());
      MedicationPriorityMapper.ensureInitialized();
      RepeatTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MedicationStateModel';

  static String? _$id(MedicationStateModel v) => v.id;
  static const Field<MedicationStateModel, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$name(MedicationStateModel v) => v.name;
  static const Field<MedicationStateModel, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$dosage(MedicationStateModel v) => v.dosage;
  static const Field<MedicationStateModel, String> _f$dosage = Field(
    'dosage',
    _$dosage,
    opt: true,
  );
  static String? _$color(MedicationStateModel v) => v.color;
  static const Field<MedicationStateModel, String> _f$color = Field(
    'color',
    _$color,
    opt: true,
  );
  static MedicationPriority _$priority(MedicationStateModel v) => v.priority;
  static const Field<MedicationStateModel, MedicationPriority> _f$priority =
      Field('priority', _$priority, opt: true, def: MedicationPriority.low);
  static RepeatType _$repeatType(MedicationStateModel v) => v.repeatType;
  static const Field<MedicationStateModel, RepeatType> _f$repeatType = Field(
    'repeatType',
    _$repeatType,
    opt: true,
    def: RepeatType.daily,
  );
  static List<int> _$weekdays(MedicationStateModel v) => v.weekdays;
  static const Field<MedicationStateModel, List<int>> _f$weekdays = Field(
    'weekdays',
    _$weekdays,
    opt: true,
    def: const [],
  );
  static int _$interval(MedicationStateModel v) => v.interval;
  static const Field<MedicationStateModel, int> _f$interval = Field(
    'interval',
    _$interval,
    opt: true,
    def: 1,
  );
  static DateTime? _$startDate(MedicationStateModel v) => v.startDate;
  static const Field<MedicationStateModel, DateTime> _f$startDate = Field(
    'startDate',
    _$startDate,
    opt: true,
  );
  static DateTime? _$endDate(MedicationStateModel v) => v.endDate;
  static const Field<MedicationStateModel, DateTime> _f$endDate = Field(
    'endDate',
    _$endDate,
    opt: true,
  );
  static int _$minutesFromMidnight(MedicationStateModel v) =>
      v.minutesFromMidnight;
  static const Field<MedicationStateModel, int> _f$minutesFromMidnight = Field(
    'minutesFromMidnight',
    _$minutesFromMidnight,
    opt: true,
    def: 480,
  );
  static bool _$isActive(MedicationStateModel v) => v.isActive;
  static const Field<MedicationStateModel, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
    opt: true,
    def: true,
  );
  static int? _$stockQuantity(MedicationStateModel v) => v.stockQuantity;
  static const Field<MedicationStateModel, int> _f$stockQuantity = Field(
    'stockQuantity',
    _$stockQuantity,
    opt: true,
  );
  static int? _$reorderThreshold(MedicationStateModel v) => v.reorderThreshold;
  static const Field<MedicationStateModel, int> _f$reorderThreshold = Field(
    'reorderThreshold',
    _$reorderThreshold,
    opt: true,
  );

  @override
  final MappableFields<MedicationStateModel> fields = const {
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
    #minutesFromMidnight: _f$minutesFromMidnight,
    #isActive: _f$isActive,
    #stockQuantity: _f$stockQuantity,
    #reorderThreshold: _f$reorderThreshold,
  };

  static MedicationStateModel _instantiate(DecodingData data) {
    return MedicationStateModel(
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
      minutesFromMidnight: data.dec(_f$minutesFromMidnight),
      isActive: data.dec(_f$isActive),
      stockQuantity: data.dec(_f$stockQuantity),
      reorderThreshold: data.dec(_f$reorderThreshold),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MedicationStateModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MedicationStateModel>(map);
  }

  static MedicationStateModel fromJson(String json) {
    return ensureInitialized().decodeJson<MedicationStateModel>(json);
  }
}

mixin MedicationStateModelMappable {
  String toJson() {
    return MedicationStateModelMapper.ensureInitialized()
        .encodeJson<MedicationStateModel>(this as MedicationStateModel);
  }

  Map<String, dynamic> toMap() {
    return MedicationStateModelMapper.ensureInitialized()
        .encodeMap<MedicationStateModel>(this as MedicationStateModel);
  }

  MedicationStateModelCopyWith<
    MedicationStateModel,
    MedicationStateModel,
    MedicationStateModel
  >
  get copyWith =>
      _MedicationStateModelCopyWithImpl<
        MedicationStateModel,
        MedicationStateModel
      >(this as MedicationStateModel, $identity, $identity);
  @override
  String toString() {
    return MedicationStateModelMapper.ensureInitialized().stringifyValue(
      this as MedicationStateModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return MedicationStateModelMapper.ensureInitialized().equalsValue(
      this as MedicationStateModel,
      other,
    );
  }

  @override
  int get hashCode {
    return MedicationStateModelMapper.ensureInitialized().hashValue(
      this as MedicationStateModel,
    );
  }
}

extension MedicationStateModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MedicationStateModel, $Out> {
  MedicationStateModelCopyWith<$R, MedicationStateModel, $Out>
  get $asMedicationStateModel => $base.as(
    (v, t, t2) => _MedicationStateModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class MedicationStateModelCopyWith<
  $R,
  $In extends MedicationStateModel,
  $Out
>
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
    int? minutesFromMidnight,
    bool? isActive,
    int? stockQuantity,
    int? reorderThreshold,
  });
  MedicationStateModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MedicationStateModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MedicationStateModel, $Out>
    implements MedicationStateModelCopyWith<$R, MedicationStateModel, $Out> {
  _MedicationStateModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MedicationStateModel> $mapper =
      MedicationStateModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get weekdays =>
      ListCopyWith(
        $value.weekdays,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(weekdays: v),
      );
  @override
  $R call({
    Object? id = $none,
    Object? name = $none,
    Object? dosage = $none,
    Object? color = $none,
    MedicationPriority? priority,
    RepeatType? repeatType,
    List<int>? weekdays,
    int? interval,
    Object? startDate = $none,
    Object? endDate = $none,
    int? minutesFromMidnight,
    bool? isActive,
    Object? stockQuantity = $none,
    Object? reorderThreshold = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != $none) #name: name,
      if (dosage != $none) #dosage: dosage,
      if (color != $none) #color: color,
      if (priority != null) #priority: priority,
      if (repeatType != null) #repeatType: repeatType,
      if (weekdays != null) #weekdays: weekdays,
      if (interval != null) #interval: interval,
      if (startDate != $none) #startDate: startDate,
      if (endDate != $none) #endDate: endDate,
      if (minutesFromMidnight != null)
        #minutesFromMidnight: minutesFromMidnight,
      if (isActive != null) #isActive: isActive,
      if (stockQuantity != $none) #stockQuantity: stockQuantity,
      if (reorderThreshold != $none) #reorderThreshold: reorderThreshold,
    }),
  );
  @override
  MedicationStateModel $make(CopyWithData data) => MedicationStateModel(
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
    minutesFromMidnight: data.get(
      #minutesFromMidnight,
      or: $value.minutesFromMidnight,
    ),
    isActive: data.get(#isActive, or: $value.isActive),
    stockQuantity: data.get(#stockQuantity, or: $value.stockQuantity),
    reorderThreshold: data.get(#reorderThreshold, or: $value.reorderThreshold),
  );

  @override
  MedicationStateModelCopyWith<$R2, MedicationStateModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MedicationStateModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

