import 'package:groupleh/core/item_type.dart';

class Item {
  final ItemType type;
  final String prefab;
  final String name;
  final String desc;

  Item({this.type, this.prefab, this.name = "???", this.desc = "???"});
}