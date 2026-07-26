// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'settings_enums.dart';

class AppThemeModeMapper extends EnumMapper<AppThemeMode> {
  AppThemeModeMapper._();

  static AppThemeModeMapper? _instance;
  static AppThemeModeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppThemeModeMapper._());
    }
    return _instance!;
  }

  static AppThemeMode fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AppThemeMode decode(dynamic value) {
    switch (value) {
      case r'light':
        return AppThemeMode.light;
      case r'dark':
        return AppThemeMode.dark;
      case r'system':
        return AppThemeMode.system;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AppThemeMode self) {
    switch (self) {
      case AppThemeMode.light:
        return r'light';
      case AppThemeMode.dark:
        return r'dark';
      case AppThemeMode.system:
        return r'system';
    }
  }
}

extension AppThemeModeMapperExtension on AppThemeMode {
  String toValue() {
    AppThemeModeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AppThemeMode>(this) as String;
  }
}

class AppHistoryFilterMapper extends EnumMapper<AppHistoryFilter> {
  AppHistoryFilterMapper._();

  static AppHistoryFilterMapper? _instance;
  static AppHistoryFilterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppHistoryFilterMapper._());
    }
    return _instance!;
  }

  static AppHistoryFilter fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AppHistoryFilter decode(dynamic value) {
    switch (value) {
      case r'last7Days':
        return AppHistoryFilter.last7Days;
      case r'last30Days':
        return AppHistoryFilter.last30Days;
      case r'custom':
        return AppHistoryFilter.custom;
      case r'all':
        return AppHistoryFilter.all;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AppHistoryFilter self) {
    switch (self) {
      case AppHistoryFilter.last7Days:
        return r'last7Days';
      case AppHistoryFilter.last30Days:
        return r'last30Days';
      case AppHistoryFilter.custom:
        return r'custom';
      case AppHistoryFilter.all:
        return r'all';
    }
  }
}

extension AppHistoryFilterMapperExtension on AppHistoryFilter {
  String toValue() {
    AppHistoryFilterMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AppHistoryFilter>(this) as String;
  }
}

class AppHistoryGroupingMapper extends EnumMapper<AppHistoryGrouping> {
  AppHistoryGroupingMapper._();

  static AppHistoryGroupingMapper? _instance;
  static AppHistoryGroupingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppHistoryGroupingMapper._());
    }
    return _instance!;
  }

  static AppHistoryGrouping fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AppHistoryGrouping decode(dynamic value) {
    switch (value) {
      case r'day':
        return AppHistoryGrouping.day;
      case r'week':
        return AppHistoryGrouping.week;
      case r'month':
        return AppHistoryGrouping.month;
      case r'medication':
        return AppHistoryGrouping.medication;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AppHistoryGrouping self) {
    switch (self) {
      case AppHistoryGrouping.day:
        return r'day';
      case AppHistoryGrouping.week:
        return r'week';
      case AppHistoryGrouping.month:
        return r'month';
      case AppHistoryGrouping.medication:
        return r'medication';
    }
  }
}

extension AppHistoryGroupingMapperExtension on AppHistoryGrouping {
  String toValue() {
    AppHistoryGroupingMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AppHistoryGrouping>(this) as String;
  }
}

class AppAccentColorMapper extends EnumMapper<AppAccentColor> {
  AppAccentColorMapper._();

  static AppAccentColorMapper? _instance;
  static AppAccentColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppAccentColorMapper._());
    }
    return _instance!;
  }

  static AppAccentColor fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AppAccentColor decode(dynamic value) {
    switch (value) {
      case r'indigo':
        return AppAccentColor.indigo;
      case r'emerald':
        return AppAccentColor.emerald;
      case r'ocean':
        return AppAccentColor.ocean;
      case r'sunset':
        return AppAccentColor.sunset;
      case r'violet':
        return AppAccentColor.violet;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AppAccentColor self) {
    switch (self) {
      case AppAccentColor.indigo:
        return r'indigo';
      case AppAccentColor.emerald:
        return r'emerald';
      case AppAccentColor.ocean:
        return r'ocean';
      case AppAccentColor.sunset:
        return r'sunset';
      case AppAccentColor.violet:
        return r'violet';
    }
  }
}

extension AppAccentColorMapperExtension on AppAccentColor {
  String toValue() {
    AppAccentColorMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AppAccentColor>(this) as String;
  }
}

