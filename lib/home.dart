import 'package:flutter/material.dart';

class  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(fontFamily:'quicksand'),
      title: 'Home Page',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welome Home',)
          ),
        body: Center(
        child: Text('Welcome to Home')
      ),
    ),
    );
  }
}
