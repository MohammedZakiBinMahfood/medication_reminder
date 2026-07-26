// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_add_model.dart';

class MedicationAddModelMapper extends ClassMapperBase<MedicationAddModel> {
  MedicationAddModelMapper._();

  static MedicationAddModelMapper? _instance;
  static MedicationAddModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MedicationAddModelMapper._());
      MedicationPriorityMapper.ensureInitialized();
      RepeatTypeMapper.ensureInitialized();
      FoodInstructionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MedicationAddModel';

  static String _$profileUuid(MedicationAddModel v) => v.profileUuid;
  static const Field<MedicationAddModel, String> _f$profileUuid = Field(
    'profileUuid',
    _$profileUuid,
  );
  static String _$name(MedicationAddModel v) => v.name;
  static const Field<MedicationAddModel, String> _f$name = Field(
    'name',
    _$name,
  );
  static String _$dosage(MedicationAddModel v) => v.dosage;
  static const Field<MedicationAddModel, String> _f$dosage = Field(
    'dosage',
    _$dosage,
  );
  static String _$color(MedicationAddModel v) => v.color;
  static const Field<MedicationAddModel, String> _f$color = Field(
    'color',
    _$color,
  );
  static MedicationPriority _$priority(MedicationAddModel v) => v.priority;
  static const Field<MedicationAddModel, MedicationPriority> _f$priority =
      Field('priority', _$priority);
  static RepeatType _$repeatType(MedicationAddModel v) => v.repeatType;
  static const Field<MedicationAddModel, RepeatType> _f$repeatType = Field(
    'repeatType',
    _$repeatType,
  );
  static List<int> _$weekdays(MedicationAddModel v) => v.weekdays;
  static const Field<MedicationAddModel, List<int>> _f$weekdays = Field(
    'weekdays',
    _$weekdays,
  );
  static int _$interval(MedicationAddModel v) => v.interval;
  static const Field<MedicationAddModel, int> _f$interval = Field(
    'interval',
    _$interval,
  );
  static DateTime _$startDate(MedicationAddModel v) => v.startDate;
  static const Field<MedicationAddModel, DateTime> _f$startDate = Field(
    'startDate',
    _$startDate,
  );
  static DateTime? _$endDate(MedicationAddModel v) => v.endDate;
  static const Field<MedicationAddModel, DateTime> _f$endDate = Field(
    'endDate',
    _$endDate,
    opt: true,
  );
  static int _$minutesFromMidnight(MedicationAddModel v) =>
      v.minutesFromMidnight;
  static const Field<MedicationAddModel, int> _f$minutesFromMidnight = Field(
    'minutesFromMidnight',
    _$minutesFromMidnight,
    opt: true,
    def: 480,
  );
  static bool _$isActive(MedicationAddModel v) => v.isActive;
  static const Field<MedicationAddModel, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
  );
  static int? _$stockQuantity(MedicationAddModel v) => v.stockQuantity;
  static const Field<MedicationAddModel, int> _f$stockQuantity = Field(
    'stockQuantity',
    _$stockQuantity,
    opt: true,
  );
  static int? _$reorderThreshold(MedicationAddModel v) => v.reorderThreshold;
  static const Field<MedicationAddModel, int> _f$reorderThreshold = Field(
    'reorderThreshold',
    _$reorderThreshold,
    opt: true,
  );
  static FoodInstruction _$foodInstruction(MedicationAddModel v) =>
      v.foodInstruction;
  static const Field<MedicationAddModel, FoodInstruction> _f$foodInstruction =
      Field(
        'foodInstruction',
        _$foodInstruction,
        opt: true,
        def: FoodInstruction.none,
      );
  static String? _$imagePath(MedicationAddModel v) => v.imagePath;
  static const Field<MedicationAddModel, String> _f$imagePath = Field(
    'imagePath',
    _$imagePath,
    opt: true,
  );

  @override
  final MappableFields<MedicationAddModel> fields = const {
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

  static MedicationAddModel _instantiate(DecodingData data) {
    return MedicationAddModel(
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

  static MedicationAddModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MedicationAddModel>(map);
  }

  static MedicationAddModel fromJson(String json) {
    return ensureInitialized().decodeJson<MedicationAddModel>(json);
  }
}

mixin MedicationAddModelMappable {
  String toJson() {
    return MedicationAddModelMapper.ensureInitialized()
        .encodeJson<MedicationAddModel>(this as MedicationAddModel);
  }

  Map<String, dynamic> toMap() {
    return MedicationAddModelMapper.ensureInitialized()
        .encodeMap<MedicationAddModel>(this as MedicationAddModel);
  }

  MedicationAddModelCopyWith<
    MedicationAddModel,
    MedicationAddModel,
    MedicationAddModel
  >
  get copyWith =>
      _MedicationAddModelCopyWithImpl<MedicationAddModel, MedicationAddModel>(
        this as MedicationAddModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MedicationAddModelMapper.ensureInitialized().stringifyValue(
      this as MedicationAddModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return MedicationAddModelMapper.ensureInitialized().equalsValue(
      this as MedicationAddModel,
      other,
    );
  }

  @override
  int get hashCode {
    return MedicationAddModelMapper.ensureInitialized().hashValue(
      this as MedicationAddModel,
    );
  }
}

extension MedicationAddModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MedicationAddModel, $Out> {
  MedicationAddModelCopyWith<$R, MedicationAddModel, $Out>
  get $asMedicationAddModel => $base.as(
    (v, t, t2) => _MedicationAddModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class MedicationAddModelCopyWith<
  $R,
  $In extends MedicationAddModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get weekdays;
  $R call({
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
  MedicationAddModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MedicationAddModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MedicationAddModel, $Out>
    implements MedicationAddModelCopyWith<$R, MedicationAddModel, $Out> {
  _MedicationAddModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MedicationAddModel> $mapper =
      MedicationAddModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get weekdays =>
      ListCopyWith(
        $value.weekdays,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(weekdays: v),
      );
  @override
  $R call({
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
  MedicationAddModel $make(CopyWithData data) => MedicationAddModel(
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
  MedicationAddModelCopyWith<$R2, MedicationAddModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MedicationAddModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

