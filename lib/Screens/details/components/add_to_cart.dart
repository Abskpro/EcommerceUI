import 'package:flutter/material.dart';
// import 'package:one_day/Screens/Welcome/components/product_list.dart';
import 'package:one_day/model/product.dart';

class AddToCart extends StatelessWidget {
  final Product product;
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Expanded(
                child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                color: Color(int.parse(product.color)),
                onPressed: () {},
                child: Text(
                  "Buy Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ))
          ],
        ));
  }
}
