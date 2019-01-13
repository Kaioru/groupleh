import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/core/item.dart';
import 'package:groupleh/core/item_directory.dart';
import 'package:groupleh/core/item_type.dart';
import 'package:groupleh/core/profile.dart';
import 'package:firebase_storage/firebase_storage.dart';

class WardrobeSelect extends StatefulWidget {
  final Profile profile;
  final Item item;
  final ItemDirectory directory;
  String wardrobeHair;
  String wardrobeTop;
  String wardrobeBottom;

  WardrobeSelect(this.profile, this.item, this.directory) {
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
  State<StatefulWidget> createState() =>
      _WardrobeSelect(profile, item, directory);
}

class _WardrobeSelect extends State<WardrobeSelect> {
  final Profile profile;
  final Item item;
  final ItemDirectory directory;
  String wardrobeHair;
  String wardrobeTop;
  String wardrobeBottom;

  List<int> data = List();
  bool changing = false;

  _WardrobeSelect(this.profile, this.item, this.directory) {
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
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);
    return Scaffold(
        appBar: AppBar(
            title: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Is this daijoubu desu ka?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
        body: Container(
          padding: EdgeInsets.all(32.0),
          child: changing
              ? FutureBuilder(future: Future(() async {
                  StorageReference ref = FirebaseStorage.instance
                      .ref()
                      .child(profile.id)
                      .child("avatar.jpg");
                  StorageUploadTask uploadTask = ref.putData(data);

                  profile.wardrobeHair = wardrobeHair;
                  profile.wardrobeTop = wardrobeTop;
                  profile.wardrobeBottom = wardrobeBottom;
                  profile.image =
                      await (await uploadTask.onComplete).ref.getDownloadURL();

                  await Firestore.instance
                      .collection("profiles")
                      .document(profile.id)
                      .updateData({
                    "wardrobe_hair": profile.wardrobeHair,
                    "wardrobe_top": profile.wardrobeTop,
                    "wardrobe_bottom": profile.wardrobeBottom,
                    "image": profile.image,
                  });
                }), builder:
                  (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    Navigator.pop(context);
                  }

                  return Center(
                    child: Text("Lil' " + profile.name + " is changing..",
                        style: headerTextStyle),
                  );
                })
              : FutureBuilder(
                  future: directory.generate(
                      wardrobeHair, wardrobeTop, wardrobeBottom),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<int>> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: <Widget>[
                          Text(
                              ([
                                "Lookin' dapper as heck!",
                                "Lookin' good my dude!",
                                "Never go out of style!"
                              ]..shuffle())
                                  .first,
                              style: headerTextStyle),
                          Image.memory(
                            snapshot.data,
                            scale: 0.1,
                            filterQuality: FilterQuality.none,
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () => Navigator.pop(context),
                                color: Colors.red,
                                child: Text("No ew.", style: headerTextStyle),
                              ),
                              FlatButton(
                                onPressed: () => this.setState(() {
                                      data = snapshot.data;
                                      changing = true;
                                    }),
                                color: Colors.green,
                                child: Text("Aye sir!", style: headerTextStyle),
                              )
                            ],
                          )
                        ],
                      );
                    }
                    return Text("loaderino pepperino");
                  },
                ),
        ));
  }
}
