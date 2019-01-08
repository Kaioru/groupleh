import 'package:flutter/material.dart';
import 'package:groupleh/app/app_state.dart';

class App extends StatefulWidget {
  final AppState state;

  App(this.state);

  @override
  State<StatefulWidget> createState() => _App(state);
}

class _App extends State<App> with WidgetsBindingObserver {
  final AppState state;
  PageController pageController;
  int _pageIndex = 0;

  _App(this.state);

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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (page) {
            pageController.animateToPage(page,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut);
          },
          items: [
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
          children: [
          ],
        ));
  }
}
