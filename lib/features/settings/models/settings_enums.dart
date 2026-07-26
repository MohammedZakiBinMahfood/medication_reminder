import 'package:dart_mappable/dart_mappable.dart';

part 'settings_enums.mapper.dart';

@MappableEnum()
enum AppThemeMode { light, dark, system }

@MappableEnum()
enum AppHistoryFilter { last7Days, last30Days, custom, all }

@MappableEnum()
enum AppHistoryGrouping { day, week, month, medication }

@MappableEnum()
enum AppAccentColor {
  indigo,
  emerald,
  ocean,
  sunset,
  violet,
}
