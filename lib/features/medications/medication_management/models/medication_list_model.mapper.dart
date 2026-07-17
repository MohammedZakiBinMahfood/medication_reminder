// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_list_model.dart';

class MedicationListModelMapper extends ClassMapperBase<MedicationListModel> {
  MedicationListModelMapper._();

  static MedicationListModelMapper? _instance;
  static MedicationListModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MedicationListModelMapper._());
      MedicationPriorityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MedicationListModel';

  static String _$id(MedicationListModel v) => v.id;
  static const Field<MedicationListModel, String> _f$id = Field('id', _$id);
  static String _$name(MedicationListModel v) => v.name;
  static const Field<MedicationListModel, String> _f$name = Field(
    'name',
    _$name,
  );
  static String _$dosage(MedicationListModel v) => v.dosage;
  static const Field<MedicationListModel, String> _f$dosage = Field(
    'dosage',
    _$dosage,
  );
  static String _$color(MedicationListModel v) => v.color;
  static const Field<MedicationListModel, String> _f$color = Field(
    'color',
    _$color,
  );
  static MedicationPriority _$priority(MedicationListModel v) => v.priority;
  static const Field<MedicationListModel, MedicationPriority> _f$priority =
      Field('priority', _$priority);
  static bool _$isActive(MedicationListModel v) => v.isActive;
  static const Field<MedicationListModel, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
  );
  static DateTime? _$nextDoseTime(MedicationListModel v) => v.nextDoseTime;
  static const Field<MedicationListModel, DateTime> _f$nextDoseTime = Field(
    'nextDoseTime',
    _$nextDoseTime,
    opt: true,
  );

  @override
  final MappableFields<MedicationListModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #dosage: _f$dosage,
    #color: _f$color,
    #priority: _f$priority,
    #isActive: _f$isActive,
    #nextDoseTime: _f$nextDoseTime,
  };

  static MedicationListModel _instantiate(DecodingData data) {
    return MedicationListModel(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      dosage: data.dec(_f$dosage),
      color: data.dec(_f$color),
      priority: data.dec(_f$priority),
      isActive: data.dec(_f$isActive),
      nextDoseTime: data.dec(_f$nextDoseTime),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MedicationListModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MedicationListModel>(map);
  }

  static MedicationListModel fromJson(String json) {
    return ensureInitialized().decodeJson<MedicationListModel>(json);
  }
}

mixin MedicationListModelMappable {
  String toJson() {
    return MedicationListModelMapper.ensureInitialized()
        .encodeJson<MedicationListModel>(this as MedicationListModel);
  }

  Map<String, dynamic> toMap() {
    return MedicationListModelMapper.ensureInitialized()
        .encodeMap<MedicationListModel>(this as MedicationListModel);
  }

  MedicationListModelCopyWith<
    MedicationListModel,
    MedicationListModel,
    MedicationListModel
  >
  get copyWith =>
      _MedicationListModelCopyWithImpl<
        MedicationListModel,
        MedicationListModel
      >(this as MedicationListModel, $identity, $identity);
  @override
  String toString() {
    return MedicationListModelMapper.ensureInitialized().stringifyValue(
      this as MedicationListModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return MedicationListModelMapper.ensureInitialized().equalsValue(
      this as MedicationListModel,
      other,
    );
  }

  @override
  int get hashCode {
    return MedicationListModelMapper.ensureInitialized().hashValue(
      this as MedicationListModel,
    );
  }
}

extension MedicationListModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MedicationListModel, $Out> {
  MedicationListModelCopyWith<$R, MedicationListModel, $Out>
  get $asMedicationListModel => $base.as(
    (v, t, t2) => _MedicationListModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class MedicationListModelCopyWith<
  $R,
  $In extends MedicationListModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? name,
    String? dosage,
    String? color,
    MedicationPriority? priority,
    bool? isActive,
    DateTime? nextDoseTime,
  });
  MedicationListModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MedicationListModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MedicationListModel, $Out>
    implements MedicationListModelCopyWith<$R, MedicationListModel, $Out> {
  _MedicationListModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MedicationListModel> $mapper =
      MedicationListModelMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? name,
    String? dosage,
    String? color,
    MedicationPriority? priority,
    bool? isActive,
    Object? nextDoseTime = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (dosage != null) #dosage: dosage,
      if (color != null) #color: color,
      if (priority != null) #priority: priority,
      if (isActive != null) #isActive: isActive,
      if (nextDoseTime != $none) #nextDoseTime: nextDoseTime,
    }),
  );
  @override
  MedicationListModel $make(CopyWithData data) => MedicationListModel(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    dosage: data.get(#dosage, or: $value.dosage),
    color: data.get(#color, or: $value.color),
    priority: data.get(#priority, or: $value.priority),
    isActive: data.get(#isActive, or: $value.isActive),
    nextDoseTime: data.get(#nextDoseTime, or: $value.nextDoseTime),
  );

  @override
  MedicationListModelCopyWith<$R2, MedicationListModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MedicationListModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

