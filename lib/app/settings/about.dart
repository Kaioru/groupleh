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

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 38.0,
                  color: Colors.white,
                   onPressed: () async {
                     Navigator.pop(context);
                   }
              ),
              Text("About Us...",
                style:
                  TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold)
              ),
              Text("GroupLeh is a study group/buddy finder that helps you find the perfect study environment and pairs you with someone or someones with similar learning styles. It also allows students to find peer mentors or tutors of a specific field of knowledge to guide and help them with studies.",
                style: TextStyle(fontSize: 20.0),
              ),
              const Divider(
              ),
              Text("The team:",
                style: TextStyle(fontSize: 20.0),
              ),
              Text("Keith Toh",
                style: TextStyle(fontSize: 20.0),
              ),
              Text("Koh Bok Yan",
                style: TextStyle(fontSize: 20.0),
              ),
              Text("Daniel Dean",
                style: TextStyle(fontSize: 20.0),
              ),
              Text("Marcus Goh",
                style: TextStyle(fontSize: 20.0),
              ),
              Text("Jonaisah Sahidjuan",
                style: TextStyle(fontSize: 20.0),
              ),
              
            ],
          ),
        )
      );
  }
}
