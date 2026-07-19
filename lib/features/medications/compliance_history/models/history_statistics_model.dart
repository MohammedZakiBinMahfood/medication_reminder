class HistoryStatisticsModel {
  final int totalDoses;
  final int taken;
  final int missed;
  final int skipped;
  final int snoozed;
  final double adherencePercentage;
  final double dailyAverage;
  final int currentStreak;
  final int longestStreak;

  const HistoryStatisticsModel({
    required this.totalDoses,
    required this.taken,
    required this.missed,
    required this.skipped,
    required this.snoozed,
    required this.adherencePercentage,
    required this.dailyAverage,
    required this.currentStreak,
    required this.longestStreak,
  });

  factory HistoryStatisticsModel.empty() {
    return const HistoryStatisticsModel(
      totalDoses: 0,
      taken: 0,
      missed: 0,
      skipped: 0,
      snoozed: 0,
      adherencePercentage: 0,
      dailyAverage: 0,
      currentStreak: 0,
      longestStreak: 0,
    );
  }

  HistoryStatisticsModel copyWith({
    int? totalDoses,
    int? taken,
    int? missed,
    int? skipped,
    int? snoozed,
    double? adherencePercentage,
    double? dailyAverage,
    int? currentStreak,
    int? longestStreak,
  }) {
    return HistoryStatisticsModel(
      totalDoses: totalDoses ?? this.totalDoses,
      taken: taken ?? this.taken,
      missed: missed ?? this.missed,
      skipped: skipped ?? this.skipped,
      snoozed: snoozed ?? this.snoozed,
      adherencePercentage: adherencePercentage ?? this.adherencePercentage,
      dailyAverage: dailyAverage ?? this.dailyAverage,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
    );
  }
}
