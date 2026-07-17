// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'dose_log_model.dart';

class DoseLogModelMapper extends ClassMapperBase<DoseLogModel> {
  DoseLogModelMapper._();

  static DoseLogModelMapper? _instance;
  static DoseLogModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DoseLogModelMapper._());
      DoseStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DoseLogModel';

  static String _$uuid(DoseLogModel v) => v.uuid;
  static const Field<DoseLogModel, String> _f$uuid = Field('uuid', _$uuid);
  static String _$medicationUuid(DoseLogModel v) => v.medicationUuid;
  static const Field<DoseLogModel, String> _f$medicationUuid = Field(
    'medicationUuid',
    _$medicationUuid,
  );
  static String _$scheduleUuid(DoseLogModel v) => v.scheduleUuid;
  static const Field<DoseLogModel, String> _f$scheduleUuid = Field(
    'scheduleUuid',
    _$scheduleUuid,
  );
  static DateTime _$scheduledAt(DoseLogModel v) => v.scheduledAt;
  static const Field<DoseLogModel, DateTime> _f$scheduledAt = Field(
    'scheduledAt',
    _$scheduledAt,
  );
  static DateTime? _$actionAt(DoseLogModel v) => v.actionAt;
  static const Field<DoseLogModel, DateTime> _f$actionAt = Field(
    'actionAt',
    _$actionAt,
    opt: true,
  );
  static DoseStatus _$status(DoseLogModel v) => v.status;
  static const Field<DoseLogModel, DoseStatus> _f$status = Field(
    'status',
    _$status,
  );
  static DateTime _$createdAt(DoseLogModel v) => v.createdAt;
  static const Field<DoseLogModel, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static DateTime _$updatedAt(DoseLogModel v) => v.updatedAt;
  static const Field<DoseLogModel, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
  );

  @override
  final MappableFields<DoseLogModel> fields = const {
    #uuid: _f$uuid,
    #medicationUuid: _f$medicationUuid,
    #scheduleUuid: _f$scheduleUuid,
    #scheduledAt: _f$scheduledAt,
    #actionAt: _f$actionAt,
    #status: _f$status,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static DoseLogModel _instantiate(DecodingData data) {
    return DoseLogModel(
      uuid: data.dec(_f$uuid),
      medicationUuid: data.dec(_f$medicationUuid),
      scheduleUuid: data.dec(_f$scheduleUuid),
      scheduledAt: data.dec(_f$scheduledAt),
      actionAt: data.dec(_f$actionAt),
      status: data.dec(_f$status),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DoseLogModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DoseLogModel>(map);
  }

  static DoseLogModel fromJson(String json) {
    return ensureInitialized().decodeJson<DoseLogModel>(json);
  }
}

mixin DoseLogModelMappable {
  String toJson() {
    return DoseLogModelMapper.ensureInitialized().encodeJson<DoseLogModel>(
      this as DoseLogModel,
    );
  }

  Map<String, dynamic> toMap() {
    return DoseLogModelMapper.ensureInitialized().encodeMap<DoseLogModel>(
      this as DoseLogModel,
    );
  }

  DoseLogModelCopyWith<DoseLogModel, DoseLogModel, DoseLogModel> get copyWith =>
      _DoseLogModelCopyWithImpl<DoseLogModel, DoseLogModel>(
        this as DoseLogModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DoseLogModelMapper.ensureInitialized().stringifyValue(
      this as DoseLogModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return DoseLogModelMapper.ensureInitialized().equalsValue(
      this as DoseLogModel,
      other,
    );
  }

  @override
  int get hashCode {
    return DoseLogModelMapper.ensureInitialized().hashValue(
      this as DoseLogModel,
    );
  }
}

extension DoseLogModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DoseLogModel, $Out> {
  DoseLogModelCopyWith<$R, DoseLogModel, $Out> get $asDoseLogModel =>
      $base.as((v, t, t2) => _DoseLogModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DoseLogModelCopyWith<$R, $In extends DoseLogModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? uuid,
    String? medicationUuid,
    String? scheduleUuid,
    DateTime? scheduledAt,
    DateTime? actionAt,
    DoseStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  DoseLogModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DoseLogModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DoseLogModel, $Out>
    implements DoseLogModelCopyWith<$R, DoseLogModel, $Out> {
  _DoseLogModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DoseLogModel> $mapper =
      DoseLogModelMapper.ensureInitialized();
  @override
  $R call({
    String? uuid,
    String? medicationUuid,
    String? scheduleUuid,
    DateTime? scheduledAt,
    Object? actionAt = $none,
    DoseStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => $apply(
    FieldCopyWithData({
      if (uuid != null) #uuid: uuid,
      if (medicationUuid != null) #medicationUuid: medicationUuid,
      if (scheduleUuid != null) #scheduleUuid: scheduleUuid,
      if (scheduledAt != null) #scheduledAt: scheduledAt,
      if (actionAt != $none) #actionAt: actionAt,
      if (status != null) #status: status,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
    }),
  );
  @override
  DoseLogModel $make(CopyWithData data) => DoseLogModel(
    uuid: data.get(#uuid, or: $value.uuid),
    medicationUuid: data.get(#medicationUuid, or: $value.medicationUuid),
    scheduleUuid: data.get(#scheduleUuid, or: $value.scheduleUuid),
    scheduledAt: data.get(#scheduledAt, or: $value.scheduledAt),
    actionAt: data.get(#actionAt, or: $value.actionAt),
    status: data.get(#status, or: $value.status),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  DoseLogModelCopyWith<$R2, DoseLogModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DoseLogModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

