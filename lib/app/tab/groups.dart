import 'package:flutter/material.dart';
import 'package:groupleh/app/core/group.dart';
import 'package:groupleh/app/tab/groups_chat.dart';
import 'package:groupleh/app/app_state.dart';

class Groups extends StatefulWidget {
  final AppState state;

  Groups(this.state);

  @override
  State<StatefulWidget> createState() => _Groups(state);
}

class _Groups extends State<Groups> {
  final AppState state;

  List<Group> groups = [
    Group(
        1,
        "https://res.cloudinary.com/teepublic/image/private/s--gfsWHvaH--/t_Preview/b_rgb:262c3a,c_limit,f_jpg,h_630,q_90,w_630/v1493209189/production/designs/1524888_1.jpg",
        "Pink Fluffy Unicorns", []),
    Group(
        2,
        "https://res.cloudinary.com/teepublic/image/private/s--gfsWHvaH--/t_Preview/b_rgb:262c3a,c_limit,f_jpg,h_630,q_90,w_630/v1493209189/production/designs/1524888_1.jpg",
        "Pink Fluffy Unicorns", []),
    Group(
        3,
        "https://res.cloudinary.com/teepublic/image/private/s--gfsWHvaH--/t_Preview/b_rgb:262c3a,c_limit,f_jpg,h_630,q_90,w_630/v1493209189/production/designs/1524888_1.jpg",
        "Pink Fluffy Unicorns", [])
  ];

  _Groups(this.state);

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
