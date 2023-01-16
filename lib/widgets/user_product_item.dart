import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_provider.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  const UserProductItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    super.key,
  });

  final String id;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          imageUrl,
        ),
      ),
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              icon: Icon(
                Icons.edit_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () async {
                try {
                  await Provider.of<ProductProvider>(context, listen: false)
                      .deleteProduct(id);
                } catch (error) {
                  scaffoldMessenger.showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Deleting Failed',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.delete_outlined,
                color: Theme.of(context).errorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
