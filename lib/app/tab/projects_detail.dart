import 'package:flutter/material.dart';
import 'package:groupleh/app/core/project.dart';

class ProjectsDetail extends StatefulWidget {
  final Project project;

  ProjectsDetail(this.project);

  @override
  State<StatefulWidget> createState() => _ProjectsDetail(project);
}

class _ProjectsDetail extends State<ProjectsDetail> {
  final Project project;

  _ProjectsDetail(this.project);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                            image: NetworkImage(project.image),
                          ))),
                  Text(
                      project.name,
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.bold))
                ])));
  }
}
