import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/core/item.dart';
import 'package:groupleh/core/item_directory.dart';
import 'package:groupleh/core/item_type.dart';
import 'package:groupleh/core/profile.dart';

class WardrobeGacha extends StatefulWidget {
  final Profile profile;
  final ItemDirectory directory;
  Item item;

  WardrobeGacha(this.profile, this.directory) {
    item = (directory.items.values.toList()..shuffle()).first;
  }

  @override
  State<StatefulWidget> createState() =>
      _WardrobeGacha(profile, item, directory);
}

class _WardrobeGacha extends State<WardrobeGacha> {
  final Profile profile;
  final Item item;
  final ItemDirectory directory;

  String wardrobeHair;
  String wardrobeTop;
  String wardrobeBottom;

  bool already = true;

  _WardrobeGacha(this.profile, this.item, this.directory) {
    wardrobeHair = profile.wardrobeHair;
    wardrobeTop = profile.wardrobeTop;
    wardrobeBottom = profile.wardrobeBottom;

    switch (item.type) {
      case ItemType.hair:
        wardrobeHair = item.prefab;
        break;
      case ItemType.top:
        wardrobeTop = item.prefab;
        break;
      case ItemType.bottom:
        wardrobeBottom = item.prefab;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontFamily: 'Poppins');
    final headerTextStyle = textStyle.copyWith(
        color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.w600);
    final headerTextStyle2 = textStyle.copyWith(
        color: Colors.white, fontSize: 44.0, fontWeight: FontWeight.w600);
    final regularTextStyle = textStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 18.0,
        fontWeight: FontWeight.w400);

    return Scaffold(
        appBar: AppBar(
            title: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "sugoi omedeto!!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
        body: FutureBuilder(
          future: Future(() async {
            var reference =
                Firestore.instance.collection('wardrobes').reference();
            var documents = await reference
                .where("user", isEqualTo: profile.id)
                .where('item', isEqualTo: item.prefab)
                .getDocuments();

            already = documents.documents.length > 0;

            if (!already) {
              await Firestore.instance
                  .collection("profiles")
                  .document(profile.id)
                  .updateData({"coins": profile.coins});
              await Firestore.instance
                  .collection("wardrobes")
                  .add({"item": item.prefab, "user": profile.id});
            }
          }),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Item GET!", style: headerTextStyle2),
                    FutureBuilder(
                      future: directory.generate(
                          wardrobeHair, wardrobeTop, wardrobeBottom),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<int>> snapshot) {
                        if (snapshot.hasData) {
                          return Image.memory(
                            snapshot.data,
                            scale: 0.1,
                            filterQuality: FilterQuality.none,
                          );
                        }
                        return Text("loaderino pepperino");
                      },
                    ),
                    Text(item.name, style: headerTextStyle),
                    Text("'" + item.desc + "'", style: regularTextStyle),
                    Divider(),
                    already
                        ? Text("You already have this wardrobe item..",
                            style: regularTextStyle.copyWith(color: Colors.red))
                        : Container(),
                    FlatButton(
                      onPressed: () => Navigator.pop(context),
                      color: Colors.green,
                      child: Text("Ok", style: regularTextStyle),
                    )
                  ],
                ),
              );
            }
            return Container(
              padding: EdgeInsets.all(32.0),
              child: Center(
                child: Text("Generating magical voodoo items..",
                    style: headerTextStyle2),
              ),
            );
          },
        ));
  }
}
