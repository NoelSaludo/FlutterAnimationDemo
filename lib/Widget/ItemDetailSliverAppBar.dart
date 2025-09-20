import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/models/Book.dart';

class ItemDetailSliverAppBar extends StatelessWidget {
  final Book book;
  final int itemIndex;
  final VoidCallback? onBack;
  final VoidCallback? onFavorite;

  const ItemDetailSliverAppBar({
    Key? key,
    required this.book,
    required this.itemIndex,
    this.onBack,
    this.onFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: _buildHeroBackground(),
      ),
      leading: _buildLeading(context),
      actions: [_buildFavoriteAction(context)],
    );
  }

  Widget _buildHeroBackground() {
    return Hero(
      tag: 'item_image_$itemIndex',
      child: _buildBackgroundContainer(),
    );
  }

  Widget _buildBackgroundContainer() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(book.coverImageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: onBack ?? () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildFavoriteAction(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: const Icon(Icons.favorite_border, color: Colors.white),
        onPressed: onFavorite ?? () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Added to favorites!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}
