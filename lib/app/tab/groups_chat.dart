import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:groupleh/app/core/group.dart';

class GroupsChat extends StatefulWidget {
  final Group group;

  GroupsChat(this.group);

  @override
  State<StatefulWidget> createState() => _GroupsChat(group);
}

class _GroupsChat extends State<GroupsChat> {
  final TextEditingController _textController = TextEditingController();
  final Group group;
  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _GroupsChat(this.group) {
    reference = Firestore.instance.collection('messages').reference();
    snapshots = reference.where("group", isEqualTo: group.id).snapshots();
  }

  void _sendMessage(String text) {
    reference.document().setData(<String, dynamic>{
      "group": group.id,
      "text": text,
      "sender": "random sender",
      "senderImage":
          "http://bp2.blogger.com/_w1__C0VO_Os/R8mib3DUW5I/AAAAAAAAAGg/HYTOCZjg4ow/s400/1078_i3_3.jpg"
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
      body: Column(
        children: <Widget>[
          Flexible(
              child: FirestoreAnimatedList(
            query: snapshots,
            reverse: true,
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
                title: Text(snapshot.data["sender"]),
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