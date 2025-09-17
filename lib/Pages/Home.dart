import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Widget/ItemCard.dart';
import 'package:flutteranimationdemo/utils/ButtonBuilder.dart';
import 'package:flutteranimationdemo/Pages/ItemDetailPage.dart';
import 'package:flutteranimationdemo/models/Book.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ButtonBuilder buttonBuilder = ButtonBuilder();
  List<Book> books = Book.getSampleBooks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: GridView.count(crossAxisCount: 2, children: _fillView(context)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.person),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }

  _fillView(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < books.length; i++) {
      var book = books[i];
      var item = Text(book.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
      items.add(
        Hero(
          tag: 'item_image_$i',
          child: ItemCard(
            item: item,
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
        pageBuilder: (context, animation, secondaryAnimation) => ItemDetailPage(
          book: book,
          itemIndex: itemIndex,
        ),
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

}
