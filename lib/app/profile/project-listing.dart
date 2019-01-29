import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:groupleh/app/chat/chat-room.dart';
import 'package:groupleh/app/component/gl_row.dart';
import 'package:groupleh/app/profile/project-detail.dart';
import 'package:groupleh/core/group.dart';
import 'package:groupleh/core/profile.dart';
import 'package:groupleh/core/project.dart';
import 'package:intl/intl.dart';

class ProjectListing extends StatelessWidget {
  final Profile profile;
  final Project project;

  ProjectListing(this.profile, this.project);

  @override
  Widget build(BuildContext context) {
    var poop = <Widget>[
      Icon(Icons.people, size: 12.0),
      Container(width: 8.0),
      Text(project.members.length.toString()),
      SizedBox(width: 12.0),
      Icon(Icons.check, size: 12.0),
      Container(width: 8.0),
      Text(project.applicants.length.toString())
    ];

    if (project.leader == profile.id) {
      poop.add(SizedBox(width: 12.0));
      poop.add(Icon(Icons.star, size: 12.0));
    }

    return GestureDetector(
      onTap: () {
        if (project.leader == profile.id) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProjectDetail(profile, project)));
        }
      },
      child: GLRow(
        image: Image.network(project.image),
        title: project.name,
        desc: project.desc,
        more: Row(
          children: poop,
        ),
      ),
    );
  }
}
