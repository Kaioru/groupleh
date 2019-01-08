import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';


class LoopWheel extends StatefulWidget {
  final AppState state;

  LoopWheel(this.state);
  @override
  State<StatefulWidget> createState() => _LoopWheel(state);
}

class _LoopWheel extends State<LoopWheel> {
  FixedExtentScrollController fixedExtentScrollController;
  final AppState state;
  _LoopWheel(this.state);
  @override
  Widget build(BuildContext context) {
    final _style = Theme.of(context).textTheme.display2;  
    return new Scaffold(
      body: Center(
        child:Container(
          height: _style.fontSize,
            child:Row(
              children: <Widget>[
                _scrollLearningStyle(),
                _scrollNumberOfPeople(),
                _scrollTimeOfDay(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _scrollLearningStyle(){
    return Expanded(
      flex:4,
      child: Container(
        child: new ListWheelScrollView.useDelegate(
      
          physics: FixedExtentScrollPhysics(),
          itemExtent: _style.fontSize,
          childDelegate: ListWheelChildLoopingListDelegate(
            children: const <Widget>[
              Text("Collaborative", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Focused", style: TextStyle(fontWeight: FontWeight.bold)),
            ]
          ),
        ),
      )
    );
  }

  Widget _scrollNumberOfPeople(){
    return Expanded(
      flex:2,
      child: Container(
        child: new ListWheelScrollView.useDelegate(
      
          physics: FixedExtentScrollPhysics(),
          itemExtent: _style.fontSize,
          childDelegate: ListWheelChildLoopingListDelegate(
            children: const <Widget>[
              Text("3-4", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("5-6", style: TextStyle(fontWeight: FontWeight.bold)),
            ]
          ),
        ),
      )
    );
  }

  Widget _scrollTimeOfDay(){
    return Expanded(        
      flex:4,
      child: Container(
        child: new ListWheelScrollView.useDelegate(
          physics: FixedExtentScrollPhysics(),
          itemExtent: _style.fontSize,
          childDelegate: ListWheelChildLoopingListDelegate(
            children: const <Widget>[
              Text("Morning", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Night", style: TextStyle(fontWeight: FontWeight.bold)),
            ]
          ),
        ),
      )
    );
  }
}