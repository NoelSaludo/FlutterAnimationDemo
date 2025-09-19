import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Widget/ItemCard.dart';
import 'package:flutteranimationdemo/utils/ButtonBuilder.dart';
import 'package:flutteranimationdemo/models/Book.dart';
import 'package:flutteranimationdemo/utils/PageNavigator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ButtonBuilder buttonBuilder = ButtonBuilder();
  List<Book> books = Book.getSampleBooks();

  bool isShowingProfile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.55,
          physics: const BouncingScrollPhysics(),
          children: _buildBookCards(context),
        ),
      ),
    );
  }

  List<Widget> _buildBookCards(BuildContext context) {
    return List.generate(books.length, (i) => _buildBookCard(context, i, books[i]));
  }

  Widget _buildBookCard(BuildContext context, int i, Book book) {
    return Hero(
      tag: 'item_image_$i',
      child: ItemCard(
        item: book.item(),
        author: book.authorWidget(),
        description: book.descriptionWidget(),
        imageUrl: book.coverImageUrl,
        onTap: () => PageNavigator().goToItemDetail(context, i, book),
      ),
    );
  }
}
