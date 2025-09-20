import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/models/Book.dart';
import 'package:flutteranimationdemo/Widget/ItemDetailSliverAppBar.dart';
import 'package:flutteranimationdemo/Widget/ItemDetailSliverDetails.dart';

class ItemDetailPage extends StatefulWidget {
  final Book book;
  final int itemIndex;

  const ItemDetailPage({
    Key? key,
    required this.book,
    required this.itemIndex,
  }) : super(key: key);

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isFavorite ? 'Added to favorites!' : 'Removed from favorites!'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: _isFavorite ? Colors.green : Colors.grey[600],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f9ff),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFf8f9ff),
              Colors.white,
            ],
            stops: [0.0, 0.3],
          ),
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            ItemDetailSliverAppBar(
              book: widget.book,
              itemIndex: widget.itemIndex,
              isFavorite: _isFavorite,
              onFavorite: _toggleFavorite,
            ),
            ItemDetailSliverDetails(book: widget.book),
          ],
        ),
      ),
    );
  }
}
