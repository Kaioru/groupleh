import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:groupleh/app/chat/chat-room.dart';
import 'package:groupleh/app/component/gl_row.dart';
import 'package:groupleh/core/group.dart';
import 'package:intl/intl.dart';

class ChatListing extends StatelessWidget {
  final AppState state;
  final Group group;

  ChatListing(this.state, this.group);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => ChatRoom(state, group))),
      child: GLRow(
        image: group.image,
        title: group.name,
        desc: "Created on " + DateFormat('yyyy-MM-dd').format(group.date),
        more: Row(
          children: <Widget>[
            Icon(Icons.people, size: 12.0),
            Container(width: 8.0),
            Text(group.members.length.toString())
          ],
        ),
      ),
    );
  }
}
