import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

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
                      child: Text("Upload image"),
                      onPressed: () async {
                        var file = await ImagePicker.pickImage(
                            source: ImageSource.gallery);
                        StorageReference ref = FirebaseStorage.instance
                            .ref()
                            .child(state.user.uid)
                            .child("image.jpg");
                        StorageUploadTask uploadTask = ref.putFile(file);
                        var info = UserUpdateInfo();

                        info.photoUrl = await (await uploadTask.onComplete)
                            .ref
                            .getDownloadURL();
                        await state.user.updateProfile(info);
                        state.user = await _auth.currentUser();
                        Navigator.pop(context);
                      },
                    ),
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

