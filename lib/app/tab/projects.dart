import 'package:flutter/material.dart';
import 'package:groupleh/app/core/group.dart';
import 'package:groupleh/app/tab/groups_chat.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';

class Projects extends StatefulWidget {
  final AppState state;
  final PageController pageController;

  Projects(this.pageController, this.state);

  @override
  State<StatefulWidget> createState() => _Projects(pageController, state);
}

class _Projects extends State<Projects> {
  final AppState state;
  final PageController pageController;
  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _Projects(this.pageController, this.state) {
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
                  Text("Groups",
                      style: TextStyle(
                          fontSize: 48.0, fontWeight: FontWeight.bold)),
                  Expanded(child: ListView()),
                ])));
  }
}
