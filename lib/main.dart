import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "ListView",
    home: Scaffold(
      appBar: AppBar(title: Text("Long List View"),),
      body: getListView()
    ),
  ));
}

// Long List View
List<String> getListElements() {
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}

Widget getListView() {
  var listItems = getListElements();

  var listView = ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.group),
          title: Text(listItems[index]),
          onTap: () {
            debugPrint('${listItems[index]} was tapped');
          },
        );
      }
  );

  return listView;
}


// Normal List View
/* Widget getListView() {
  var listView = ListView(
    children: <Widget>[

      ListTile(
        leading: Icon(Icons. landscape),
        title: Text("Group Name #1"),
        subtitle: Text("Text goes into here"),
        trailing: Icon(Icons.wb_sunny),
        // onTap: (),
      ),

      ListTile(
        leading: Icon(Icons. laptop_chromebook),
        title: Text("Windows"),
      ),

      ListTile(
        leading: Icon(Icons. phone),
        title: Text("Phone"),
      )
    ],
  );

  return listView;
  */
