import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/models/Book.dart';
import 'package:flutteranimationdemo/Pages/ItemDetailPage.dart';

class PageNavigator {
  void goTo(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(CreateRoute(page));
  }

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void goToItemDetail(BuildContext context, int itemIndex, Book book) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ItemDetailPage(book: book, itemIndex: itemIndex),
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  Route CreateRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.easeInSine;

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

