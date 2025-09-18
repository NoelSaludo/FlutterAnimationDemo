import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Widget/ItemCard.dart';
import 'package:flutteranimationdemo/utils/ButtonBuilder.dart';
import 'package:flutteranimationdemo/Pages/ItemDetailPage.dart';
import 'package:flutteranimationdemo/models/Book.dart';
import 'package:flutteranimationdemo/utils/string_extensions.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0), // 👈 screen-side padding
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.55,
        physics: const BouncingScrollPhysics(),
        children: _fillView(context),
      ),
),

    );
  }

  _fillView(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < books.length; i++) {
      var book = books[i];
      var item = Text(
        book.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 19),
      );
      var author = Text(
        book.author,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
      );
      var description = Text(
        book.description.length > 80
        ? '${book.description.substring(0, 80)}...'
        : book.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
      );
      items.add(
        Hero(
          tag: 'item_image_$i',
          child: ItemCard(
            item: item,
            author: author,
            description: description,
            imageUrl: book.coverImageUrl,
            onTap: () => _navigateToItemDetail(context, i, book),
          ),
        ),
      );
    }
    return items;
  }

  void _navigateToItemDetail(BuildContext context, int itemIndex, Book book) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ItemDetailPage(book: book, itemIndex: itemIndex),
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }
}
