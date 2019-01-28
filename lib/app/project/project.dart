import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/app/component/lifted/index.dart';
import 'package:groupleh/core/profile.dart';
import 'package:groupleh/core/project.dart';

class ProjectEX extends StatelessWidget {
  final Profile profile;

  ProjectEX(this.profile);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(future: Future(() async {
        var reference = Firestore.instance.collection('projects').reference();
        var documents = await reference.getDocuments();
        var result = <Project>[];
        documents.documents.forEach((d) {
          if (!d.data["applicants"].contains(profile.id) &&
              !d.data["members"].contains(profile.id)) {
            result.add(Project(
                id: d.documentID,
                name: d.data["name"],
                desc: d.data["desc"],
                image: d.data["image"]));
          }
        });
        return result;
      }), builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return CardDemo(snapshot.data);
      }),
    );
  }
}
