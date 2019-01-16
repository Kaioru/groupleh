import 'package:groupleh/core/item.dart';
import 'package:groupleh/core/item_type.dart';

class ItemDirectory {
  Map<String, Item> items;

  ItemDirectory() {
    items = Map();

    List.of([
      Item(type: ItemType.hair, prefab: "hair_long_floral_green"),
      Item(type: ItemType.hair, prefab: "hair_long_sideswept_blonde"),
      Item(type: ItemType.hair, prefab: "hair_long_wave_orange"),
      Item(type: ItemType.hair, prefab: "hair_messy_two_block_red"),
      Item(type: ItemType.hair, prefab: "hair_ponytail_yellow"),
      Item(type: ItemType.hair, prefab: "hair_quiff_pink"),
      Item(type: ItemType.hair, prefab: "hair_samurai_brown"),
      Item(type: ItemType.hair, prefab: "hair_short_bob_purple"),
      Item(type: ItemType.hair, prefab: "hair_sideswept_blonde"),
      Item(type: ItemType.hair, prefab: "hair_two_block_green"),
      Item(type: ItemType.top, prefab: "top_chef_white"),
      Item(type: ItemType.top, prefab: "top_cowboy_blue"),
      Item(
          type: ItemType.top,
          prefab: "top_elven_shirt",
          name: "Elven Shirt",
          desc: "Oddly reminiscent of a certain someone from a certain anime."),
      Item(type: ItemType.top, prefab: "top_hoodie_green"),
      Item(type: ItemType.top, prefab: "top_ict_purple"),
      Item(type: ItemType.top, prefab: "top_layered_cropped_biege"),
      Item(type: ItemType.top, prefab: "top_layered_shirt_black"),
      Item(type: ItemType.top, prefab: "top_layered_shirt_darkbrown"),
      Item(type: ItemType.top, prefab: "top_layered_shirt_green"),
      Item(
          type: ItemType.top,
          prefab: "top_leafa_green",
          name: "Elven Corset",
          desc: "Oddly reminiscent of a certain someone from a certain anime."),
      Item(type: ItemType.top, prefab: "top_ninja_blue"),
      Item(type: ItemType.top, prefab: "top_shirt_greyish"),
      Item(type: ItemType.top, prefab: "top_shirt_white"),
      Item(type: ItemType.top, prefab: "top_sleeveless_darkblue"),
      Item(type: ItemType.top, prefab: "top_studded_black"),
      Item(type: ItemType.bottom, prefab: "bottom_chef_white"),
      Item(
          type: ItemType.bottom,
          prefab: "bottom_elven_pants",
          name: "Elven Pants",
          desc: "Oddly reminiscent of a certain someone from a certain anime."),
      Item(
          type: ItemType.bottom,
          prefab: "bottom_leafa_green",
          name: "Elven Skirt",
          desc: "Oddly reminiscent of a certain someone from a certain anime."),
      Item(type: ItemType.bottom, prefab: "bottom_long_lightgrey"),
      Item(type: ItemType.bottom, prefab: "bottom_ninja_blue"),
      Item(
          type: ItemType.bottom,
          prefab: "bottom_short_black",
          name: "Black Shorts",
          desc: "Everyone owns a pair of these.. probably."),
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
      Item(type: ItemType.bottom, prefab: "bottom_short_darkbrown"),
      Item(type: ItemType.bottom, prefab: "bottom_skirt_ruffled_black"),
      Item(type: ItemType.bottom, prefab: "bottom_studdent_black"),
      Item(type: ItemType.bottom, prefab: "bottom_uneven_lightgrey"),
    ]).forEach((i) => items[i.prefab] = i);
  }
}
