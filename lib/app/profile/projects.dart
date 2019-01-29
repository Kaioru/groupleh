import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/app/profile/project-add.dart';
import 'package:groupleh/app/profile/project-listing.dart';
import 'package:groupleh/core/profile.dart';
import 'package:groupleh/core/project.dart';

class Projects extends StatelessWidget {
  final Profile profile;

  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  Projects(this.profile) {
    reference = Firestore.instance.collection('projects').reference();
    snapshots =
        reference.where("members", arrayContains: profile.id).snapshots();
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProjectAdd(profile)));
          },
          child: Icon(Icons.add),
        ),
        body: FirestoreAnimatedList(
          emptyChild: Container(),
          query: snapshots,
          itemBuilder: (
            BuildContext context,
            DocumentSnapshot snapshot,
            Animation<double> animation,
            int index,
          ) {
            List<String> members = List.from(snapshot.data['members']);
            List<String> applicants = List.from(snapshot.data['applicants']);

            return ProjectListing(
                profile,
                Project(
                    id: snapshot.documentID,
                    image: snapshot.data["image"],
                    name: snapshot.data["name"],
                    desc: snapshot.data["desc"],
                    leader: snapshot.data["leader"],
                    members: members,
                    applicants: applicants));
          },
        ));
  }
}
