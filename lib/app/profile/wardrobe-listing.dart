import 'package:flutter/material.dart';
import 'package:groupleh/app/component/gl_row.dart';
import 'package:groupleh/app/profile/wardrobe-select.dart';
import 'package:groupleh/core/item.dart';
import 'package:groupleh/core/item_directory.dart';
import 'package:groupleh/core/profile.dart';

class WardrobeListing extends StatelessWidget {
  final Profile profile;
  final Item item;
  final ItemDirectory directory;

  WardrobeListing(this.profile, this.item, this.directory);

  @override
  Widget build(BuildContext context) {
    var dab = [
      profile.wardrobeHair,
      profile.wardrobeTop,
      profile.wardrobeBottom
    ];

    return GestureDetector(
      onTap: () {
        if (dab.contains(item.prefab)) return;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WardrobeSelect(profile, item, directory)));
      },
      child: GLRow(
          image: Image.asset("assets/images/wardrobe/" + item.prefab + ".png"),
          title: item.name,
          desc: dab.contains(item.prefab)
              ? "(equipped)\r\n" + item.desc
              : item.desc),
    );
  }
}
