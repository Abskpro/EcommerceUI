import 'package:flutter/material.dart';
import 'package:one_day/Screens/details/components/cart_counter.dart';
import 'cart_counter.dart';

class CounterFavButton extends StatelessWidget {
  const CounterFavButton({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(),
        Container(
          padding: EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Color(0xFFFFF6464),
            shape: BoxShape.circle,
          ),
          child: Image.asset('assets/icons/like.png'),
        )
      ],
    );
  }
}
