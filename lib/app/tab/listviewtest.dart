import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
const String kTitle = 'Loop Wheel Demo';

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
      appBar: new AppBar(
        title: new Text(kTitle),
      ),
      body: new Center(
        child: new ConstrainedBox(
          constraints: BoxConstraints(
            // Set height to one line, otherwise the whole vertical space is occupied.
            maxHeight: _style.fontSize,
          ),
          child: new ListWheelScrollView.useDelegate(
            itemExtent: _style.fontSize,
            childDelegate: ListWheelChildLoopingListDelegate(
              children: const <Widget>[
                Text("Collaborative", style: Theme.of(context).textTheme.display2),
                Text("Focused", style: TextStyle(fontWeight: FontWeight.bold)),
              ]
            ),
          ),
        ),
      ),
    );
  }
}