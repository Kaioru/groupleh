import 'package:flutter/material.dart';
import 'package:collection/collection.dart' show lowerBound;
enum LeaveBehindDemoAction {
  reset,
  horizontalSwipe,
  leftSwipe,
  rightSwipe
}

void main() {
  runApp(new MyApp());
}

class LeaveBehindItem implements Comparable<LeaveBehindItem> {
  LeaveBehindItem({ this.index, this.name, this.subject, this.body });

  LeaveBehindItem.from(LeaveBehindItem item)
      : index = item.index, name = item.name, subject = item.subject, body = item.body;

  final int index;
  final String name;
  final String subject;
  final String body;

  @override
  int compareTo(LeaveBehindItem other) => index.compareTo(other.index);
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'GroupLeh Create Project',
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.red),
      home: new MyHomePage(title: 'Create Project'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DismissDirection _dismissDirection = DismissDirection.horizontal;
  List<LeaveBehindItem> leaveBehindItems;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  void initListItems() {
    leaveBehindItems = new List<LeaveBehindItem>.generate(16, (int index) {
      return new LeaveBehindItem(
          index: index,
          name: 'Item $index Sender',
          subject: 'Subject: $index',
          body: "[$index] first line of the message's body..."
      );
    });
  }

  @override
  void initState() {
    super.initState();
    initListItems();
  }

  void _switchView(value) {}


  void handleDemoAction(LeaveBehindDemoAction action) {
    switch (action) {
      case LeaveBehindDemoAction.reset:
        initListItems();
        break;
      case LeaveBehindDemoAction.horizontalSwipe:
        _dismissDirection = DismissDirection.horizontal;
        break;
      case LeaveBehindDemoAction.leftSwipe:
        _dismissDirection = DismissDirection.endToStart;
        break;
      case LeaveBehindDemoAction.rightSwipe:
        _dismissDirection = DismissDirection.startToEnd;
        break;
    }
  }
  void handleUndo(LeaveBehindItem item) {
    final int insertionIndex = lowerBound(leaveBehindItems, item);
    setState(() {
      leaveBehindItems.insert(insertionIndex, item);
    });
  }

  Widget buildItem(LeaveBehindItem item) {
    final ThemeData theme = Theme.of(context);
    return new Dismissible(
        key: new ObjectKey(item),
    direction: _dismissDirection,
    onDismissed: (DismissDirection direction) {
    setState(() {
    leaveBehindItems.remove(item);
    });
    final String action = (direction == DismissDirection.endToStart) ? 'archived' : 'deleted';
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
    content: new Text('You $action item ${item.index}'),
    action: new SnackBarAction(
    label: 'UNDO',
    onPressed: () { handleUndo(item); }
    )
    ));
    },
    background: new Container(
    color: Colors.green,
    child: const ListTile(
    leading: const Icon(Icons.done, color: Colors.white, size: 36.0)
    )
    ),
    secondaryBackground: new Container(
    color: Colors.orange,
    child: const ListTile(
    trailing: const Icon(Icons.query_builder, color: Colors.white, size: 36.0)
    )
    ),
        child: new Container(
            decoration: new BoxDecoration(
                color: theme.canvasColor,
                border: new Border(bottom: new BorderSide(color: theme.dividerColor))
            ),
            child: new ListTile(
                leading: new CircleAvatar(
                  child: new Text("M"),
                  radius: 100.0,
                ),
                title: new Text(item.name),
                subtitle: new Text('${item.subject}\n${item.body}'),
                isThreeLine: true
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        title: new Text(widget.title),
    actions: <Widget>[
    new Switch(
    value: false,
    onChanged: _switchView,
    inactiveThumbColor: Colors.blue,
    activeColor: Colors.white,
    inactiveThumbImage: new AssetImage("assets/unpin.png"),
    activeThumbImage: new AssetImage("assets/pin.png"),
    ),
    new IconButton(
    icon: new Icon(Icons.search),
    onPressed: _incrementCounter,
    color: Colors.white)
    ],
    ),
    drawer: new Drawer(
    child: new Column(children: <Widget>[new Expanded(child: new ListView(
    children: <Widget>[
    new UserAccountsDrawerHeader(
    accountName: const Text('Zach Widget'),
    accountEmail: const Text('zach.widget@example.com'),
    ),
