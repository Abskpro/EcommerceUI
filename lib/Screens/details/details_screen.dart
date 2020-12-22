import 'package:flutter/material.dart';
import 'package:one_day/Screens/details/components/body.dart';
import 'package:one_day/model/product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(
          product: product,
        ),
        backgroundColor: Color(int.parse(product.color)),
        appBar: buildAppBar(context));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(int.parse(product.color)),
      elevation: 0,
      leading: IconButton(
          icon: Image.asset('assets/icons/back.png'),
          onPressed: () => Navigator.pop(context)),
      actions: [
        Image.asset("assets/icons/cart.png"),
      ],
    );
  }
}
