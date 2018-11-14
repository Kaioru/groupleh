import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Matchmaking extends StatefulWidget {
  final AppState state;

  Matchmaking(this.state);

  @override
  State<StatefulWidget> createState() => _Matchmaking(state);
}

class _MatchmakingData{
  // these are the matchmaking values
  String learningStyle;
  String numberOfPeople;
  String timeOfDay;
}

class _Matchmaking extends State<Matchmaking> {
  final AppState state;
  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;
  _MatchmakingData mData = new _MatchmakingData();

  _Matchmaking(this.state);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
          body: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Matchmaking",
                  style:
                  TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold)),
              ListTile(
                leading: const Icon(Icons.book),
                title: Text("Learning Style"),
                trailing: DropdownButton<String>(

                  onChanged: (String newValue){
                    setState(() {
                      mData.learningStyle = newValue;
                    });
                  },
                  items: <String>["Collaborative", "Focused"].map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value:value,
                      child: Text(value),
                    );
                  }).toList()
                ),
              ),ListTile(
                leading: const Icon(Icons.group_work),
                title: Text("Preferred number of people"),
                trailing: DropdownButton<String>(

                  onChanged: (String newValue){
                    setState(() {
                      mData.numberOfPeople = newValue;
                    });
                  },
                  items: <String>["3-4", "5-6"].map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value:value,
                      child: Text(value),
                    );
                  }).toList()
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text("Preferred time of day"),
                trailing: DropdownButton(
                  onChanged: (String newValue){
                    setState(() {
                      mData.timeOfDay = newValue;
                    });
                  },
                  items: <String>["Morning", "Afternoon", "Evening", "Night"].map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value:value,
                      child: Text(value),
                    );
                  }).toList()
                )
              ), 
              RaisedButton(
                child: Text("Let's go!"),
                onPressed: () {},
              )
            ],
          )
      )
    );
  }
}
