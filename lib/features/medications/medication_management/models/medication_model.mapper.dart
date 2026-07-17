// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_model.dart';

class MedicationModelMapper extends ClassMapperBase<MedicationModel> {
  MedicationModelMapper._();

  static MedicationModelMapper? _instance;
  static MedicationModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MedicationModelMapper._());
      MedicationPriorityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MedicationModel';

  static String _$uuid(MedicationModel v) => v.uuid;
  static const Field<MedicationModel, String> _f$uuid = Field('uuid', _$uuid);
  static String _$name(MedicationModel v) => v.name;
  static const Field<MedicationModel, String> _f$name = Field('name', _$name);
  static String _$dosage(MedicationModel v) => v.dosage;
  static const Field<MedicationModel, String> _f$dosage = Field(
    'dosage',
    _$dosage,
  );
  static String _$color(MedicationModel v) => v.color;
  static const Field<MedicationModel, String> _f$color = Field(
    'color',
    _$color,
  );
  static MedicationPriority _$priority(MedicationModel v) => v.priority;
  static const Field<MedicationModel, MedicationPriority> _f$priority = Field(
    'priority',
    _$priority,
  );
  static bool _$isActive(MedicationModel v) => v.isActive;
  static const Field<MedicationModel, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
  );
  static DateTime _$createdAt(MedicationModel v) => v.createdAt;
  static const Field<MedicationModel, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static DateTime _$updatedAt(MedicationModel v) => v.updatedAt;
  static const Field<MedicationModel, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
  );

  @override
  final MappableFields<MedicationModel> fields = const {
    #uuid: _f$uuid,
    #name: _f$name,
    #dosage: _f$dosage,
    #color: _f$color,
    #priority: _f$priority,
    #isActive: _f$isActive,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static MedicationModel _instantiate(DecodingData data) {
    return MedicationModel(
      uuid: data.dec(_f$uuid),
      name: data.dec(_f$name),
      dosage: data.dec(_f$dosage),
      color: data.dec(_f$color),
      priority: data.dec(_f$priority),
      isActive: data.dec(_f$isActive),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MedicationModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MedicationModel>(map);
  }

  static MedicationModel fromJson(String json) {
    return ensureInitialized().decodeJson<MedicationModel>(json);
  }
}

mixin MedicationModelMappable {
  String toJson() {
    return MedicationModelMapper.ensureInitialized()
        .encodeJson<MedicationModel>(this as MedicationModel);
  }

  Map<String, dynamic> toMap() {
    return MedicationModelMapper.ensureInitialized().encodeMap<MedicationModel>(
      this as MedicationModel,
    );
  }

  MedicationModelCopyWith<MedicationModel, MedicationModel, MedicationModel>
  get copyWith =>
      _MedicationModelCopyWithImpl<MedicationModel, MedicationModel>(
        this as MedicationModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MedicationModelMapper.ensureInitialized().stringifyValue(
      this as MedicationModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return MedicationModelMapper.ensureInitialized().equalsValue(
      this as MedicationModel,
      other,
    );
  }

  @override
  int get hashCode {
    return MedicationModelMapper.ensureInitialized().hashValue(
      this as MedicationModel,
    );
  }
}

extension MedicationModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MedicationModel, $Out> {
  MedicationModelCopyWith<$R, MedicationModel, $Out> get $asMedicationModel =>
      $base.as((v, t, t2) => _MedicationModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MedicationModelCopyWith<$R, $In extends MedicationModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? uuid,
    String? name,
    String? dosage,
    String? color,
    MedicationPriority? priority,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  MedicationModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MedicationModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MedicationModel, $Out>
    implements MedicationModelCopyWith<$R, MedicationModel, $Out> {
  _MedicationModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MedicationModel> $mapper =
      MedicationModelMapper.ensureInitialized();
  @override
  $R call({
    String? uuid,
    String? name,
    String? dosage,
    String? color,
    MedicationPriority? priority,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => $apply(
    FieldCopyWithData({
      if (uuid != null) #uuid: uuid,
      if (name != null) #name: name,
      if (dosage != null) #dosage: dosage,
      if (color != null) #color: color,
      if (priority != null) #priority: priority,
      if (isActive != null) #isActive: isActive,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
    }),
  );
  @override
  MedicationModel $make(CopyWithData data) => MedicationModel(
    uuid: data.get(#uuid, or: $value.uuid),
    name: data.get(#name, or: $value.name),
    dosage: data.get(#dosage, or: $value.dosage),
    color: data.get(#color, or: $value.color),
    priority: data.get(#priority, or: $value.priority),
    isActive: data.get(#isActive, or: $value.isActive),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  MedicationModelCopyWith<$R2, MedicationModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MedicationModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

