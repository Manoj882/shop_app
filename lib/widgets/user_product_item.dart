import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  const UserProductItem(
      {required this.title, required this.imageUrl, super.key});

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              icon: Icon(
                Icons.edit_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
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
