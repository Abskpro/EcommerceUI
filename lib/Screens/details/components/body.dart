import 'package:flutter/material.dart';
import 'package:one_day/Screens/Welcome/components/product_list.dart';
import 'package:one_day/Screens/details/components/add_to_cart.dart';
import 'package:one_day/Screens/details/components/product_title_iamge.dart';
import 'package:one_day/Screens/details/components/colors_size.dart';
import 'package:one_day/Screens/details/components/description.dart';
import 'package:one_day/Screens/details/components/counter_fav_btn.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                        top: size.height * 0.12, left: 20.0, right: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        ColorsAndSize(product: product),
                        SizedBox(height: 20 / 2),
                        Description(product: product),
                        CounterFavButton(),
                        SizedBox(
                          height: 20 / 2,
                        ),
                        AddToCart(product: product)
                      ],
                    ),
                  ),
                  ProductTitleImage(product: product)
                ],
              ))
        ],
      ),
    );
  }
}
