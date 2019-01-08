import 'package:flutter/material.dart';
import 'package:groupleh/profile/model/Planet.dart';
import 'package:groupleh/profile/model/Planets.dart';
import 'package:groupleh/app/app_state.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;
  DetailPage(this.planet);
  
  Container _getBackground () {
    return new Container(
            child: new Image.network(planet.image,
              fit: BoxFit.cover,
              height: 300.0,
            ),
            constraints: new BoxConstraints.expand(height: 300.0),
          );
 }

  Container _getGradient() {
    return new Container(
       margin: new EdgeInsets.only(top: 190.0),
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
            //_getContent(),
            //_getToolbar(context),
          ],
        ),
      ),
    );
  }
}