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
  String numberOfPeople;
  String timeOfDay;
  String preferredLearningStyle;
  String gender;

  _MatchmakingData(this.numberOfPeople, this.timeOfDay, this.preferredLearningStyle, this.gender);
}

class _Matchmaking extends State<Matchmaking> {
  final AppState state;
  CollectionReference reference;
  Stream<QuerySnapshot> snapshots;
  _MatchmakingData mData = new _MatchmakingData("3-4", "Morning", "Focused", "M");

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
                leading: const Icon(Icons.group_work),
                title: Text("Preferred number of people"),
                trailing: DropdownButton<String>(
                  value: mData.numberOfPeople,
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
                title: Text("Preferred number of people"),
                trailing: DropdownButton<String>(
                    value: mData.timeOfDay,
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
                ),
              ),
              ListTile(
                leading: const Icon(Icons.merge_type),
                title: Text("Preferred learning style"),
                trailing: DropdownButton<String>(
                  value: mData.preferredLearningStyle,
                  onChanged: (String newValue){
                    setState(() {
                      mData.preferredLearningStyle = newValue;
                    });
                  },
                  items: <String>["Collaborative", "Focused"].map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value:value,
                      child: Text(value),
                    );
                  }).toList()
                )
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text("Gender"),
                trailing: DropdownButton<String>(
                  value: mData.gender,
                  onChanged: (String newValue){
                    setState(() {
                      mData.preferredLearningStyle = newValue;
                    });
                  },
                  items: <String>["M", "F"].map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value:value,
                      child: Text(value),
                    );
                  }).toList()
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  child: Text(
                    "Submit",
                  ),
                  // submit method here
                  //onPressed: this.submit
                )
              )
            ],
          )
      )
    );
  }
}
