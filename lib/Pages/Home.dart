import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Widget/BookTabViewWidget.dart';
import 'package:flutteranimationdemo/Widget/DiscountedBookTabView.dart';
import 'package:flutteranimationdemo/Widget/FavoriteBookTabView.dart';
import 'package:flutteranimationdemo/utils/ButtonBuilder.dart';
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

  bool isShowingProfile = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: _buildTabBar(),
          ),
          body: _buildTabViews(),
        ),
      ),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
      tabs: [
        Tab(icon: Icon(Icons.home), child: const Text("Home")),
        Tab(icon: Icon(Icons.star), child: const Text("Favorites")),
        Tab(icon: Icon(Icons.person), child: const Text("Profile")),
      ],
    );
  }

  _buildTabViews() {
    return TabBarView(
      children: [
        BookTabViewWidget(books: books),
        BestSellingBookTabView(books: books),
        DiscountedBookTabView(books: books),
      ],
    );
  }
}
