import 'package:flutter/material.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop_outlined),
            title: Text('Shop'),
            onTap: (){
              Navigator.of(context).pushNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment_outlined),
            title: Text('Orders'),
            onTap: (){
              Navigator.of(context).pushNamed(OrdersScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit_outlined),
            title: Text('Manage Products'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
