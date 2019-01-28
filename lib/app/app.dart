import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:groupleh/app/fabappbar.dart';
import 'package:groupleh/app/chat/chat.dart';
import 'package:groupleh/app/profile/profile.dart';
import 'package:groupleh/app/project/project.dart';
import 'package:groupleh/app/matchmaking/matchmaking.dart';

class App extends StatefulWidget {
  final AppState appState;

  App(this.appState);

  @override
  State<StatefulWidget> createState() => _App(appState);
}

class _App extends State<App> with WidgetsBindingObserver, TickerProviderStateMixin {

  int _pageIndex = 0;

  PageController pageController;
  

  final AppState appState;

  _App(this.appState);

  @override
  void initState() {
    pageController = PageController(initialPage: _pageIndex);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Matchmaking(appState)));
        },
        child: Icon(Icons.search),
        backgroundColor: Color(0xFF00C6FF),
        foregroundColor: Color(0xFFFFFFFF),
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          backgroundColor: Color(0xFF00C6FF),
          title: Text("GroupLeh",
              style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 36.0)),
        ),
        bottomNavigationBar: FABBottomAppBar(
          centerItemText: "Matchmake",
          color: Color(0xFFFFFFFF),
          selectedColor: Color(0xFF00C6FF),
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: (page) {
            pageController.animateToPage(page,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut);
                },
          items: [
            FABBottomAppBarItem(iconData: Icons.chat, text: 'Chat'),
            FABBottomAppBarItem(iconData: Icons.book, text: 'Project'),
            FABBottomAppBarItem(iconData: Icons.person, text: 'Profile'),
            FABBottomAppBarItem(iconData: Icons.settings, text: 'Settings'),
          ],
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              this._pageIndex = index;
            });
          },
          children: [Chat(appState), ProjectEX(appState.profile), ProfileEX(appState.profile)],
        )
      );
  }
}
