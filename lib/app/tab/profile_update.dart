import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileUpdate extends StatefulWidget {
  final AppState state;

  ProfileUpdate(this.state);

  @override
  State<StatefulWidget> createState() => _ProfileUpdate(state);
}

class _ProfileUpdate extends State<ProfileUpdate> {
  final AppState state;
  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _ProfileUpdate(this.state);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(),
    );
  }
}
