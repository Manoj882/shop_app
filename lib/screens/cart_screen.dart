import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart_item_model.dart' show Cart;
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/widgets/cart_item.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      '\$ ${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context)
                            .primaryTextTheme
                            .titleLarge!
                            .color,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: cart.totalAmount <= 0 || _isLoading
                        ? null
                        : () async {
                            setState(() {
                              _isLoading = true;
                            });
                            await Provider.of<OrderProvider>(context,
                                    listen: false)
                                .addOrder(
                              cart.cartItems.values.toList(),
                              cart.totalAmount,
                            );
                            setState(() {
                              _isLoading = false;
                            });
                            cart.clear();
                          },
                    child: _isLoading
                        ? const CircularProgressIndicator.adaptive()
                        : Text(
                            'Order Now',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (ctx, i) {
                return CartItem(
                  id: cart.cartItems.values.toList()[i].id,
                  productId: cart.cartItems.keys.toList()[i],
                  title: cart.cartItems.values.toList()[i].title,
                  quantity: cart.cartItems.values.toList()[i].quantity,
                  price: cart.cartItems.values.toList()[i].price,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
