import 'package:flutter/material.dart';
import 'package:groupleh/app/component/gl_row.dart';
import 'package:groupleh/core/achievement.dart';
import 'package:intl/intl.dart';

class AchievementListing extends StatelessWidget {
  final Achievement achievement;

  AchievementListing(this.achievement);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GLRow(
          image: Image.asset("assets/images/icon_trophy.png"),
          title: achievement.name,
          desc: achievement.desc +
              "\r\n\r\n" +
              "Received on " +
              DateFormat('yyyy-MM-dd').format(achievement.date)),
    );
  }
}
