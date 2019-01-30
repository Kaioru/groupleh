import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/app/profile/achievement-listing.dart';
import 'package:groupleh/core/achievement.dart';
import 'package:groupleh/core/profile.dart';

class AchivementEX extends StatefulWidget {
  final Profile profile;

  AchivementEX(this.profile);

  @override
  State<StatefulWidget> createState() => _AchivementEX(profile);
}

class _AchivementEX extends State<AchivementEX> {
  final Profile profile;

  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _AchivementEX(this.profile) {
    reference = Firestore.instance.collection('achievements').reference();
    snapshots = reference.where("user", isEqualTo: profile.id).snapshots();
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
              "Achievements",
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
          return AchievementListing(Achievement(
              name: snapshot.data["name"], desc: snapshot.data["desc"], date: snapshot.data["date"]));
        },
      ),
    );
  }
}
