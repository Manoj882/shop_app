import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_provider.dart';
import '../widgets/products_grid.dart';
import '../models/product.dart';

enum FilterOptions{
  Favorites,
  All,

}
class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {

  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (selectedValue){
              setState(() {
                if(selectedValue == FilterOptions.Favorites){
                _showOnlyFavorites = true;
              } else {
                _showOnlyFavorites = false;
                
              }
              });
            },
            icon: Icon(Icons.more_vert_outlined,),
            itemBuilder: (_)=> [
              PopupMenuItem(child: Text('Only Favorites'), value: FilterOptions.Favorites,),
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All,),
            ],
          ),
        ],
      ),
      body: ProductsGrid(showFavs: _showOnlyFavorites,),
    );
  }
}
