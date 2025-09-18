import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Text item;
  final Text author;
  final Text description;
  final String imageUrl;
  final VoidCallback? onTap;

  const ItemCard({Key? key, required this.item, required this.author,required this.description, required this.imageUrl, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          alignment: Alignment.center,
          height: 400,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              _buildBottomTextContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomTextContainer() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 140,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Let the height adjust based on content
          children: [
            item,
            const SizedBox(height: 4),
            author,
            const SizedBox(height: 4),
            description,
          ],
        ),
      ),
    );
  }
}