import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      super.key});

  final String id;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: Icon(Icons.favorite_outlined),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        trailing: Icon(
          Icons.shopping_cart_outlined,
        ),
      ),
    );
  }
}
