import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {
      //   required this.id,
      // required this.title,
      // required this.imageUrl,
      super.key});

  // final String id;
  // final String title;
  // final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
                icon: Icon(
                  product.isFavorite 
                  ? Icons.favorite_outlined
                  : Icons.favorite_border_outlined
                  ,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
