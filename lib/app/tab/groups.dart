import 'package:flutter/material.dart';
import 'package:groupleh/app/core/group.dart';
import 'package:groupleh/app/tab/groups_chat.dart';
import 'package:groupleh/app/app_state.dart';

class Groups extends StatefulWidget {
  final AppState state;
  final PageController pageController;

  Groups(this.pageController, this.state);

  @override
  State<StatefulWidget> createState() => _Groups(pageController, state);
}

class _Groups extends State<Groups> {
  final AppState state;
  final PageController pageController;

  List<Group> groups = [
  ];

  _Groups(this.pageController, this.state);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: groups.isEmpty
            ? Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(":(",
                          style: TextStyle(
                              fontSize: 48.0, fontWeight: FontWeight.bold)),
                      Text("You do not have any groups yet."),
                      Divider(),
                      RaisedButton(
                        onPressed: () => pageController.animateToPage(2,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut),
                        child: Text('Find groups!'),
                      )
                    ]),
              )
            : Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Groups",
                        style: TextStyle(
                            fontSize: 48.0, fontWeight: FontWeight.bold)),
                    Expanded(
                        child: ListView.builder(
                            itemCount: groups.length,
                            itemBuilder: (context, i) => ListTile(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GroupsChat(state, groups[i]))),
                                  leading: CircleAvatar(
                                    foregroundColor:
                                        Theme.of(context).primaryColor,
                                    backgroundColor: Colors.grey,
                                    backgroundImage:
                                        NetworkImage(groups[i].image),
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        groups[i].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  subtitle: Container(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      groups[i].name,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                    ),
                                  ),
                                )))
                  ],
                )));
  }
}
