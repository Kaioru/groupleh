import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/core/profile.dart';

class ProfileEdit extends StatefulWidget {
  final Profile profile;
  ProfileEdit(this.profile);

  @override
  State<StatefulWidget> createState() => _ProfileEdit(profile);

}

class _ProfileEdit extends State<ProfileEdit> {
  final Profile profile;
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  _ProfileEdit(this.profile) {
    _nameController.text = profile.name;
    _descController.text = profile.desc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            title: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Edit Profile",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, //either this or just put it to .start, i can't tell which is better and i don't know how to add padding
              children: <Widget>[
                Text("Edit Profile",
                    style:
                        TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold)),
                Form(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Display Name",
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.cloud),
                        title: TextField(
                          controller: _descController,
                          decoration: InputDecoration(
                            hintText: "Overview",
                          ),
                        ),
                      ),
                      RaisedButton(
                          child: Text("Save"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.lightGreen,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 80.0,
                          ),
                          onPressed: () async {
                            profile.name = _nameController.text;
                            profile.desc = _descController.text;

                            await Firestore.instance
                                .collection("profiles")
                                .document(profile.id)
                                .updateData({
                              "name": profile.name,
                              "desc": profile.desc
                            });
                            Navigator.pop(context);
                            // Navigator.pushReplacement(context,
                            //     MaterialPageRoute(builder: (context) => Login()));
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
