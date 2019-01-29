import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/core/profile.dart';
import 'package:image_picker/image_picker.dart';

class ProjectAdd extends StatefulWidget {
  final Profile profile;

  ProjectAdd(this.profile);

  @override
  State<StatefulWidget> createState() => _ProjectAdd(profile);
}

class _ProjectAdd extends State<ProjectAdd> {
  final Profile profile;
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _desc2Controller = TextEditingController();

  var setting = false;

  _ProjectAdd(this.profile);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontFamily: 'Poppins');
    final headerTextStyle = textStyle.copyWith(
        color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.w600);
    return Scaffold(
      appBar: AppBar(
          title: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Add Project",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
      body: setting
          ? Container(
              child: Center(
                child: Text("Creating project..", style: headerTextStyle),
              ),
            )
          : Container(
              padding: EdgeInsets.all(13.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Text("Title"),
                    TextField(
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text("Short description"),
                    TextField(
                      controller: _descController,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text("In-depth description"),
                    TextField(
                      controller: _desc2Controller,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel"),
                        ),
                        FlatButton(
                          onPressed: () async {
                            var file = await ImagePicker.pickImage(
                                source: ImageSource.gallery);
                            StorageReference ref = FirebaseStorage.instance
                                .ref()
                                .child(profile.id)
                                .child(_titleController.text + ".jpg");

                            setState(() {
                              setting = true;
                            });

                            StorageUploadTask uploadTask = ref.putFile(file);

                            await Firestore.instance
                                .collection("projects")
                                .add({
                              "name": _titleController.text,
                              "desc": _descController.text,
                              "desc2": _desc2Controller.text,
                              "image": await (await uploadTask.onComplete)
                                  .ref
                                  .getDownloadURL(),
                              "leader": profile.id,
                              "applicants": [],
                              "members": [profile.id]
                            });

                            Navigator.pop(context);
                          },
                          child: Text("Create"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
