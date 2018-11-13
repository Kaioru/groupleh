import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

var currentUserEmail;

class ChatMessageListItem extends StatelessWidget {
  final DataSnapshot messageSnapshot;
  final Animation animation;

  ChatMessageListItem({this.messageSnapshot, this.animation});

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: CurvedAnimation(parent:animation, curve: Curves.decelerate),
      child: Container(
        child: Row(),
      ),
    );
  }

  List<Widget> getSentMessageLayout(){
    return <Widget>[
      Expanded(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(messageSnapshot.value['senderName'],
            style: TextStyle(
              fontSize:14.0,
              color:Colors.black,
              fontWeight: FontWeight.bold
              )
            ),
            Container(
            //margin: const EdgeInsets.only(top: 5.0),
            child: messageSnapshot.value['imageUrl'] != null
            ? new Image.network(
              messageSnapshot.value['imageUrl'],
              width:250.0,
            )
            : Text(messageSnapshot.value['text']),
            ),
          ],
        ),
      ),
      Column(
        children: <Widget>[
          Container(
            //margin: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              backgroundImage: 
              new NetworkImage("https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png"),
            ))
        ],
      )
    ];
  }

  List<Widget> getReceivedMessageLayout(){
    return <Widget>[
      Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            // margin const EdgeInsets.only(right:8.0),
            child: CircleAvatar(
              backgroundImage: 
              NetworkImage("https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png"),
            ),
          ),
        ],
      ),
      Expanded(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(messageSnapshot.value['senderName'],
            style: TextStyle(
              fontSize:14.0,
              color: Colors.black,
              fontWeight: FontWeight.bold
            )),
            Container(
              //margin: const EdgeInsets.only(top:5.0),
              child: messageSnapshot.value['imageUrl'] != null
              ? new Image.network(
                messageSnapshot.value['imageUrl'],
                width: 250.0,
              )
              : Text(messageSnapshot.value['text'])
            )
          ],
        )
      )
    ];
  }
}

