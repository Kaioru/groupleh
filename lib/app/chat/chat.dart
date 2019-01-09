import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groupleh/app/chat/chat-listing.dart';
import 'package:groupleh/core/group.dart';
import 'package:groupleh/core/profile.dart';

class Chat extends StatefulWidget {
  final AppState appState;

  Chat(this.appState);

  @override
  State<StatefulWidget> createState() => _Chat(appState);
}

class _Chat extends State<Chat> {
  final AppState appState;

  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _Chat(this.appState) {
    reference = Firestore.instance.collection('groups').reference();
    snapshots = reference
        .where("members", arrayContains: appState.profile.id)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return FirestoreAnimatedList(
      emptyChild: Container(),
      query: snapshots,
      itemBuilder: (
        BuildContext context,
        DocumentSnapshot snapshot,
        Animation<double> animation,
        int index,
      ) {
        List<String> names = List.from(snapshot.data['members']);
        List<Profile> members = List();

        names.forEach((f) {
          members.add(Profile(name: f));
        });

        return ChatListing(appState, Group(
            id: snapshot.documentID,
            image: Image.network(snapshot.data["image"]),
            name: snapshot.data["name"],
            date: snapshot.data["date"],
            members: members));
      },
    );
  }
}
