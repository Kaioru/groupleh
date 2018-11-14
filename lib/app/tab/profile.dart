import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  final AppState state;

  Profile(this.state);

  @override
  State<StatefulWidget> createState() => _Profile(state);
}

class _Profile extends State<Profile> {
  final AppState state;
  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _Profile(this.state);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Profile",
                    style:
                        TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold))
              ])),
    );
  }
}
