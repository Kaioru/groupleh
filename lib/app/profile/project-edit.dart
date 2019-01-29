import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/core/profile.dart';
import 'package:groupleh/core/project.dart';

class ProjectEdit extends StatefulWidget {
  final Profile profile;
  final Project project;

  ProjectEdit(this.profile, this.project);

  @override
  State<StatefulWidget> createState() => _ProjectEdit(profile, project);
}

class _ProjectEdit extends State<ProjectEdit> {
  final Profile profile;
  final Project project;

  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _desc2Controller = TextEditingController();

  var setting = false;

  _ProjectEdit(this.profile, this.project);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontFamily: 'Poppins');
    final headerTextStyle = textStyle.copyWith(
        color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.w600);
    
    _titleController.text = project.name;
    _descController.text = project.desc;
    _desc2Controller.text = project.desc2;
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
                child: Text("Editting project..", style: headerTextStyle),
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
                            setState(() {
                              setting = true;
                            });

                            project.name = _titleController.text;
                            project.desc = _descController.text;
                            project.desc2 = _desc2Controller.text;
                            
                            await Firestore.instance
                                .collection("projects")
                                .document(project.id)
                                .updateData({
                              "name": _titleController.text,
                              "desc": _descController.text,
                              "desc2": _desc2Controller.text,
                            });

                            Navigator.pop(context);
                          },
                          child: Text("Edit"),
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
