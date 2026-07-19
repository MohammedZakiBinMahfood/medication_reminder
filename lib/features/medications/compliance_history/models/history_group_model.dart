import 'history_item_model.dart';

class HistoryGroupModel {
  final String label;
  final List<HistoryItemModel> items;

  const HistoryGroupModel({required this.label, required this.items});

  int get count => items.length;

  int get takenCount => items.where((i) => i.status.name == 'taken').length;

  int get missedCount => items.where((i) => i.status.name == 'missed').length;

  double get adherencePercentage => count > 0 ? (takenCount / count) * 100 : 0;
}
