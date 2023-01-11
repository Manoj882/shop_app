import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity,
      super.key});

  final String id;
  final String title;
  final int quantity;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text('\$ $price'),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${price * quantity}'),
          trailing: Text('$quantity X'),
        ),
      ),
    );
  }
}
