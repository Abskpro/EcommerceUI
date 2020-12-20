import 'package:flutter/material.dart';
import 'package:one_day/Screens/Welcome/components/product_list.dart';

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
            // Container(
            //   margin: EdgeInsets.only(right: 20),
            //   height: 50,
            //   width: 58,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(18),
            //     border: Border.all(color: product.color),
            //   ),
            // ),
            Expanded(
                child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                color: product.color,
                onPressed: () {},
                child: Text(
                  "Buy Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ))
          ],
        ));
  }
}
