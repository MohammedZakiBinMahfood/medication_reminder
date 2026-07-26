// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'history_item_model.dart';

class HistoryItemModelMapper extends ClassMapperBase<HistoryItemModel> {
  HistoryItemModelMapper._();

  static HistoryItemModelMapper? _instance;
  static HistoryItemModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HistoryItemModelMapper._());
      MedicationPriorityMapper.ensureInitialized();
      DoseStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HistoryItemModel';

  static String _$doseLogUuid(HistoryItemModel v) => v.doseLogUuid;
  static const Field<HistoryItemModel, String> _f$doseLogUuid = Field(
    'doseLogUuid',
    _$doseLogUuid,
  );
  static String _$medicationUuid(HistoryItemModel v) => v.medicationUuid;
  static const Field<HistoryItemModel, String> _f$medicationUuid = Field(
    'medicationUuid',
    _$medicationUuid,
  );
  static String _$scheduleUuid(HistoryItemModel v) => v.scheduleUuid;
  static const Field<HistoryItemModel, String> _f$scheduleUuid = Field(
    'scheduleUuid',
    _$scheduleUuid,
  );
  static String _$medicationName(HistoryItemModel v) => v.medicationName;
  static const Field<HistoryItemModel, String> _f$medicationName = Field(
    'medicationName',
    _$medicationName,
  );
  static String _$dosage(HistoryItemModel v) => v.dosage;
  static const Field<HistoryItemModel, String> _f$dosage = Field(
    'dosage',
    _$dosage,
  );
  static String _$medicationColor(HistoryItemModel v) => v.medicationColor;
  static const Field<HistoryItemModel, String> _f$medicationColor = Field(
    'medicationColor',
    _$medicationColor,
  );
  static MedicationPriority _$priority(HistoryItemModel v) => v.priority;
  static const Field<HistoryItemModel, MedicationPriority> _f$priority = Field(
    'priority',
    _$priority,
  );
  static DoseStatus _$status(HistoryItemModel v) => v.status;
  static const Field<HistoryItemModel, DoseStatus> _f$status = Field(
    'status',
    _$status,
  );
  static DateTime _$scheduledAt(HistoryItemModel v) => v.scheduledAt;
  static const Field<HistoryItemModel, DateTime> _f$scheduledAt = Field(
    'scheduledAt',
    _$scheduledAt,
  );
  static DateTime? _$actionAt(HistoryItemModel v) => v.actionAt;
  static const Field<HistoryItemModel, DateTime> _f$actionAt = Field(
    'actionAt',
    _$actionAt,
    opt: true,
  );
  static DateTime _$createdAt(HistoryItemModel v) => v.createdAt;
  static const Field<HistoryItemModel, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );

  @override
  final MappableFields<HistoryItemModel> fields = const {
    #doseLogUuid: _f$doseLogUuid,
    #medicationUuid: _f$medicationUuid,
    #scheduleUuid: _f$scheduleUuid,
    #medicationName: _f$medicationName,
    #dosage: _f$dosage,
    #medicationColor: _f$medicationColor,
    #priority: _f$priority,
    #status: _f$status,
    #scheduledAt: _f$scheduledAt,
    #actionAt: _f$actionAt,
    #createdAt: _f$createdAt,
  };

  static HistoryItemModel _instantiate(DecodingData data) {
    return HistoryItemModel(
      doseLogUuid: data.dec(_f$doseLogUuid),
      medicationUuid: data.dec(_f$medicationUuid),
      scheduleUuid: data.dec(_f$scheduleUuid),
      medicationName: data.dec(_f$medicationName),
      dosage: data.dec(_f$dosage),
      medicationColor: data.dec(_f$medicationColor),
      priority: data.dec(_f$priority),
      status: data.dec(_f$status),
      scheduledAt: data.dec(_f$scheduledAt),
      actionAt: data.dec(_f$actionAt),
      createdAt: data.dec(_f$createdAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static HistoryItemModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HistoryItemModel>(map);
  }

  static HistoryItemModel fromJson(String json) {
    return ensureInitialized().decodeJson<HistoryItemModel>(json);
  }
}

mixin HistoryItemModelMappable {
  String toJson() {
    return HistoryItemModelMapper.ensureInitialized()
        .encodeJson<HistoryItemModel>(this as HistoryItemModel);
  }

  Map<String, dynamic> toMap() {
    return HistoryItemModelMapper.ensureInitialized()
        .encodeMap<HistoryItemModel>(this as HistoryItemModel);
  }

  HistoryItemModelCopyWith<HistoryItemModel, HistoryItemModel, HistoryItemModel>
  get copyWith =>
      _HistoryItemModelCopyWithImpl<HistoryItemModel, HistoryItemModel>(
        this as HistoryItemModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return HistoryItemModelMapper.ensureInitialized().stringifyValue(
      this as HistoryItemModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return HistoryItemModelMapper.ensureInitialized().equalsValue(
      this as HistoryItemModel,
      other,
    );
  }

  @override
  int get hashCode {
    return HistoryItemModelMapper.ensureInitialized().hashValue(
      this as HistoryItemModel,
    );
  }
}

extension HistoryItemModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HistoryItemModel, $Out> {
  HistoryItemModelCopyWith<$R, HistoryItemModel, $Out>
  get $asHistoryItemModel =>
      $base.as((v, t, t2) => _HistoryItemModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class HistoryItemModelCopyWith<$R, $In extends HistoryItemModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? doseLogUuid,
    String? medicationUuid,
    String? scheduleUuid,
    String? medicationName,
    String? dosage,
    String? medicationColor,
    MedicationPriority? priority,
    DoseStatus? status,
    DateTime? scheduledAt,
    DateTime? actionAt,
    DateTime? createdAt,
  });
  HistoryItemModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _HistoryItemModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HistoryItemModel, $Out>
    implements HistoryItemModelCopyWith<$R, HistoryItemModel, $Out> {
  _HistoryItemModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HistoryItemModel> $mapper =
      HistoryItemModelMapper.ensureInitialized();
  @override
  $R call({
    String? doseLogUuid,
    String? medicationUuid,
    String? scheduleUuid,
    String? medicationName,
    String? dosage,
    String? medicationColor,
    MedicationPriority? priority,
    DoseStatus? status,
    DateTime? scheduledAt,
    Object? actionAt = $none,
    DateTime? createdAt,
  }) => $apply(
    FieldCopyWithData({
      if (doseLogUuid != null) #doseLogUuid: doseLogUuid,
      if (medicationUuid != null) #medicationUuid: medicationUuid,
      if (scheduleUuid != null) #scheduleUuid: scheduleUuid,
      if (medicationName != null) #medicationName: medicationName,
      if (dosage != null) #dosage: dosage,
      if (medicationColor != null) #medicationColor: medicationColor,
      if (priority != null) #priority: priority,
      if (status != null) #status: status,
      if (scheduledAt != null) #scheduledAt: scheduledAt,
      if (actionAt != $none) #actionAt: actionAt,
      if (createdAt != null) #createdAt: createdAt,
    }),
  );
  @override
  HistoryItemModel $make(CopyWithData data) => HistoryItemModel(
    doseLogUuid: data.get(#doseLogUuid, or: $value.doseLogUuid),
    medicationUuid: data.get(#medicationUuid, or: $value.medicationUuid),
    scheduleUuid: data.get(#scheduleUuid, or: $value.scheduleUuid),
    medicationName: data.get(#medicationName, or: $value.medicationName),
    dosage: data.get(#dosage, or: $value.dosage),
    medicationColor: data.get(#medicationColor, or: $value.medicationColor),
    priority: data.get(#priority, or: $value.priority),
    status: data.get(#status, or: $value.status),
    scheduledAt: data.get(#scheduledAt, or: $value.scheduledAt),
    actionAt: data.get(#actionAt, or: $value.actionAt),
    createdAt: data.get(#createdAt, or: $value.createdAt),
  );

  @override
  HistoryItemModelCopyWith<$R2, HistoryItemModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _HistoryItemModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

