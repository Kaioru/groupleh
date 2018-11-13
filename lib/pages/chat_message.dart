import 'dart:io';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'chat_message_list.dart';
import 'package:image_picker/image_picker.dart';

final googleSignIn = new GoogleSignIn();
final analytics = new FirebaseAnalytics();


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
            //_scaffoldContext = context;
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
                  File imageFile = await ImagePicker.pickImage();
                  int timestamp = new DateTime.now().millisecondsSinceEpoch;
                  StorageReference storageReference = FirebaseStorage
                      .instance
                      .ref()
                      .child("img_" + timestamp.toString() + ".jpg");
                  StorageUploadTask uploadTask = 
                      storageReference.putFile(imageFile);
                  Uri downloadUrl = (await uploadTask.onComplete).uploadSessionUri;
                  _sendMessage(
                    messageText: null, imageUrl: downloadUrl.toString()
                  );
                })
            ),
            Flexible(
              child:TextField(
                controller: _textEditingController,
                onChanged: (String messageText){
                  setState(() {
                    _isComposingMessage = messageText.length > 0;
                  });
                },
                onSubmitted: _textMessageSubmitted,
                decoration: InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Theme.of(context).platform == TargetPlatform.iOS
              ? getIOSSendButton()
              : getDefaultSendButton()
            )
          ],
        )
      )
    );
  }

  CupertinoButton getIOSSendButton(){
    return new CupertinoButton(
      child: Text("Send"),
      onPressed: _isComposingMessage
      ? () => _textMessageSubmitted(_textEditingController.text)
      : null,
    );
  }

  IconButton getDefaultSendButton(){
    return IconButton(
      icon: Icon(Icons.send),
      onPressed: _isComposingMessage
      ? () => _textMessageSubmitted(_textEditingController.text)
      : null,
    );
  }

  void _sendMessage({String messageText, String imageUrl}){
    reference.push().set({
      'text': messageText,
      'email': 'testtest@example.com',
      'imageUrl': imageUrl,
      'senderName': 'jon',
      'senderPhotoUrl': '',
    });

    analytics.logEvent(name: 'send_message');
  }

  Future<Null> _textMessageSubmitted(String text) async{
    _textEditingController.clear();

    setState(() {
      _isComposingMessage = false;
    });

    _sendMessage(messageText: text, imageUrl: null);
  }  
}