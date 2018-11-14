import 'package:flutter/material.dart';
import 'package:groupleh/app/core/group.dart';
import 'package:groupleh/app/tab/groups_chat.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';

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
  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _Groups(this.pageController, this.state) {
    reference = Firestore.instance.collection('groups').reference();
    snapshots =
        reference.where("members", arrayContains: state.user.uid).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Groups",
                    style:
                        TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold)),
                Expanded(
                    child: FirestoreAnimatedList(
                  emptyChild: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(":(",
                              style: TextStyle(
                                  fontSize: 48.0, fontWeight: FontWeight.bold)),
                          Text("You do not have any groups yet."),
                          Divider(),
                          RaisedButton(
                            onPressed: () => pageController.animateToPage(1,
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInOut),
                            child: Text('Find groups!'),
                          )
                        ]),
                  ),
                  query: snapshots,
                  itemBuilder: (
                    BuildContext context,
                    DocumentSnapshot snapshot,
                    Animation<double> animation,
                    int index,
                  ) {
                    return ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroupsChat(
                                  state,
                                  Group(
                                      snapshot.documentID,
                                      snapshot.data["image"],
                                      snapshot.data["name"], [])))),
                      leading: CircleAvatar(
                        foregroundColor: Theme.of(context).primaryColor,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(snapshot.data["image"]),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            snapshot.data["name"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Container(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          snapshot.data["name"],
                          style: TextStyle(color: Colors.grey, fontSize: 15.0),
                        ),
                      ),
                    );
                  },
                ))
              ],
            )));
  }
}
