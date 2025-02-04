import 'package:hive_flutter/hive_flutter.dart';
part 'statistic_model.g.dart';

@HiveType(typeId: 2)
class StatisticModel {
  @HiveField(0)
  double sold;
  @HiveField(1)
  int sales;
  StatisticModel({required this.sold, required this.sales});
}
