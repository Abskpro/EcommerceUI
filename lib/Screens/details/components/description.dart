import 'package:flutter/material.dart';
// import 'package:one_day/Screens/Welcome/components/product_list.dart';
import 'package:one_day/model/product.dart';

class Description extends StatelessWidget {
  final Product product;
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          product.description,
          style: TextStyle(height: 1.5),
        ));
  }
}
