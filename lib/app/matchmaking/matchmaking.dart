import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';

class Matchmaking extends StatefulWidget {
  final AppState state;

  Matchmaking(this.state);
  @override
  State<StatefulWidget> createState() => _Matchmaking(state);
}

class _Matchmaking extends State<Matchmaking> {
  FixedExtentScrollController fixedExtentScrollController;
  final AppState state;
  _Matchmaking(this.state);
  @override
  Widget build(BuildContext context) {
    final _style = Theme.of(context).textTheme.display2;  
    return new Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top:40.0),
                child: Column(
                  children: <Widget>[
                    Text("Matchmaking", 
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 45.0)
                    ),

                    Text("A simple 3 step process to finding your dream partner!!",
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'Poppins',
                      fontSize:12.0)
                    )
                  ],
                ),
              ),
              Container(
                padding:EdgeInsets.only(top:30.0, bottom:20.0),
                child: Text("Step 1: Learning style?", style: TextStyle(fontSize: 30)),
              ),
          
              Container(
              height: _style.fontSize,
                child: _scrollLearningStyle(),
              ),

              Container(
                padding:EdgeInsets.only(top:30.0, bottom:20.0),
                child: Text("Step 2: How many?", style: TextStyle(fontSize: 30)),
              ),
          
              Container(
              height: _style.fontSize,
                child: _scrollNumberOfPeople(),
              ),

              Container(
                padding:EdgeInsets.only(top:30.0, bottom:20.0),
                child: Text("Step 3: When?", style: TextStyle(fontSize: 30)),
              ),
          
              Container(
              height: _style.fontSize,
                child: _scrollTimeOfDay(),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset(1, 1),
                  child: buildPlatformSpecific()
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlatformSpecific(){
    if(Theme.of(context).platform == TargetPlatform.iOS){
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox( 
            width: MediaQuery.of(context).size.width / 3,
            child: RaisedButton(
              child: Icon(Icons.remove_circle, color: Color(0xFF303030)),
              onPressed: (){ Navigator.pop(context);},
              color: Colors.white,
            ),
          ),
          SizedBox(
            width:MediaQuery.of(context).size.width / 3,
            child: RaisedButton(
              child: Icon(Icons.check_circle, color: Color(0xFF303030)),
              onPressed: (){},
              color: Color(0xFF00C6FF)
            ),
          ),
        ]
      );
    }
    else{
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width:2 * (MediaQuery.of(context).size.width / 3),
            child: RaisedButton(
              child: Icon(Icons.check_circle, color: Color(0xFF303030)),
              onPressed: (){},
              color: Color(0xFF00C6FF)
            ),
          ),
        ]
      );
    }
  }

  Widget _scrollLearningStyle(){
    final _style = Theme.of(context).textTheme.display2; 
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Text("I am", style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 135),
            child: ListWheelScrollView.useDelegate(
              physics: FixedExtentScrollPhysics(),
              itemExtent: _style.fontSize,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: const <Widget>[
                  Text("Collaborative", style: TextStyle(fontWeight: FontWeight.bold, fontSize:20.0)),
                  Text("Focused", style: TextStyle(fontWeight: FontWeight.bold, fontSize:20.0)),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _scrollNumberOfPeople(){
    final _style = Theme.of(context).textTheme.display2; 
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Text("Groups of", style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 50),
            child: ListWheelScrollView.useDelegate(
              physics: FixedExtentScrollPhysics(),
              itemExtent: _style.fontSize,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: const <Widget>[
                  Text("3-4", style: TextStyle(fontWeight: FontWeight.bold, fontSize:20.0)),
                  Text("5-6", style: TextStyle(fontWeight: FontWeight.bold, fontSize:20.0)),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _scrollTimeOfDay(){
    final _style = Theme.of(context).textTheme.display2; 
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Text("I prefer", style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 100),
            child: ListWheelScrollView.useDelegate(
              physics: FixedExtentScrollPhysics(),
              itemExtent: _style.fontSize,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: const <Widget>[
                  Text("7am-1pm", style: TextStyle(fontWeight: FontWeight.bold, fontSize:20.0)),
                  Text("5pm-9pm", style: TextStyle(fontWeight: FontWeight.bold, fontSize:20.0)),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}