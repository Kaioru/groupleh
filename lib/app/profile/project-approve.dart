import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/app/component/gl_row.dart';
import 'package:groupleh/core/profile.dart';
import 'package:groupleh/core/project.dart';

class ProjectApprove extends StatefulWidget {
  final Profile profile;
  final Project project;

  ProjectApprove(this.profile, this.project);

  @override
  State<StatefulWidget> createState() => _ProjectApprove(profile, project);
}

class _ProjectApprove extends State<ProjectApprove> {
  final Profile profile;
  final Project project;

  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _ProjectApprove(this.profile, this.project) {
    reference = Firestore.instance.collection('profiles').reference();
    snapshots = reference.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Projects",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
        body: FirestoreAnimatedList(
          emptyChild: Container(),
          query: snapshots,
          itemBuilder: (
            BuildContext context,
            DocumentSnapshot snapshot,
            Animation<double> animation,
            int index,
          ) {
            if (!project.applicants.contains(snapshot.documentID))
              return SizedBox();
            return GLRow(
              title: snapshot["name"],
              desc: "",
              horizontal: false,
              more: Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      project.applicants.remove(snapshot.documentID);
                      setState(() {});
                      await Firestore.instance
                          .collection("projects")
                          .document(project.id)
                          .updateData({"applicants": project.applicants});
                    },
                    child: Text("X"),
                  ),
                  FlatButton(
                    onPressed: () async {
                      project.applicants.remove(snapshot.documentID);
                      project.members.add(snapshot.documentID);
                      setState(() {});
                      await Firestore.instance
                          .collection("projects")
                          .document(project.id)
                          .updateData({
                        "applicants": project.applicants,
                        "members": project.members
                      });
                    },
                    child: Icon(Icons.check),
                  )
                ],
              ),
            );
          },
        ));
  }
}
