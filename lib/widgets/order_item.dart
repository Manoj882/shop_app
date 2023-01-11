import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/order_item_model.dart' as ord;

class OrderItem extends StatelessWidget {
  const OrderItem({required this.order, super.key});

  final ord.OrderItem order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$ ${order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.expand_more_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
