import 'package:flutter/material.dart';
import 'package:groupleh/app/component/lifted/index.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileUpdate extends StatefulWidget {
  final AppState state;

  ProfileUpdate(this.state);

  @override
  State<StatefulWidget> createState() => _ProfileUpdate(state);
}

class _ProfileUpdate extends State<ProfileUpdate> {
  final AppState state;
  final _displayNameController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;

  _ProfileUpdate(this.state);

bool darkTheme = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Scaffold(
      resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,//either this or just put it to .start, i can't tell which is better and i don't know how to add padding
            children: <Widget>[
              Text("Edit Profile",
                  style:
                      TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold)),
              Form(
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      leading: const Icon(Icons.person),
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "Display Name",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.cloud),
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "Overview",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.lock),
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "Password",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.phone),
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "Phone",
                        ),
                      ),
                    ),
                    RaisedButton(
                      child: Text("Save"),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      color: Colors.lightGreen,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 80.0,
                        ),
                      onPressed: () {
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (context) => Login()));
                      }
                    ),
                    new ListTile(
                      title: Text("Dark Theme"),
                      trailing: Switch(
                        value: darkTheme,
                        onChanged: (changed) {
                          setState(() {
                            darkTheme = changed;
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
      ),
      theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
    );
    // return Scaffold(
    //   resizeToAvoidBottomPadding: false,
    //     body: SafeArea(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,//either this or just put it to .start, i can't tell which is better and i don't know how to add padding
    //         children: <Widget>[
    //           Text("Edit Profile",
    //               style:
    //                   TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold)),
    //           Form(
    //             child: new Column(
    //               children: <Widget>[
    //                 new ListTile(
    //                   leading: const Icon(Icons.person),
    //                   title: new TextField(
    //                     decoration: new InputDecoration(
    //                       hintText: "Display Name",
    //                     ),
    //                   ),
    //                 ),
    //                 new ListTile(
    //                   leading: const Icon(Icons.cloud),
    //                   title: new TextField(
    //                     decoration: new InputDecoration(
    //                       hintText: "Overview",
    //                     ),
    //                   ),
    //                 ),
    //                 new ListTile(
    //                   leading: const Icon(Icons.lock),
    //                   title: new TextField(
    //                     decoration: new InputDecoration(
    //                       hintText: "Password",
    //                     ),
    //                   ),
    //                 ),
    //                 new ListTile(
    //                   leading: const Icon(Icons.phone),
    //                   title: new TextField(
    //                     decoration: new InputDecoration(
    //                       hintText: "Phone",
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     )
    //   );
  }
}

