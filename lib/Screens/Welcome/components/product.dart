import 'package:flutter/material.dart';
import 'package:one_day/Screens/Welcome/components/product_list.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ProductCard({
    Key key,
    this.press,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: product.color,
                    borderRadius: BorderRadius.circular(16)),
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
      ),
    );
  }
}
