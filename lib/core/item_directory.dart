import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:groupleh/core/item.dart';
import 'package:groupleh/core/item_type.dart';
import 'package:groupleh/core/profile.dart';
import 'package:image/image.dart';

class ItemDirectory {
  Map<String, Item> items;

  ItemDirectory() {
    items = Map();

    List.of([
      Item(type: ItemType.hair, prefab: "hair_long_floral_green"),
      Item(type: ItemType.hair, prefab: "hair_long_wave_orange"),
      Item(type: ItemType.hair, prefab: "hair_messy_two_block_red"),
      Item(type: ItemType.hair, prefab: "hair_ponytail_yellow"),
      Item(type: ItemType.hair, prefab: "hair_quiff_pink"),
      Item(type: ItemType.hair, prefab: "hair_samurai_brown"),
      Item(type: ItemType.hair, prefab: "hair_short_bob_purple"),
      Item(type: ItemType.hair, prefab: "hair_two_block_green"),
      Item(type: ItemType.top, prefab: "top_cowboy_blue"),
      Item(type: ItemType.top, prefab: "top_layered_shirt_black"),
      Item(type: ItemType.top, prefab: "top_leafa_green"),
      Item(type: ItemType.top, prefab: "top_shirt_white"),
      Item(type: ItemType.bottom, prefab: "bottom_leafa_green"),
      Item(
          type: ItemType.bottom,
          prefab: "bottom_short_blue",
          name: "Blue Shorts",
          desc: "Blue is for cool people."),
      Item(
          type: ItemType.bottom,
          prefab: "bottom_short_brown",
          name: "Brown Shorts",
          desc: "Brown is the colour of poo."),
    ]).forEach((i) => items[i.prefab] = i);
  }

  Future<Uint8List> image(String key) async {
    Uint8List data = (await rootBundle.load(key)).buffer.asUint8List();
    return data;
  }

  Future<List<int>> generate(
      String wardrobeHair, String wardrobeTop, String wardrobeBottom) async {
    var prefix = "assets/images/wardrobe/";
    Image avatar = decodePng(await image(prefix + "avatar_white.png"));
    Image hair = decodePng(await image(prefix + wardrobeHair + ".png"));
    Image top = decodePng(await image(prefix + wardrobeTop + ".png"));
    Image bottom = decodePng(await image(prefix + wardrobeBottom + ".png"));

    drawImage(avatar, hair);
    drawImage(avatar, top);
    drawImage(avatar, bottom);

    return encodePng(avatar);
  }
}
