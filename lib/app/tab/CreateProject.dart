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

