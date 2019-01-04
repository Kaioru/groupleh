import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';

const List<String> learningStyle = ["Collaborative", "Focused"];

class LoopWheel extends StatefulWidget {
  final AppState state;

  LoopWheel(this.state);
  @override
  State<StatefulWidget> createState() => _LoopWheel(state);
}


class _LoopWheel extends State<LoopWheel> {
  final AppState state;
  _LoopWheel(this.state);

  @override
  Widget build(BuildContext context) {
    final _style = Theme.of(context).textTheme.display2;
    return new Scaffold(
      body: Container(
        child:new Center(
          child: new ConstrainedBox(
            constraints: BoxConstraints(
              // Set height to one line, otherwise the whole vertical space is occupied.
              maxHeight: _style.fontSize,
            ),
            child: new ListWheelScrollView.useDelegate(
              itemExtent: _style.fontSize,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List<Widget>.generate(
                10, (index) => Text('${index + 1}', style: _style),
                ),
              ),
            ),
          ),
        ),
      )
    );

  }

//  Widget ListBuildLS(){
//    final _style = Theme
//        .of(context)
//        .textTheme
//        .display2;
//    new Center(
//      child: new ConstrainedBox(
//        constraints: BoxConstraints(
//          // Set height to one line, otherwise the whole vertical space is occupied.
//          maxHeight: _style.fontSize,
//        ),
//        child: new ListWheelScrollView.useDelegate(
//          itemExtent: _style.fontSize,
//          childDelegate: ListWheelChildLoopingListDelegate(
//            children: <Widget>[
//              Text("Collaborative", style:TextStyle(fontWeight: FontWeight.bold)),
//              Text("Focused", style:TextStyle(fontWeight: FontWeight.bold)),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
}