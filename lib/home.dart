import 'package:flutter/material.dart';
import 'package:shrine_app/model/product.dart';
import 'package:shrine_app/model/products_repository.dart';
import 'package:shrine_app/supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  Widget _buildMenuIcon() {
    return IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        print('Menu button');
      },
    );
  }

  Widget _buildSearchIcon() {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        print('Search button');
      },
    );
  }

  Widget _buildFilterIcon() {
    return IconButton(
      icon: Icon(Icons.tune),
      onPressed: () {
        print('Filter button');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('SHRINE'),
        leading: _buildMenuIcon(),
        actions: <Widget>[
          _buildSearchIcon(),
          _buildFilterIcon(),
        ],
      ),
      body: AsymmetricView(
        products: ProductsRepository.loadProducts(Category.all),
      ),
    );
  }
}
