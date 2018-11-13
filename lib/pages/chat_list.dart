import 'package:flutter/material.dart';
import 'chat_message.dart';
import '../core/Chat_Model.dart';

class GroupChatList extends StatefulWidget {
  @override
  _GroupChatListState createState() => _GroupChatListState();
}

class _GroupChatListState extends State<GroupChatList> {
  final List<ChatModel> dan = dummyUsers;
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dan.length,
      itemBuilder: (context, i) => new Column(
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              new ListTile(
                leading: new CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: new NetworkImage(dan[i].avatarUrl),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      dan[i].name,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      dan[i].time,
                      style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                    
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    dan[i].name,
                    style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
                onTap: (){
                }
              )
            ],
          ),
    );
  }
}
