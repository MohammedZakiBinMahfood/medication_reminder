// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'settings_model.dart';

class SettingsModelMapper extends ClassMapperBase<SettingsModel> {
  SettingsModelMapper._();

  static SettingsModelMapper? _instance;
  static SettingsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsModelMapper._());
      AppThemeModeMapper.ensureInitialized();
      AppHistoryFilterMapper.ensureInitialized();
      AppHistoryGroupingMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SettingsModel';

  static String _$uuid(SettingsModel v) => v.uuid;
  static const Field<SettingsModel, String> _f$uuid = Field('uuid', _$uuid);
  static String _$language(SettingsModel v) => v.language;
  static const Field<SettingsModel, String> _f$language = Field(
    'language',
    _$language,
  );
  static AppThemeMode _$themeMode(SettingsModel v) => v.themeMode;
  static const Field<SettingsModel, AppThemeMode> _f$themeMode = Field(
    'themeMode',
    _$themeMode,
  );
  static int _$firstDayOfWeek(SettingsModel v) => v.firstDayOfWeek;
  static const Field<SettingsModel, int> _f$firstDayOfWeek = Field(
    'firstDayOfWeek',
    _$firstDayOfWeek,
  );
  static bool _$timeFormat24(SettingsModel v) => v.timeFormat24;
  static const Field<SettingsModel, bool> _f$timeFormat24 = Field(
    'timeFormat24',
    _$timeFormat24,
  );
  static bool _$notificationsEnabled(SettingsModel v) => v.notificationsEnabled;
  static const Field<SettingsModel, bool> _f$notificationsEnabled = Field(
    'notificationsEnabled',
    _$notificationsEnabled,
  );
  static bool _$notificationSound(SettingsModel v) => v.notificationSound;
  static const Field<SettingsModel, bool> _f$notificationSound = Field(
    'notificationSound',
    _$notificationSound,
  );
  static bool _$vibrationEnabled(SettingsModel v) => v.vibrationEnabled;
  static const Field<SettingsModel, bool> _f$vibrationEnabled = Field(
    'vibrationEnabled',
    _$vibrationEnabled,
  );
  static int _$defaultSnoozeMinutes(SettingsModel v) => v.defaultSnoozeMinutes;
  static const Field<SettingsModel, int> _f$defaultSnoozeMinutes = Field(
    'defaultSnoozeMinutes',
    _$defaultSnoozeMinutes,
  );
  static int _$reminderBeforeMinutes(SettingsModel v) =>
      v.reminderBeforeMinutes;
  static const Field<SettingsModel, int> _f$reminderBeforeMinutes = Field(
    'reminderBeforeMinutes',
    _$reminderBeforeMinutes,
  );
  static AppHistoryFilter _$defaultHistoryFilter(SettingsModel v) =>
      v.defaultHistoryFilter;
  static const Field<SettingsModel, AppHistoryFilter> _f$defaultHistoryFilter =
      Field('defaultHistoryFilter', _$defaultHistoryFilter);
  static AppHistoryGrouping _$defaultHistoryGrouping(SettingsModel v) =>
      v.defaultHistoryGrouping;
  static const Field<SettingsModel, AppHistoryGrouping>
  _f$defaultHistoryGrouping = Field(
    'defaultHistoryGrouping',
    _$defaultHistoryGrouping,
  );
  static bool _$autoBackupEnabled(SettingsModel v) => v.autoBackupEnabled;
  static const Field<SettingsModel, bool> _f$autoBackupEnabled = Field(
    'autoBackupEnabled',
    _$autoBackupEnabled,
  );
  static String _$appVersion(SettingsModel v) => v.appVersion;
  static const Field<SettingsModel, String> _f$appVersion = Field(
    'appVersion',
    _$appVersion,
  );
  static String _$buildNumber(SettingsModel v) => v.buildNumber;
  static const Field<SettingsModel, String> _f$buildNumber = Field(
    'buildNumber',
    _$buildNumber,
  );
  static DateTime _$createdAt(SettingsModel v) => v.createdAt;
  static const Field<SettingsModel, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static DateTime _$updatedAt(SettingsModel v) => v.updatedAt;
  static const Field<SettingsModel, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
  );

  @override
  final MappableFields<SettingsModel> fields = const {
    #uuid: _f$uuid,
    #language: _f$language,
    #themeMode: _f$themeMode,
    #firstDayOfWeek: _f$firstDayOfWeek,
    #timeFormat24: _f$timeFormat24,
    #notificationsEnabled: _f$notificationsEnabled,
    #notificationSound: _f$notificationSound,
    #vibrationEnabled: _f$vibrationEnabled,
    #defaultSnoozeMinutes: _f$defaultSnoozeMinutes,
    #reminderBeforeMinutes: _f$reminderBeforeMinutes,
    #defaultHistoryFilter: _f$defaultHistoryFilter,
    #defaultHistoryGrouping: _f$defaultHistoryGrouping,
    #autoBackupEnabled: _f$autoBackupEnabled,
    #appVersion: _f$appVersion,
    #buildNumber: _f$buildNumber,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static SettingsModel _instantiate(DecodingData data) {
    return SettingsModel(
      uuid: data.dec(_f$uuid),
      language: data.dec(_f$language),
      themeMode: data.dec(_f$themeMode),
      firstDayOfWeek: data.dec(_f$firstDayOfWeek),
      timeFormat24: data.dec(_f$timeFormat24),
      notificationsEnabled: data.dec(_f$notificationsEnabled),
      notificationSound: data.dec(_f$notificationSound),
      vibrationEnabled: data.dec(_f$vibrationEnabled),
      defaultSnoozeMinutes: data.dec(_f$defaultSnoozeMinutes),
      reminderBeforeMinutes: data.dec(_f$reminderBeforeMinutes),
      defaultHistoryFilter: data.dec(_f$defaultHistoryFilter),
      defaultHistoryGrouping: data.dec(_f$defaultHistoryGrouping),
      autoBackupEnabled: data.dec(_f$autoBackupEnabled),
      appVersion: data.dec(_f$appVersion),
      buildNumber: data.dec(_f$buildNumber),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SettingsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingsModel>(map);
  }

  static SettingsModel fromJson(String json) {
    return ensureInitialized().decodeJson<SettingsModel>(json);
  }
}

mixin SettingsModelMappable {
  String toJson() {
    return SettingsModelMapper.ensureInitialized().encodeJson<SettingsModel>(
      this as SettingsModel,
    );
  }

  Map<String, dynamic> toMap() {
    return SettingsModelMapper.ensureInitialized().encodeMap<SettingsModel>(
      this as SettingsModel,
    );
  }

  SettingsModelCopyWith<SettingsModel, SettingsModel, SettingsModel>
  get copyWith => _SettingsModelCopyWithImpl<SettingsModel, SettingsModel>(
    this as SettingsModel,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return SettingsModelMapper.ensureInitialized().stringifyValue(
      this as SettingsModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SettingsModelMapper.ensureInitialized().equalsValue(
      this as SettingsModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SettingsModelMapper.ensureInitialized().hashValue(
      this as SettingsModel,
    );
  }
}

extension SettingsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SettingsModel, $Out> {
  SettingsModelCopyWith<$R, SettingsModel, $Out> get $asSettingsModel =>
      $base.as((v, t, t2) => _SettingsModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SettingsModelCopyWith<$R, $In extends SettingsModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? uuid,
    String? language,
    AppThemeMode? themeMode,
    int? firstDayOfWeek,
    bool? timeFormat24,
    bool? notificationsEnabled,
    bool? notificationSound,
    bool? vibrationEnabled,
    int? defaultSnoozeMinutes,
    int? reminderBeforeMinutes,
    AppHistoryFilter? defaultHistoryFilter,
    AppHistoryGrouping? defaultHistoryGrouping,
    bool? autoBackupEnabled,
    String? appVersion,
    String? buildNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  SettingsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SettingsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SettingsModel, $Out>
    implements SettingsModelCopyWith<$R, SettingsModel, $Out> {
  _SettingsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SettingsModel> $mapper =
      SettingsModelMapper.ensureInitialized();
  @override
  $R call({
    String? uuid,
    String? language,
    AppThemeMode? themeMode,
    int? firstDayOfWeek,
    bool? timeFormat24,
    bool? notificationsEnabled,
    bool? notificationSound,
    bool? vibrationEnabled,
    int? defaultSnoozeMinutes,
    int? reminderBeforeMinutes,
    AppHistoryFilter? defaultHistoryFilter,
    AppHistoryGrouping? defaultHistoryGrouping,
    bool? autoBackupEnabled,
    String? appVersion,
    String? buildNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => $apply(
    FieldCopyWithData({
      if (uuid != null) #uuid: uuid,
      if (language != null) #language: language,
      if (themeMode != null) #themeMode: themeMode,
      if (firstDayOfWeek != null) #firstDayOfWeek: firstDayOfWeek,
      if (timeFormat24 != null) #timeFormat24: timeFormat24,
      if (notificationsEnabled != null)
        #notificationsEnabled: notificationsEnabled,
      if (notificationSound != null) #notificationSound: notificationSound,
      if (vibrationEnabled != null) #vibrationEnabled: vibrationEnabled,
      if (defaultSnoozeMinutes != null)
        #defaultSnoozeMinutes: defaultSnoozeMinutes,
      if (reminderBeforeMinutes != null)
        #reminderBeforeMinutes: reminderBeforeMinutes,
      if (defaultHistoryFilter != null)
        #defaultHistoryFilter: defaultHistoryFilter,
      if (defaultHistoryGrouping != null)
        #defaultHistoryGrouping: defaultHistoryGrouping,
      if (autoBackupEnabled != null) #autoBackupEnabled: autoBackupEnabled,
      if (appVersion != null) #appVersion: appVersion,
      if (buildNumber != null) #buildNumber: buildNumber,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
    }),
  );
  @override
  SettingsModel $make(CopyWithData data) => SettingsModel(
    uuid: data.get(#uuid, or: $value.uuid),
    language: data.get(#language, or: $value.language),
    themeMode: data.get(#themeMode, or: $value.themeMode),
    firstDayOfWeek: data.get(#firstDayOfWeek, or: $value.firstDayOfWeek),
    timeFormat24: data.get(#timeFormat24, or: $value.timeFormat24),
    notificationsEnabled: data.get(
      #notificationsEnabled,
      or: $value.notificationsEnabled,
    ),
    notificationSound: data.get(
      #notificationSound,
      or: $value.notificationSound,
    ),
    vibrationEnabled: data.get(#vibrationEnabled, or: $value.vibrationEnabled),
    defaultSnoozeMinutes: data.get(
      #defaultSnoozeMinutes,
      or: $value.defaultSnoozeMinutes,
    ),
    reminderBeforeMinutes: data.get(
      #reminderBeforeMinutes,
      or: $value.reminderBeforeMinutes,
    ),
    defaultHistoryFilter: data.get(
      #defaultHistoryFilter,
      or: $value.defaultHistoryFilter,
    ),
    defaultHistoryGrouping: data.get(
      #defaultHistoryGrouping,
      or: $value.defaultHistoryGrouping,
    ),
    autoBackupEnabled: data.get(
      #autoBackupEnabled,
      or: $value.autoBackupEnabled,
    ),
    appVersion: data.get(#appVersion, or: $value.appVersion),
    buildNumber: data.get(#buildNumber, or: $value.buildNumber),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  SettingsModelCopyWith<$R2, SettingsModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SettingsModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

