import 'package:flutter/material.dart';
import 'package:groupleh/app/core/project.dart';
import 'package:groupleh/app/tab/projects_detail.dart';
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
                  Expanded(
                      child: FirestoreAnimatedList(
                    query: snapshots,
                    itemBuilder: (
                      BuildContext context,
                      DocumentSnapshot snapshot,
                      Animation<double> animation,
                      int index,
                    ) {
                      return ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProjectsDetail(Project(
                                    snapshot.data["image"],
                                    snapshot.data["name"],
                                    snapshot.data["desc"])))),
                        leading: CircleAvatar(
                          foregroundColor: Theme.of(context).primaryColor,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(snapshot.data["image"]),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              snapshot.data["name"],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        subtitle: Container(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            snapshot.data["desc"],
                            style:
                                TextStyle(color: Colors.grey, fontSize: 15.0),
                          ),
                        ),
                      );
                    },
                  )),
                ])));
  }
}
