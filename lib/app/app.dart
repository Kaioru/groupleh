import 'package:flutter/material.dart';
import 'package:groupleh/app/tab/groups.dart';

class App extends StatefulWidget {
  App();

  @override
  State<StatefulWidget> createState() => _App();
}

class _App extends State<App> with WidgetsBindingObserver {
  int _pageIndex = 0;
  PageController _pageController;

  _App();

  @override
  void initState() {
    _pageController = PageController(initialPage: _pageIndex);
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (page) {
            _pageController.animateToPage(page,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut);
          },
          items: [
            BottomNavigationBarItem(title: Text("Groups"), icon: Icon(Icons.people)),
            BottomNavigationBarItem(title: Text("Groups"), icon: Icon(Icons.people)),
          ],
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              this._pageIndex = index;
            });
          },
          children: [Groups(), Groups()],
        ));
  }
}
