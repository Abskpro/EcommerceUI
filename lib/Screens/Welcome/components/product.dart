import 'package:flutter/material.dart';
import 'package:one_day/Screens/Welcome/components/product_list.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
              padding: EdgeInsets.all(20.0),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20 / 4),
          child: Text(
            product.title,
          ),
        ),
        Text("\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold))
      ],
    );
  }
}
