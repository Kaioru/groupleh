import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileUpdate extends StatefulWidget {
  final AppState state;

  ProfileUpdate(this.state);

  @override
  State<StatefulWidget> createState() => _ProfileUpdate(state);
}

class _ProfileUpdate extends State<ProfileUpdate> {
  final AppState state;
  final _displayNameController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _ProfileUpdate(this.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Text("Update",
                  style:
                      TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold)),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        controller: _displayNameController,
                        decoration: new InputDecoration(
                          labelText: "Display Name",
                        ),
                        keyboardType: TextInputType.text),
                    RaisedButton(
                      child: Text("Update"),
                      onPressed: () async {
                        var info = UserUpdateInfo();

                        info.displayName = _displayNameController.text;
                        await state.user.updateProfile(info);
                        state.user = await _auth.currentUser();
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

