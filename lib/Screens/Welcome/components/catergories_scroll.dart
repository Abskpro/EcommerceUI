import 'package:flutter/material.dart';

class CategoriesScroll extends StatefulWidget {
  @override
  _CategoriesScrollState createState() => _CategoriesScrollState();
}

class _CategoriesScrollState extends State<CategoriesScroll> {
  List<String> categories = ['Hand Bag', "Jwellery", "Footwear", "Dresses"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
          height: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => buildCategory(index),
          )),
    );
  }

  Widget buildCategory(int index) {
    child:
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
