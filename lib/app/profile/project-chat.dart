import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/firestore_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/core/profile.dart';
import 'package:groupleh/core/project.dart';

class ProjectChat extends StatefulWidget {
  final Profile profile;
  final Project project;

  ProjectChat(this.profile, this.project);

  @override
  State<StatefulWidget> createState() => _ProjectChat(profile, project);
}

class _ProjectChat extends State<ProjectChat> {
  final Profile profile;
  final Project project;

  final TextEditingController _textController = TextEditingController();

  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _ProjectChat(this.profile, this.project) {
    reference = Firestore.instance.collection('messages2').reference();
    snapshots = reference.where("group", isEqualTo: project.id).snapshots();
  }
  void _sendMessage(String text) {
    reference.document().setData(<String, dynamic>{
      "group": project.id,
      "text": text,
      "senderName": profile.name,
      "senderImage": profile.image
    });
  }

  void _textMessageSubmitted() {
    var text = _textController.text;
    if (text.isEmpty) return;
    _sendMessage(text);
    _textController.clear();
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
              project.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
      body: Column(
        children: <Widget>[
          Flexible(
              child: FirestoreAnimatedList(
            query: snapshots,
            itemBuilder: (
              BuildContext context,
              DocumentSnapshot snapshot,
              Animation<double> animation,
              int index,
            ) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data["senderImage"]),
                ),
                title: Text(snapshot.data["senderName"]),
                subtitle: Text(snapshot.data["text"]),
              );
            },
          )),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: IconTheme(
                  data: IconThemeData(
                      /*color: _isComposingMessage
                      ? Theme.of(context).accentColor
                      : Theme.of(context).disabledColor,
                  */
                      color: Theme.of(context).disabledColor),
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: new EdgeInsets.symmetric(horizontal: 4.0),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.photo_camera,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  onPressed: () {})),
                          Flexible(
                            child: TextField(
                              controller: _textController,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Send a message"),
                            ),
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Theme.of(context).platform ==
                                      TargetPlatform.iOS
                                  ? CupertinoButton(
                                      child: Text("Send"),
                                      onPressed: () => _textMessageSubmitted(),
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.send),
                                      onPressed: () => _textMessageSubmitted(),
                                    ))
                        ],
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
