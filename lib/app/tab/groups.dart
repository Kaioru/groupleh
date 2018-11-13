import 'package:flutter/material.dart';
import 'package:groupleh/app/core/group.dart';

class Groups extends StatefulWidget {
  Groups();

  @override
  State<StatefulWidget> createState() => _Groups();
}

class _Groups extends State<Groups> {
  List<Group> groups = [];

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
                        onPressed: () {},
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
                                  title: new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Text(
                                        groups[i].name,
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  subtitle: new Container(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: new Text(
                                      groups[i].name,
                                      style: new TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                    ),
                                  ),
                                )))
                  ],
                )));
  }
}
