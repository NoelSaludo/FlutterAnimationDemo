import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/models/Book.dart';
import 'package:flutteranimationdemo/Widget/ItemDetailSliverAppBar.dart';
import 'package:flutteranimationdemo/Widget/ItemDetailSliverDetails.dart';

class ItemDetailPage extends StatelessWidget {
  final Book book;
  final int itemIndex;

  const ItemDetailPage({
    Key? key,
    required this.book,
    required this.itemIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          ItemDetailSliverAppBar(
            book: book,
            itemIndex: itemIndex,
          ),
          ItemDetailSliverDetails(book: book),
        ],
      ),
    );
  }
}
