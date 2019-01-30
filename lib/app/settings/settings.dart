import 'package:flutter/material.dart';
import 'package:groupleh/app/component/gl_row.dart';
import 'package:groupleh/app/component/gl_row2.dart';
import 'package:groupleh/app/component/lifted/index.dart';
import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:groupleh/app/auth/login.dart';
import 'package:groupleh/app/settings/about.dart';

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

bool _value = false;

  void _onChanged(bool value){
    setState(() {
     _value = value; 
    });
  }

   void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Last Chance, no takebacks."),
          content: new Text("I mean, why go through the trouble of logging back in right?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Log Out"),
              onPressed: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
       child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                    new SwitchListTile(
                      title: Text("Dark Theme"),
                        value: _value,
                        onChanged: (bool value){_onChanged(value);},
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => About())),
                      child: GLRow2(
                        title: "About Us",
                        desc: "GroupLeh is an app made for the truly intellectual beings.",
                        horizontal: false,
                        color: 0xFF01579B,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: GLRow2(
                        title: "Edit Profile",
                        desc: "Edit the profile tings yaknow.",
                        horizontal: false,
                        color: 0xFF4527A0,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){_showDialog();},
                      child: GLRow2(
                        title: "Log Out",
                        desc: "Are you sure you want to log out of this amazing app??",
                        horizontal: false,
                        color: 0xFFC62828,
                      ),
                    ),
                ],
            )
      )
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