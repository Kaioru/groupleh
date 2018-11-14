import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';

class Matchmaking extends StatefulWidget {
  final AppState state;

  Matchmaking(this.state);

  @override
  State<StatefulWidget> createState() => _Matchmaking(state);
}

class _Matchmaking extends State<Matchmaking> {
  final AppState state;
  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _Matchmaking(this.state);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Matchmaking",
                    style:
                        TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold))
              ])),
    );
  }
}
