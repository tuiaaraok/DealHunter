import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'list_of_products_model.g.dart';

@HiveType(typeId: 1)
class ListOfProductsModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String price;
  @HiveField(2)
  String description;
  @HiveField(3)
  bool isSales;
  @HiveField(4)
  Uint8List imageFriend;
  ListOfProductsModel(
      {required this.name,
      required this.price,
      required this.description,
      required this.imageFriend,
      required this.isSales});
}
