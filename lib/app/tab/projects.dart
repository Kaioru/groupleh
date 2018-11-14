import 'package:flutter/material.dart';
import 'package:groupleh/app/core/group.dart';
import 'package:groupleh/app/tab/groups_chat.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';

class Projects extends StatefulWidget {
  final AppState state;

  Projects(this.state);

  @override
  State<StatefulWidget> createState() => _Projects(state);
}

class _Projects extends State<Projects> {
  final AppState state;
  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _Projects(this.state) {
    reference = Firestore.instance.collection('projects').reference();
    snapshots = reference.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Projects",
                      style: TextStyle(
                          fontSize: 48.0, fontWeight: FontWeight.bold)),
                  Expanded(child: ListView()),
                ])));
  }
}
