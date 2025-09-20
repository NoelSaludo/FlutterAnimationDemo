import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Widget/BookTabViewWidget.dart';
import 'package:flutteranimationdemo/models/Book.dart';

class TopPickedBookTabView extends BookTabViewWidget {
  const TopPickedBookTabView({super.key, required this.books})
      : super(books: books);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GridView.count(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
        physics: const BouncingScrollPhysics(),
        children: buildBookCards(context),
      ),
    );
  }

  @override
  List<Widget> buildBookCards(BuildContext context) {
    return books.where((book) => book.rating >= 4).map((book) {
      int itemIndex = books.indexOf(book);
      return buildBookCard(context, itemIndex, book);
    }).toList();
  }
}
