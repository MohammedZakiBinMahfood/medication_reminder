// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_edit_model.dart';

class MedicationEditModelMapper extends ClassMapperBase<MedicationEditModel> {
  MedicationEditModelMapper._();

  static MedicationEditModelMapper? _instance;
  static MedicationEditModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MedicationEditModelMapper._());
      MedicationPriorityMapper.ensureInitialized();
      RepeatTypeMapper.ensureInitialized();
      FoodInstructionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MedicationEditModel';

  static String _$id(MedicationEditModel v) => v.id;
  static const Field<MedicationEditModel, String> _f$id = Field('id', _$id);
  static String _$profileUuid(MedicationEditModel v) => v.profileUuid;
  static const Field<MedicationEditModel, String> _f$profileUuid = Field(
    'profileUuid',
    _$profileUuid,
  );
  static String _$name(MedicationEditModel v) => v.name;
  static const Field<MedicationEditModel, String> _f$name = Field(
    'name',
    _$name,
  );
  static String _$dosage(MedicationEditModel v) => v.dosage;
  static const Field<MedicationEditModel, String> _f$dosage = Field(
    'dosage',
    _$dosage,
  );
  static String _$color(MedicationEditModel v) => v.color;
  static const Field<MedicationEditModel, String> _f$color = Field(
    'color',
    _$color,
  );
  static MedicationPriority _$priority(MedicationEditModel v) => v.priority;
  static const Field<MedicationEditModel, MedicationPriority> _f$priority =
      Field('priority', _$priority);
  static RepeatType _$repeatType(MedicationEditModel v) => v.repeatType;
  static const Field<MedicationEditModel, RepeatType> _f$repeatType = Field(
    'repeatType',
    _$repeatType,
  );
  static List<int> _$weekdays(MedicationEditModel v) => v.weekdays;
  static const Field<MedicationEditModel, List<int>> _f$weekdays = Field(
    'weekdays',
    _$weekdays,
  );
  static int _$interval(MedicationEditModel v) => v.interval;
  static const Field<MedicationEditModel, int> _f$interval = Field(
    'interval',
    _$interval,
  );
  static DateTime _$startDate(MedicationEditModel v) => v.startDate;
  static const Field<MedicationEditModel, DateTime> _f$startDate = Field(
    'startDate',
    _$startDate,
  );
  static DateTime? _$endDate(MedicationEditModel v) => v.endDate;
  static const Field<MedicationEditModel, DateTime> _f$endDate = Field(
    'endDate',
    _$endDate,
    opt: true,
  );
  static int _$minutesFromMidnight(MedicationEditModel v) =>
      v.minutesFromMidnight;
  static const Field<MedicationEditModel, int> _f$minutesFromMidnight = Field(
    'minutesFromMidnight',
    _$minutesFromMidnight,
    opt: true,
    def: 480,
  );
  static bool _$isActive(MedicationEditModel v) => v.isActive;
  static const Field<MedicationEditModel, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
  );
  static int? _$stockQuantity(MedicationEditModel v) => v.stockQuantity;
  static const Field<MedicationEditModel, int> _f$stockQuantity = Field(
    'stockQuantity',
    _$stockQuantity,
    opt: true,
  );
  static int? _$reorderThreshold(MedicationEditModel v) => v.reorderThreshold;
  static const Field<MedicationEditModel, int> _f$reorderThreshold = Field(
    'reorderThreshold',
    _$reorderThreshold,
    opt: true,
  );
  static FoodInstruction _$foodInstruction(MedicationEditModel v) =>
      v.foodInstruction;
  static const Field<MedicationEditModel, FoodInstruction> _f$foodInstruction =
      Field(
        'foodInstruction',
        _$foodInstruction,
        opt: true,
        def: FoodInstruction.none,
      );
  static String? _$imagePath(MedicationEditModel v) => v.imagePath;
  static const Field<MedicationEditModel, String> _f$imagePath = Field(
    'imagePath',
    _$imagePath,
    opt: true,
  );

  @override
  final MappableFields<MedicationEditModel> fields = const {
    #id: _f$id,
    #profileUuid: _f$profileUuid,
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
    #foodInstruction: _f$foodInstruction,
    #imagePath: _f$imagePath,
  };

  static MedicationEditModel _instantiate(DecodingData data) {
    return MedicationEditModel(
      id: data.dec(_f$id),
      profileUuid: data.dec(_f$profileUuid),
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
      foodInstruction: data.dec(_f$foodInstruction),
      imagePath: data.dec(_f$imagePath),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MedicationEditModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MedicationEditModel>(map);
  }

  static MedicationEditModel fromJson(String json) {
    return ensureInitialized().decodeJson<MedicationEditModel>(json);
  }
}

mixin MedicationEditModelMappable {
  String toJson() {
    return MedicationEditModelMapper.ensureInitialized()
        .encodeJson<MedicationEditModel>(this as MedicationEditModel);
  }

  Map<String, dynamic> toMap() {
    return MedicationEditModelMapper.ensureInitialized()
        .encodeMap<MedicationEditModel>(this as MedicationEditModel);
  }

  MedicationEditModelCopyWith<
    MedicationEditModel,
    MedicationEditModel,
    MedicationEditModel
  >
  get copyWith =>
      _MedicationEditModelCopyWithImpl<
        MedicationEditModel,
        MedicationEditModel
      >(this as MedicationEditModel, $identity, $identity);
  @override
  String toString() {
    return MedicationEditModelMapper.ensureInitialized().stringifyValue(
      this as MedicationEditModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return MedicationEditModelMapper.ensureInitialized().equalsValue(
      this as MedicationEditModel,
      other,
    );
  }

  @override
  int get hashCode {
    return MedicationEditModelMapper.ensureInitialized().hashValue(
      this as MedicationEditModel,
    );
  }
}

extension MedicationEditModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MedicationEditModel, $Out> {
  MedicationEditModelCopyWith<$R, MedicationEditModel, $Out>
  get $asMedicationEditModel => $base.as(
    (v, t, t2) => _MedicationEditModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class MedicationEditModelCopyWith<
  $R,
  $In extends MedicationEditModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get weekdays;
  $R call({
    String? id,
    String? profileUuid,
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
    FoodInstruction? foodInstruction,
    String? imagePath,
  });
  MedicationEditModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MedicationEditModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MedicationEditModel, $Out>
    implements MedicationEditModelCopyWith<$R, MedicationEditModel, $Out> {
  _MedicationEditModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MedicationEditModel> $mapper =
      MedicationEditModelMapper.ensureInitialized();
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
    String? profileUuid,
    String? name,
    String? dosage,
    String? color,
    MedicationPriority? priority,
    RepeatType? repeatType,
    List<int>? weekdays,
    int? interval,
    DateTime? startDate,
    Object? endDate = $none,
    int? minutesFromMidnight,
    bool? isActive,
    Object? stockQuantity = $none,
    Object? reorderThreshold = $none,
    FoodInstruction? foodInstruction,
    Object? imagePath = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (profileUuid != null) #profileUuid: profileUuid,
      if (name != null) #name: name,
      if (dosage != null) #dosage: dosage,
      if (color != null) #color: color,
      if (priority != null) #priority: priority,
      if (repeatType != null) #repeatType: repeatType,
      if (weekdays != null) #weekdays: weekdays,
      if (interval != null) #interval: interval,
      if (startDate != null) #startDate: startDate,
      if (endDate != $none) #endDate: endDate,
      if (minutesFromMidnight != null)
        #minutesFromMidnight: minutesFromMidnight,
      if (isActive != null) #isActive: isActive,
      if (stockQuantity != $none) #stockQuantity: stockQuantity,
      if (reorderThreshold != $none) #reorderThreshold: reorderThreshold,
      if (foodInstruction != null) #foodInstruction: foodInstruction,
      if (imagePath != $none) #imagePath: imagePath,
    }),
  );
  @override
  MedicationEditModel $make(CopyWithData data) => MedicationEditModel(
    id: data.get(#id, or: $value.id),
    profileUuid: data.get(#profileUuid, or: $value.profileUuid),
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
    foodInstruction: data.get(#foodInstruction, or: $value.foodInstruction),
    imagePath: data.get(#imagePath, or: $value.imagePath),
  );

  @override
  MedicationEditModelCopyWith<$R2, MedicationEditModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MedicationEditModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

