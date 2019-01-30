import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "About us",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("About us...",
                    style:
                        TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold)),
                Text(
                  "GroupLeh is a study group/buddy finder that helps you find the perfect study environment and pairs you with someone or someones with similar learning styles. It also allows students to find peer mentors or tutors of a specific field of knowledge to guide and help them with studies.",
                  style: TextStyle(fontSize: 20.0),
                ),
                const Divider(),
                Text(
                  "The team:",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Keith Toh",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Koh Bok Yan",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Daniel Dean",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Marcus Goh",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Jonaisah Sahidjuan",
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
        ));
  }
}
