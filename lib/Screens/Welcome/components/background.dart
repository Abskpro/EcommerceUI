import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_day/Screens/Welcome/components/product.dart';
// import 'package:one_day/Screens/Welcome/components/product_list.dart';
import 'package:one_day/Screens/details/details_screen.dart';
import 'package:one_day/Screens/Welcome/components/catergories_scroll.dart';
import 'package:one_day/model/product.dart';

class Background extends StatefulWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    displayData();
  }

  //parse the data to json and convert to list
  void displayData() async {
    List jsonData = jsonDecode(await _loadFromAsset());
    setState(() {
      products = jsonData.map((data) => Product.fromJson(data)).toList();
    });
  }

  //get data from json file
  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/json/bagList.json");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  child: Image.asset(
                    "assets/icons/Menu-512.png",
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Shoop",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
              Expanded(
                child: Container(
                  height: 40,
                  child: Image.asset(
                    "assets/icons/search.png",
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  child: Image.asset(
                    "assets/icons/cart.png",
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text("Women",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          CategoriesScroll(),
          products.length > 0
              ? Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GridView.builder(
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) => ProductCard(
                            product: products[index],
                            press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          product: products[index],
                                        )))),
                      )),
                )
              : Container()
        ],
      ),
    );
  }
}
