import 'package:flutter/material.dart';
import 'package:groupleh/profile/model/Planet.dart';
import 'package:groupleh/profile/model/Planets.dart';
import 'package:groupleh/app/app_state.dart';
//import 'package:groupleh/profile/theme.dart';
import 'package:groupleh/profile/styles.dart';
import 'package:groupleh/profile/content.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;
  DetailPage(this.planet);
  
  Container _getBackground () {
    return new Container(
            child: new Image.network("https://pbs.twimg.com/profile_images/815627823868092417/wqacfWN9_400x400.jpg",
              fit: BoxFit.cover,
              height: 300.0,
            ),
            constraints: new BoxConstraints.expand(height: 290.0),
          );
 }

  Container _getGradient() {
    return new Container(
       margin: new EdgeInsets.only(top: 200.0),
       height: 110.0,
       decoration: new BoxDecoration(
         gradient: new LinearGradient(
           colors: <Color>[
             new Color(0x00736AB7),
             new Color(0xFF736AB7)
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
       return new ListView(
         padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
         children: <Widget>[
           new PlanetSummary(planet,
             horizontal: false,
           ),
           new Container(
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_overviewTitle, style: Style.headerTextStyle),
                //new Separator(),
                new Text( planet.description , style: Style.commonTextStyle),
              ],
            ),
          ),
        ],

    );
  }

  


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack (
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            //_getToolbar(context),
          ],
        ),
      ),
    );
  }
}

