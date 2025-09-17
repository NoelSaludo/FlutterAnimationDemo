import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Text item;
  final String imageUrl;

  const ItemCard({Key? key, required this.item, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Container(
        alignment: Alignment.center,
        height: 200,
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
            _buildBottomTextContainer(item),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomTextContainer(Text item) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        child: item,
      ),
    );
  }
}