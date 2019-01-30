import 'package:flutter/material.dart';
import 'package:groupleh/app/component/gl_row.dart';
import 'package:groupleh/app/profile/project-approve.dart';
import 'package:groupleh/app/profile/project-chat.dart';
import 'package:groupleh/app/profile/project-edit.dart';
import 'package:groupleh/core/profile.dart';
import 'package:groupleh/core/project.dart';

class ProjectDetail extends StatefulWidget {
  final Profile profile;
  final Project project;

  ProjectDetail(this.profile, this.project);

  @override
  State<StatefulWidget> createState() => _ProjectDetail(profile, project);
}

class _ProjectDetail extends State<ProjectDetail> {
  final Profile profile;
  final Project project;

  _ProjectDetail(this.profile, this.project);

  Container _getBackground() {
    return Container(
      child: Image.asset(
        "assets/images/monodabsa.jpg",
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: BoxConstraints.expand(height: 290.0),
    );
  }

  Container _getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 200.0),
      height: 110.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0x00303030), Color(0xFF303030)],
          stops: [0.0, 0.7],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _getContent() {
    final textStyle = const TextStyle(fontFamily: 'Poppins');
    final headerTextStyle = textStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);
    final regularTextStyle = textStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final _overviewTitle = "Overview".toUpperCase();
    var dab = <Widget>[];

    dab.addAll([
      Text("Actions".toUpperCase(), style: headerTextStyle),
      Divider(),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProjectChat(profile, project)));
        },
        child: GLRow(
          title: "Chat",
          desc: "Chat with your mates",
        ),
      ),
    ]);

    if (profile.id == project.leader) {
      dab.addAll([
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProjectEdit(profile, project)));
          },
          child: GLRow(
            title: "Edit",
            desc: "Edit the project details",
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProjectApprove(profile, project)));
          },
          child: GLRow(
            title: "Approve",
            desc: "Approve the project applicants",
          ),
        ),
      ]);
    }

    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        GLRow(
            horizontal: false,
            image: Image.network(project.image),
            title: project.name,
            desc: project.desc,
            more: Flex(
              direction: Axis.horizontal,
              children: <Widget>[],
            )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_overviewTitle, style: headerTextStyle),
              Divider(),
              Text(project.desc2, style: regularTextStyle),
              Container(
                padding: EdgeInsets.only(top: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: dab,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                project.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: <Widget>[
              _getBackground(),
              _getGradient(),
              _getContent(),
              //_getToolbar(context),
            ],
          ),
        ));
  }
}
