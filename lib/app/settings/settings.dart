import 'package:flutter/material.dart';
import 'package:groupleh/app/component/lifted/index.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Settings extends StatefulWidget {
  final AppState state;

  Settings(this.state);

  @override
  State<StatefulWidget> createState() => _Settings(state);
}

class _Settings extends State<Settings> {
  final AppState state;
  final _auth = FirebaseAuth.instance;

  
  _Settings(this.state);

// bool _value = false;

//   void _onChanged(bool value){
//     setState(() {
//      _value = value; 
//     });
//   }

bool darkTheme = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new Container(
            padding: EdgeInsets.all(32.0),
            child: new Column(
              children: <Widget>[
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
                    ),
                ],
            ),
          ),
      ),
    theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
    );
  }
}




                  //   RaisedButton(
                  //   child: Text("Log Out"),
                  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  //   color: Colors.red,
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 10.0,
                  //       horizontal: 80.0,
                  //     ),
                  //   onPressed: () {
                  //     Navigator.pushReplacement(context,
                  //         MaterialPageRoute(builder: (context) => Login()));
                  //   }
                  // )