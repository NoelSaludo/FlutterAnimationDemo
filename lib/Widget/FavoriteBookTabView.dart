import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Widget/BookTabViewWidget.dart';
import 'package:flutteranimationdemo/models/Book.dart';

class BestSellingBookTabView extends BookTabViewWidget {
  const BestSellingBookTabView({super.key, required this.books})
    : super(books: books);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return BookTabViewWidget(books: books);
  }


  @override
  List<Widget> buildBookCards(BuildContext context) {
    // TODO: implement buildBookCards
    return super.buildBookCards(context);
  }
}
