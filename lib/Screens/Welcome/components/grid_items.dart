import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:one_day/model/product.dart';
import './product.dart';
import '../../details/details_screen.dart';

class GridItems extends StatelessWidget {
  final List products;
  // final products;

  GridItems({this.products});

  @override
  Widget build(BuildContext context) {
    return (Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => ProductCard(
                product: products[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              product: products[index],
                            )))),
          )),
    ));
  }
}
