import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/app/profile/wardrobe-listing.dart';
import 'package:groupleh/core/item.dart';
import 'package:groupleh/core/profile.dart';
import 'package:groupleh/core/item_directory.dart';

class Wardrobe extends StatelessWidget {
  final Profile profile;
  final ItemDirectory directory;

  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  Wardrobe(this.profile, this.directory) {
    reference = Firestore.instance.collection('wardrobes').reference();
    snapshots = reference.where("user", isEqualTo: profile.id).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontFamily: 'Poppins');
    final headerTextStyle = textStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);
    final headerTextStyle2 = textStyle.copyWith(
        color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.w600);
    final regularTextStyle = textStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
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
        body: FirestoreAnimatedList(
          emptyChild: Container(),
          query: snapshots,
          itemBuilder: (
            BuildContext context,
            DocumentSnapshot snapshot,
            Animation<double> animation,
            int index,
          ) {
            return WardrobeListing(profile, directory.items[snapshot["item"]], directory);
          },
        ));
  }
}
