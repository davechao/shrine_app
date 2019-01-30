import 'package:flutter/material.dart';

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

  Widget _buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: 8.0 / 9.0,
      children: _buildCards(10), // Replace
    );
  }

  List<Card> _buildCards(int count) {
    List<Card> cards = List.generate(
      count,
      (int index) => Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.asset('assets/diamond.png'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Title'),
                      SizedBox(height: 8.0),
                      Text('Secondary Text'),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
    return cards;
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
      body: _buildGridView(),
    );
  }
}
