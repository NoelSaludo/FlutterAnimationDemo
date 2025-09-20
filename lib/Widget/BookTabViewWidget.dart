import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Widget/ItemCard.dart';
import 'package:flutteranimationdemo/models/Book.dart';
import 'package:flutteranimationdemo/utils/PageNavigator.dart';

class BookTabViewWidget extends StatelessWidget {
  final List<Book> books;
  final EdgeInsetsGeometry padding;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;

  const BookTabViewWidget({
    Key? key,
    required this.books,
    this.padding = const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 8.0,
    this.mainAxisSpacing = 8.0,
    this.childAspectRatio = 0.55,
  }) : super(key: key);

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

  List<Widget> buildBookCards(BuildContext context) {
    return List.generate(
      books.length,
      (i) => buildBookCard(context, i, books[i]),
    );
  }

  Widget buildBookCard(BuildContext context, int i, Book book) {
    return Hero(
      tag: 'item_image_$i',
      child: ItemCard(
        item: book.getItemText(),
        author: book.getAuthorText(),
        description: book.getDescriptionText(),
        imageUrl: book.coverImageUrl,
        onTap: () => PageNavigator().goToItemDetail(context, i, book),
      ),
    );
  }
}

