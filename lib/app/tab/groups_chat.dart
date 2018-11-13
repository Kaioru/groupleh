import 'package:flutter/material.dart';
import 'package:groupleh/app/core/group.dart';

class GroupsChat extends StatefulWidget {
  final Group group;

  GroupsChat(this.group);

  @override
  State<StatefulWidget> createState() => _GroupsChat(group);
}

class _GroupsChat extends State<GroupsChat> {
  final Group group;

  _GroupsChat(this.group);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ListTile(
        leading: CircleAvatar(
          foregroundColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(group.image),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              group.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
    );
  }
}
