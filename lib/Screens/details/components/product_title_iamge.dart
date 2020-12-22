import 'package:flutter/material.dart';
// import 'package:one_day/Screens/Welcome/components/product_list.dart';
import 'package:one_day/model/product.dart';

class ProductTitleImage extends StatelessWidget {
  final Product product;
  const ProductTitleImage({
    Key key,
    @required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(product.title,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "Price\n",
                ),
                TextSpan(
                  text: "\$${product.price}",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ])),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Hero(
                tag: "${product.id}",
                child: Image.asset(
                  product.image,
                  fit: BoxFit.fill,
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
