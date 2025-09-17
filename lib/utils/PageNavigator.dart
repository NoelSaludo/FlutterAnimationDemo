import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Pages/Home.dart';
import 'package:flutteranimationdemo/Pages/LoadingPage.dart';

class PageNavigator {
  void goTo(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(_createRoute(page));
  }

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void goToHome(BuildContext context) {
    Navigator.pop(context);
    MyHomePage mhp = MyHomePage(title: "Home Page");
    LoadingPage lp = LoadingPage(PageToLoad: mhp);

    // Loading page will navigate to Home page after loading
    Navigator.push(context, _createRoute(lp));
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.elasticIn;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
