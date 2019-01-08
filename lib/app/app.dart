import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:groupleh/app/chat/chat.dart';
import 'package:groupleh/app/project/project.dart';

class App extends StatefulWidget {
  final AppState appState;

  App(this.appState);

  @override
  State<StatefulWidget> createState() => _App(appState);
}

class _App extends State<App> with WidgetsBindingObserver {
  PageController pageController;
  int _pageIndex = 0;

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
        appBar: AppBar(
          backgroundColor: Color(0xFF00C6FF),
          title: Text("GroupLeh",
              style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 36.0)),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (page) {
            pageController.animateToPage(page,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut);
          },
          items: [
            BottomNavigationBarItem(
                title: Text("Chat"), icon: Icon(Icons.chat)),
            BottomNavigationBarItem(
                title: Text("Project"), icon: Icon(Icons.book)),
            BottomNavigationBarItem(
                title: Text("Profile"), icon: Icon(Icons.person)),
            BottomNavigationBarItem(
                title: Text("Settings"), icon: Icon(Icons.settings)),
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
          children: [Chat(appState), Project()],
        ));
  }
}
