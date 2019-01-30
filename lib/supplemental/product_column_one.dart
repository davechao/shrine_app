import 'package:flutter/material.dart';
import 'package:shrine_app/model/product.dart';
import 'package:shrine_app/supplemental/product_card.dart';

class OneProductCardColumn extends StatelessWidget {
  OneProductCardColumn({this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ProductCard(
          product: product,
        ),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}
