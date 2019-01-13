import 'package:flutter/material.dart';
import 'package:groupleh/app/component/gl_row.dart';
import 'package:groupleh/core/profile.dart';

class ProfileEX extends StatefulWidget {
  final Profile profile;

  ProfileEX(this.profile);

  @override
  State<StatefulWidget> createState() => _ProfileEX(profile);
}

class _ProfileEX extends State<ProfileEX> {
  final Profile profile;

  _ProfileEX(this.profile);

  Container _getBackground() {
    return Container(
      child: Image.network(
        "https://pbs.twimg.com/profile_images/815627823868092417/wqacfWN9_400x400.jpg",
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
    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        GLRow(
            horizontal: false,
            image: Image.network(
                "https://images.unsplash.com/photo-1535909339361-ef56e179d637?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),
            title: profile.name,
            desc: "",
            more: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/images/icon_coin.png",
                          height: 32.0, width: 32.0),
                      Container(width: 8.0),
                      Text(profile.coins.toString())
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/images/icon_trophy.png",
                          height: 32.0, width: 32.0),
                      Container(width: 8.0),
                      Text(profile.achievementCount.toString())
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/images/icon_wardrobe.png",
                          height: 32.0, width: 32.0),
                      Container(width: 8.0),
                      Text(profile.wardrobeCount.toString())
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/images/icon_scroll.png",
                          height: 32.0, width: 32.0),
                      Container(width: 8.0),
                      Text(profile.projectCount.toString())
                    ],
                  ),
                )
              ],
            )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_overviewTitle, style: headerTextStyle),
              Divider(),
              Text(profile.desc, style: regularTextStyle),
              Container(
                padding: EdgeInsets.only(top: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Actions".toUpperCase(), style: headerTextStyle),
                    Divider(),
                    GLRow(
                      image: Image.asset("assets/images/icon_scroll.png"),
                      title: "Projects",
                      desc: "All the stuff you start but never finish.",
                    ),
                    GLRow(
                      image: Image.asset("assets/images/icon_wardrobe.png"),
                      title: "Wardrobe",
                      desc: "Walk walk fashion baby. Strike a pose. Vogue.",
                    ),
                    GLRow(
                      image: Image.asset("assets/images/icon_trophy.png"),
                      title: "Achievements",
                      desc:
                          "All the achievements you've accomplished in life. In one spot.",
                    )
                  ],
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
    return Container(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          _getBackground(),
          _getGradient(),
          _getContent(),
          //_getToolbar(context),
        ],
      ),
    );
  }
}
