import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:groupleh/app/chat/chat-room.dart';
import 'package:groupleh/app/component/gl_row.dart';
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
    return GestureDetector(
      onTap: () => {},
      child: GLRow(
        image: Image.network(project.image),
        title: project.name,
        desc: project.desc,
        more: Row(
          children: <Widget>[
            Icon(Icons.people, size: 12.0),
            Container(width: 8.0),
            Text(project.members.length.toString()),
            SizedBox(width: 12.0),
            Icon(Icons.check, size: 12.0),
            Container(width: 8.0),
            Text(project.applicants.length.toString())
          ],
        ),
      ),
    );
  }
}