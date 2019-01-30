import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';

class Matchmaking extends StatefulWidget {
  final AppState state;

  Matchmaking(this.state);
  @override
  State<StatefulWidget> createState() => _Matchmaking(state);
}

class _Matchmaking extends State<Matchmaking> {
  FixedExtentScrollController fixedExtentScrollController;
  PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1.0);
  final AppState state;
  _Matchmaking(this.state);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            learningStylePage(),
            numberPage(),
            timeOfDayPage(),
          ],
        ));
  }

  Widget learningStylePage() {
    final _style = Theme.of(context).textTheme.display2;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text("Matchmaking",
                        style: TextStyle(
                            color: ThemeState.theme == ThemeData.dark()
                                ? Color(0xFFFFFFFF)
                                : Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 45.0)),
                    Text(
                        "A simple 3 step process to finding your dream partner!!",
                        style: TextStyle(
                            color: ThemeState.theme == ThemeData.dark()
                                ? Color(0xFFFFFFFF)
                                : Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 12.0))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: Text("Step 1: Learning style?",
                          style: TextStyle(fontSize: 30)),
                    ),
                    Container(
                      height: _style.fontSize,
                      child: _scrollLearningStyle(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                    alignment: FractionalOffset(1, 1),
                    child: buildPlatformSpecificHome()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget numberPage() {
    final _style = Theme.of(context).textTheme.display2;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 40.0),
                child: Column(
                  children: <Widget>[
                    Text("Almost there!!",
                        style: TextStyle(
                            color: ThemeState.theme == ThemeData.dark()
                                ? Color(0xFFFFFFFF)
                                : Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 45.0)),
                    Text("We don't allow groups of 2 cus yall be dating",
                        style: TextStyle(
                            color: ThemeState.theme == ThemeData.dark()
                                ? Color(0xFFFFFFFF)
                                : Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 12.0))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: Text("Step 2: How many?",
                          style: TextStyle(fontSize: 30)),
                    ),
                    Container(
                      height: _style.fontSize,
                      child: _scrollNumberOfPeople(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset(1, 1),
                  child: ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: RaisedButton(
                            child: Icon(Icons.arrow_back,
                                color: Color(0xFF303030)),
                            onPressed: () {
                              gotoStyle();
                            },
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: RaisedButton(
                              child: Icon(Icons.arrow_forward,
                                  color: Color(0xFF303030)),
                              onPressed: () {
                                gotoTime();
                              },
                              color: Color(0xFF00C6FF)),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget timeOfDayPage() {
    final _style = Theme.of(context).textTheme.display2;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 40.0),
                child: Column(
                  children: <Widget>[
                    Text("Finish!",
                        style: TextStyle(
                            color: ThemeState.theme == ThemeData.dark()
                                ? Color(0xFFFFFFFF)
                                : Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 45.0)),
                    Text("Good timing = great times",
                        style: TextStyle(
                            color: ThemeState.theme == ThemeData.dark()
                                ? Color(0xFFFFFFFF)
                                : Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 12.0))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child:
                          Text("Step 3: When?", style: TextStyle(fontSize: 30)),
                    ),
                    Container(
                      height: _style.fontSize,
                      child: _scrollTimeOfDay(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset(1, 1),
                  child:
                      ButtonBar(alignment: MainAxisAlignment.center, children: <
                          Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: RaisedButton(
                        child: Icon(Icons.arrow_back, color: Color(0xFF303030)),
                        onPressed: () {
                          gotoGroups();
                        },
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: RaisedButton(
                          child: Icon(Icons.check, color: Color(0xFF303030)),
                          // insert firebase configs here
                          onPressed: () {},
                          color: Color(0xFF00C6FF)),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlatformSpecificHome() {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: RaisedButton(
            child: Icon(Icons.remove_circle, color: Color(0xFF303030)),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: RaisedButton(
              child: Icon(Icons.arrow_forward, color: Color(0xFF303030)),
              onPressed: () {
                gotoGroups();
              },
              color: Color(0xFF00C6FF)),
        ),
      ]);
    } else {
      return ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
        SizedBox(
          width: 2 * (MediaQuery.of(context).size.width / 3),
          child: RaisedButton(
              child: Icon(Icons.arrow_forward, color: Color(0xFF303030)),
              onPressed: () {
                gotoGroups();
              },
              color: Color(0xFF00C6FF)),
        ),
      ]);
    }
  }

  Widget _scrollLearningStyle() {
    final _style = Theme.of(context).textTheme.display2;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: Alignment.topRight,
              child: Text("I am",
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 135),
            child: ListWheelScrollView.useDelegate(
              physics: FixedExtentScrollPhysics(),
              itemExtent: _style.fontSize,
              childDelegate:
                  ListWheelChildLoopingListDelegate(children: const <Widget>[
                Text("Collaborative",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Text("Focused",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _scrollNumberOfPeople() {
    final _style = Theme.of(context).textTheme.display2;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: Alignment.topRight,
              child: Text("Groups of",
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 50),
            child: ListWheelScrollView.useDelegate(
              physics: FixedExtentScrollPhysics(),
              itemExtent: _style.fontSize,
              childDelegate:
                  ListWheelChildLoopingListDelegate(children: const <Widget>[
                Text("3-4",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Text("5-6",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _scrollTimeOfDay() {
    final _style = Theme.of(context).textTheme.display2;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: Alignment.topRight,
              child: Text("I prefer",
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 100),
            child: ListWheelScrollView.useDelegate(
              physics: FixedExtentScrollPhysics(),
              itemExtent: _style.fontSize,
              childDelegate:
                  ListWheelChildLoopingListDelegate(children: const <Widget>[
                Text("7am-1pm",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Text("5pm-9pm",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  gotoStyle() {
    //controller_0To1.forward(from: 0.0);
    _pageController.animateToPage(
      0,
      duration: Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }

  gotoGroups() {
    //controller_0To1.forward(from: 0.0);
    _pageController.animateToPage(
      1,
      duration: Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }

  gotoTime() {
    //controller_0To1.forward(from: 0.0);
    _pageController.animateToPage(
      2,
      duration: Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }
}
