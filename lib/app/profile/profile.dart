import 'package:flutter/material.dart';
import 'package:groupleh/app/component/gl_row.dart';
import 'package:groupleh/app/profile/achievement.dart';
import 'package:groupleh/app/profile/wardrobe.dart';
import 'package:groupleh/core/item_directory.dart';
import 'package:groupleh/core/profile.dart';
import 'package:groupleh/app/auth/login.dart';
import 'package:groupleh/app/chat/chat.dart';
import 'package:groupleh/app/project/project.dart';

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
    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 32.0),
      children: <Widget>[
      Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:<Widget>[ 
              IconButton(
                  icon: Icon(Icons.edit),
                  iconSize: 30.0,
                  color: Colors.white,
                   onPressed: () {
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) => ProfileUpdate()));
                   }
              )
            ],
          )
        ),
        GLRow(
            horizontal: false,
            image: Image.network(profile.image),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Actions".toUpperCase(), style: headerTextStyle),
                    Divider(),
                    GLRow(
                      image: Image.asset("assets/images/icon_scroll.png"),
                      title: "Projects",
                      desc: "All the stuff you start but never finish.",
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Wardrobe(profile, ItemDirectory()))),
                      child: GLRow(
                        image: Image.asset("assets/images/icon_wardrobe.png"),
                        title: "Wardrobe",
                        desc: "Walk walk fashion baby. Strike a pose. Vogue.",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AchivementEX(profile))),
                      child: GLRow(
                        image: Image.asset("assets/images/icon_trophy.png"),
                        title: "Achievements",
                        desc:
                            "All the achievements you've accomplished in life. In one spot.",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

bool darkTheme = false;
  @override
  Widget build(BuildContext context) {
    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text("App"),
    //     ),
    //     body: Center(),
    //     drawer: Drawer(
    //       child: ListView(
    //         children: <Widget>[
    //           ListTile(
    //             title: Text("Dark Theme"),
    //             trailing: Switch(
    //               value: darkTheme,
    //               onChanged: (changed) {
    //                 setState(() {
    //                   darkTheme = changed;
    //                 });
    //               },
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    //   theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
    // );
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

