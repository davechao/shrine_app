import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shrine_app/model/product.dart';
import 'package:shrine_app/model/products_repository.dart';

class HomePage extends StatelessWidget {
  Widget _buildMenuIcon() {
    return IconButton(
      icon: Icon(
        Icons.menu,
        semanticLabel: 'menu',
      ),
      onPressed: () {
        print('Menu button');
      },
    );
  }

  Widget _buildSearchIcon() {
    return IconButton(
      icon: Icon(
        Icons.search,
        semanticLabel: 'search',
      ),
      onPressed: () {
        print('Search button');
      },
    );
  }

  Widget _buildFilterIcon() {
    return IconButton(
      icon: Icon(
        Icons.tune,
        semanticLabel: 'filter',
      ),
      onPressed: () {
        print('Filter button');
      },
    );
  }

  Widget _buildGridView(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 4.0,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: 8.0 / 9.0,
      children: _buildCards(context), // Replace
    );
  }

  Widget _buildCardImage(Product product) {
    return AspectRatio(
      aspectRatio: 18.0 / 11.0,
      child: Image.asset(
        'assets/products/${product.id}-0.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _buildCardInfo(BuildContext context, Product product) {
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              product.name,
              style: theme.textTheme.title,
              maxLines: 1,
            ),
            SizedBox(height: 8.0),
            Text(
              formatter.format(product.price),
              style: theme.textTheme.body2,
            ),
          ],
        ),
      ),
    );
  }

  List<Card> _buildCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);
    if (products == null || products.isEmpty) return const <Card>[];
    return products.map(
      (product) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildCardImage(product),
                _buildCardInfo(context, product),
              ],
            ),
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHRINE'),
        leading: _buildMenuIcon(),
        actions: <Widget>[
          _buildSearchIcon(),
          _buildFilterIcon(),
        ],
      ),
      body: _buildGridView(context),
    );
  }
}
