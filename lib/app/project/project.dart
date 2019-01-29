import 'package:flutter/material.dart';
import 'package:groupleh/app/component/lifted/index.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Text("Edit Profile",
                  style:
                      TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold)),
              Form(
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      leading: const Icon(Icons.person),
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "Display Name",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.book),
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "Overview",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.lock),
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "Password",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.phone),
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "Phone",
                        ),
                      ),
                    ),
                    RaisedButton(
                      child: Text("Change Background Picture"),
                      onPressed: () async {
                        // var file = await ImagePicker.pickImage(
                        //     source: ImageSource.gallery);
                        // StorageReference ref = FirebaseStorage.instance
                        //     .ref()
                        //     .child(state.user.uid)
                        //     .child("image.jpg");
                        // StorageUploadTask uploadTask = ref.putFile(file);
                        // var info = UserUpdateInfo();

                        // info.photoUrl = await (await uploadTask.onComplete)
                        //     .ref
                        //     .getDownloadURL();
                        // await state.user.updateProfile(info);
                        // state.user = await _auth.currentUser();
                        // Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      );
  }
}