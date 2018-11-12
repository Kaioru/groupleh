import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_message_list.dart';
import 'package:image_picker'

var _scaffoldContext;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();
  bool _isComposingMessage = false;
  final reference = FirebaseDatabase.instance.reference().child('message');

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat Room"),
      ),
      body: new Container(
        child: new Column(children: <Widget>[
          new Flexible(
            child: new FirebaseAnimatedList(
              query: reference,
              reverse: true,
              // comparing timestamp of messages 
              sort: (a, b) => b.key.compareTo(a.key),
              itemBuilder: (_, DataSnapshot messageSnapshot,
              Animation<double> animation, int x){
                return new ChatMessageListItem(
                  messageSnapshot: messageSnapshot,
                  animation: animation,
                );
              },
            )
          ),
          Divider(height:1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
          Builder(builder: (BuildContext context){
            _scaffoldContext = context;
            return new Container(width: 0.0, height: 0.0);
          })
        ],)
      )
    );
  }

  Widget _buildTextComposer(){
    return new IconTheme(
      data: IconThemeData(
        color: _isComposingMessage
        ? Theme.of(context).accentColor
        : Theme.of(context).disabledColor,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal:8.0),
        child: Row(
          children: <Widget>[
            Container(
              margin: new EdgeInsets.symmetric(horizontal:4.0),
              child: IconButton(
                icon: Icon(
                  Icons.photo_camera,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () async {
                  File imageFile = await ImagePick
                }
              )
            )
          ],
        )
      )
    )
  }


}