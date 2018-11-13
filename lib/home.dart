import 'package:flutter/material.dart';
import 'pages/chat_list.dart';
import 'pages/home_screen.dart';
import 'pages/chat_message.dart';

class GroupLehHome extends StatefulWidget {
  @override
  _GroupLehHomeState createState() => _GroupLehHomeState();
}

class _GroupLehHomeState extends State<GroupLehHome> 
    with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
 
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("GroupLeh"),
        backgroundColor: Colors.green,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(text: "CHATS"),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          new Icon(Icons.more_vert)
        ],
      ),

      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new HomeScreen(),
          new ChatScreen(),
        ],
      ),
    );
  }
}