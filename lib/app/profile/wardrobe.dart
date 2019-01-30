import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/app/profile/wardrobe-gacha.dart';
import 'package:groupleh/app/profile/wardrobe-listing.dart';
import 'package:groupleh/core/profile.dart';
import 'package:groupleh/core/item_directory.dart';

class Wardrobe extends StatelessWidget {
  final Profile profile;
  final ItemDirectory directory;

  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  Wardrobe(this.profile, this.directory) {
    reference = Firestore.instance.collection('wardrobes').reference();
    snapshots = reference
        .where("user", isEqualTo: profile.id)
        .orderBy("item")
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Wardrobe",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Are you for honto ni?"),
                    content: Text(
                        "Do you want to use 100 coins for a chance to receive a random wardrobe clothing?\r\n\r\nPsst.. you might actually get nothing if you already have the item..\r\n\r\nYou have " +
                            profile.coins.toString() +
                            " coins."),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("No.."),
                      ),
                      FlatButton(
                        onPressed: () {
                          if (profile.coins >= 100) {
                            profile.coins -= 100;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WardrobeGacha(profile, directory)));
                          } else {
                            showDialog(
                                context: context,
                                child: AlertDialog(
                                  title: Text("Umm.."),
                                  content: Text(
                                      "You do not have enough coins for this."),
                                ));
                          }
                        },
                        child: Text("Yes!"),
                      )
                    ],
                  );
                });
          },
          child: Icon(Icons.shopping_basket),
        ),
        body: FirestoreAnimatedList(
          emptyChild: Container(),
          query: snapshots,
          itemBuilder: (
            BuildContext context,
            DocumentSnapshot snapshot,
            Animation<double> animation,
            int index,
          ) {
            return WardrobeListing(
                profile, directory.items[snapshot["item"]], directory);
          },
        ));
  }
}
