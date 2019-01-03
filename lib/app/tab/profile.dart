import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groupleh/app/auth/login.dart';
import 'package:groupleh/app/tab/profile_update.dart';

class Profile extends StatefulWidget {
  final AppState state;

  Profile(this.state);

  @override
  State<StatefulWidget> createState() => _Profile(state);
}

class _Profile extends State<Profile> {
  final AppState state;
  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _Profile(this.state);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          image: NetworkImage(state.user.photoUrl == null
                              ? "http://bp2.blogger.com/_w1__C0VO_Os/R8mib3DUW5I/AAAAAAAAAGg/HYTOCZjg4ow/s400/1078_i3_3.jpg"
                              : state.user.photoUrl),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ]
                      )
                    ),
                Text(
                    state.user.displayName == null
                        ? state.user.email
                        : state.user.displayName,
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
                RaisedButton(
                  child: Text("Update profile"),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProfileUpdate(state)));
                  },
                ),
                RaisedButton(
                    child: Text("Log out"),
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    }),
              ]
            )
          ),
    );
  }
}

