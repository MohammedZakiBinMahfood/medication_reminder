// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'backup_data.dart';

class BackupMetadataMapper extends ClassMapperBase<BackupMetadata> {
  BackupMetadataMapper._();

  static BackupMetadataMapper? _instance;
  static BackupMetadataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BackupMetadataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BackupMetadata';

  static String _$appVersion(BackupMetadata v) => v.appVersion;
  static const Field<BackupMetadata, String> _f$appVersion = Field(
    'appVersion',
    _$appVersion,
  );
  static String _$buildNumber(BackupMetadata v) => v.buildNumber;
  static const Field<BackupMetadata, String> _f$buildNumber = Field(
    'buildNumber',
    _$buildNumber,
  );
  static DateTime _$exportedAt(BackupMetadata v) => v.exportedAt;
  static const Field<BackupMetadata, DateTime> _f$exportedAt = Field(
    'exportedAt',
    _$exportedAt,
  );
  static String _$deviceModel(BackupMetadata v) => v.deviceModel;
  static const Field<BackupMetadata, String> _f$deviceModel = Field(
    'deviceModel',
    _$deviceModel,
  );

  @override
  final MappableFields<BackupMetadata> fields = const {
    #appVersion: _f$appVersion,
    #buildNumber: _f$buildNumber,
    #exportedAt: _f$exportedAt,
    #deviceModel: _f$deviceModel,
  };

  static BackupMetadata _instantiate(DecodingData data) {
    return BackupMetadata(
      appVersion: data.dec(_f$appVersion),
      buildNumber: data.dec(_f$buildNumber),
      exportedAt: data.dec(_f$exportedAt),
      deviceModel: data.dec(_f$deviceModel),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BackupMetadata fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BackupMetadata>(map);
  }

  static BackupMetadata fromJson(String json) {
    return ensureInitialized().decodeJson<BackupMetadata>(json);
  }
}

mixin BackupMetadataMappable {
  String toJson() {
    return BackupMetadataMapper.ensureInitialized().encodeJson<BackupMetadata>(
      this as BackupMetadata,
    );
  }

  Map<String, dynamic> toMap() {
    return BackupMetadataMapper.ensureInitialized().encodeMap<BackupMetadata>(
      this as BackupMetadata,
    );
  }

  BackupMetadataCopyWith<BackupMetadata, BackupMetadata, BackupMetadata>
  get copyWith => _BackupMetadataCopyWithImpl<BackupMetadata, BackupMetadata>(
    this as BackupMetadata,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return BackupMetadataMapper.ensureInitialized().stringifyValue(
      this as BackupMetadata,
    );
  }

  @override
  bool operator ==(Object other) {
    return BackupMetadataMapper.ensureInitialized().equalsValue(
      this as BackupMetadata,
      other,
    );
  }

  @override
  int get hashCode {
    return BackupMetadataMapper.ensureInitialized().hashValue(
      this as BackupMetadata,
    );
  }
}

extension BackupMetadataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BackupMetadata, $Out> {
  BackupMetadataCopyWith<$R, BackupMetadata, $Out> get $asBackupMetadata =>
      $base.as((v, t, t2) => _BackupMetadataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BackupMetadataCopyWith<$R, $In extends BackupMetadata, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? appVersion,
    String? buildNumber,
    DateTime? exportedAt,
    String? deviceModel,
  });
  BackupMetadataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _BackupMetadataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BackupMetadata, $Out>
    implements BackupMetadataCopyWith<$R, BackupMetadata, $Out> {
  _BackupMetadataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BackupMetadata> $mapper =
      BackupMetadataMapper.ensureInitialized();
  @override
  $R call({
    String? appVersion,
    String? buildNumber,
    DateTime? exportedAt,
    String? deviceModel,
  }) => $apply(
    FieldCopyWithData({
      if (appVersion != null) #appVersion: appVersion,
      if (buildNumber != null) #buildNumber: buildNumber,
      if (exportedAt != null) #exportedAt: exportedAt,
      if (deviceModel != null) #deviceModel: deviceModel,
    }),
  );
  @override
  BackupMetadata $make(CopyWithData data) => BackupMetadata(
    appVersion: data.get(#appVersion, or: $value.appVersion),
    buildNumber: data.get(#buildNumber, or: $value.buildNumber),
    exportedAt: data.get(#exportedAt, or: $value.exportedAt),
    deviceModel: data.get(#deviceModel, or: $value.deviceModel),
  );

  @override
  BackupMetadataCopyWith<$R2, BackupMetadata, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BackupMetadataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class BackupDataMapper extends ClassMapperBase<BackupData> {
  BackupDataMapper._();

  static BackupDataMapper? _instance;
  static BackupDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BackupDataMapper._());
      BackupMetadataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BackupData';

  static BackupMetadata _$metadata(BackupData v) => v.metadata;
  static const Field<BackupData, BackupMetadata> _f$metadata = Field(
    'metadata',
    _$metadata,
  );
  static List<Map<String, dynamic>> _$medications(BackupData v) =>
      v.medications;
  static const Field<BackupData, List<Map<String, dynamic>>> _f$medications =
      Field('medications', _$medications);
  static List<Map<String, dynamic>> _$medicationSchedules(BackupData v) =>
      v.medicationSchedules;
  static const Field<BackupData, List<Map<String, dynamic>>>
  _f$medicationSchedules = Field('medicationSchedules', _$medicationSchedules);
  static List<Map<String, dynamic>> _$doseLogs(BackupData v) => v.doseLogs;
  static const Field<BackupData, List<Map<String, dynamic>>> _f$doseLogs =
      Field('doseLogs', _$doseLogs);
  static Map<String, dynamic>? _$settings(BackupData v) => v.settings;
  static const Field<BackupData, Map<String, dynamic>> _f$settings = Field(
    'settings',
    _$settings,
    opt: true,
  );

  @override
  final MappableFields<BackupData> fields = const {
    #metadata: _f$metadata,
    #medications: _f$medications,
    #medicationSchedules: _f$medicationSchedules,
    #doseLogs: _f$doseLogs,
    #settings: _f$settings,
  };

  static BackupData _instantiate(DecodingData data) {
    return BackupData(
      metadata: data.dec(_f$metadata),
      medications: data.dec(_f$medications),
      medicationSchedules: data.dec(_f$medicationSchedules),
      doseLogs: data.dec(_f$doseLogs),
      settings: data.dec(_f$settings),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BackupData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BackupData>(map);
  }

  static BackupData fromJson(String json) {
    return ensureInitialized().decodeJson<BackupData>(json);
  }
}

mixin BackupDataMappable {
  String toJson() {
    return BackupDataMapper.ensureInitialized().encodeJson<BackupData>(
      this as BackupData,
    );
  }

  Map<String, dynamic> toMap() {
    return BackupDataMapper.ensureInitialized().encodeMap<BackupData>(
      this as BackupData,
    );
  }

  BackupDataCopyWith<BackupData, BackupData, BackupData> get copyWith =>
      _BackupDataCopyWithImpl<BackupData, BackupData>(
        this as BackupData,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BackupDataMapper.ensureInitialized().stringifyValue(
      this as BackupData,
    );
  }

  @override
  bool operator ==(Object other) {
    return BackupDataMapper.ensureInitialized().equalsValue(
      this as BackupData,
      other,
    );
  }

  @override
  int get hashCode {
    return BackupDataMapper.ensureInitialized().hashValue(this as BackupData);
  }
}

extension BackupDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BackupData, $Out> {
  BackupDataCopyWith<$R, BackupData, $Out> get $asBackupData =>
      $base.as((v, t, t2) => _BackupDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BackupDataCopyWith<$R, $In extends BackupData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  BackupMetadataCopyWith<$R, BackupMetadata, BackupMetadata> get metadata;
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get medications;
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get medicationSchedules;
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get doseLogs;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>?>?
  get settings;
  $R call({
    BackupMetadata? metadata,
    List<Map<String, dynamic>>? medications,
    List<Map<String, dynamic>>? medicationSchedules,
    List<Map<String, dynamic>>? doseLogs,
    Map<String, dynamic>? settings,
  });
  BackupDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BackupDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BackupData, $Out>
    implements BackupDataCopyWith<$R, BackupData, $Out> {
  _BackupDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BackupData> $mapper =
      BackupDataMapper.ensureInitialized();
  @override
  BackupMetadataCopyWith<$R, BackupMetadata, BackupMetadata> get metadata =>
      $value.metadata.copyWith.$chain((v) => call(metadata: v));
  @override
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get medications => ListCopyWith(
    $value.medications,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(medications: v),
  );
  @override
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get medicationSchedules => ListCopyWith(
    $value.medicationSchedules,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(medicationSchedules: v),
  );
  @override
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get doseLogs => ListCopyWith(
    $value.doseLogs,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(doseLogs: v),
  );
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>?>?
  get settings => $value.settings != null
      ? MapCopyWith(
          $value.settings!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(settings: v),
        )
      : null;
  @override
  $R call({
    BackupMetadata? metadata,
    List<Map<String, dynamic>>? medications,
    List<Map<String, dynamic>>? medicationSchedules,
    List<Map<String, dynamic>>? doseLogs,
    Object? settings = $none,
  }) => $apply(
    FieldCopyWithData({
      if (metadata != null) #metadata: metadata,
      if (medications != null) #medications: medications,
      if (medicationSchedules != null)
        #medicationSchedules: medicationSchedules,
      if (doseLogs != null) #doseLogs: doseLogs,
      if (settings != $none) #settings: settings,
    }),
  );
  @override
  BackupData $make(CopyWithData data) => BackupData(
    metadata: data.get(#metadata, or: $value.metadata),
    medications: data.get(#medications, or: $value.medications),
    medicationSchedules: data.get(
      #medicationSchedules,
      or: $value.medicationSchedules,
    ),
    doseLogs: data.get(#doseLogs, or: $value.doseLogs),
    settings: data.get(#settings, or: $value.settings),
  );

  @override
  BackupDataCopyWith<$R2, BackupData, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BackupDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

