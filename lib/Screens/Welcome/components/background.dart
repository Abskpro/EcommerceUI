import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:one_day/Screens/Welcome/components/grid_items.dart';

import 'package:one_day/Screens/Welcome/components/product.dart';
// import 'package:one_day/Screens/Welcome/components/product_list.dart';
import 'package:one_day/Screens/details/details_screen.dart';
import 'package:one_day/Screens/Welcome/components/catergories_scroll.dart';
import 'package:one_day/cubit/categories_cubit.dart';
import 'package:one_day/model/product.dart';
import '../../../categories_observer.dart';

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
  List<Product> bags = [];
  List<Product> jwellerys = [];
  List<Product> shoe = [];
  List<Product> shirt = [];
  var bloc = CategoriesCubit().state;

  @override
  void initState() {
    super.initState();
    displayData();
    print(CategoriesCubit().state);
  }

  void loadJson(String product) async {
    var itemList = await rootBundle.loadString("assets/json/$product.json");
    List items = await jsonDecode(itemList);
    setState(() {
      if (product == "jwellery") {
        jwellerys = items.map((data) => Product.fromJson(data)).toList();
      }
      if (product == "shoe") {
        shoe = items.map((data) => Product.fromJson(data)).toList();
      }
      if (product == "shirt") {
        shirt = items.map((data) => Product.fromJson(data)).toList();
      }
    });
  }

  //parse the data to json and convert to list
  void displayData() async {
    var bag = await rootBundle.loadString("assets/json/bagList.json");
    // var jwellery = await rootBundle.loadString("assets/json/jwellery.json");
    List jsonData1 = jsonDecode(bag);
    // List jsonData2 = jsonDecode(jwellery);

    setState(() {
      bags = jsonData1.map((data) => Product.fromJson(data)).toList();
      // jwellerys = jsonData2.map((data) => Product.fromJson(data)).toList();
    });

    // List arrCollection = await _loadFromAsset();
    // arrCollection.map((item) => {
    //       setState(() {
    //         List jsonData = jsonDecode(item);
    //         products
    //             .add(jsonData.map((data) => Product.fromJson(data)).toList());
    //         // products.add(jsonDecode(item)
    //         //     .map((data) => Product.fromJson(data))
    //         //     .toList());
    //       })
    //     });
    // List jsonData = jsonDecode(await _loadFromAsset());
    // setState(() {
    //   products = jsonData.map((data) => Product.fromJson(data)).toList();
    // });
  }

  //get data from json file
  // Future<List> _loadFromAsset() async {
  //   var bag = await rootBundle.loadString("assets/json/bagList.json");
  //   var jwellery = await rootBundle.loadString("assets/json/jwellery.json");
  //   return [bag, jwellery];

  //   // if (bloc == 0) {
  //   //   return await rootBundle.loadString("assets/json/bagList.json");
  //   // }
  //   // if (bloc == 1) {
  //   //   return await rootBundle.loadString("assets/json/jwellery.json");
  //   // }
  // }

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
          bags.length > 0
              ? BlocConsumer<CategoriesCubit, int>(builder: (context, state) {
                  if (state == 0) {
                    return GridItems(products: bags);
                  }
                  if (state == 1) {
                    return GridItems(
                      products: jwellerys,
                    );
                  }
                  if (state == 2) {
                    return GridItems(
                      products: shoe,
                    );
                  }
                  if (state == 3) {
                    return GridItems(
                      products: shirt,
                    );
                  }
                }, listener: (context, state) {
                  loadJson("jwellery");
                  print("state has changed");
                  if (state == 0) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Bags"),
                      duration: Duration(seconds: 1),
                    ));
                  } else if (state == 1) {
                    if (jwellerys.length == 0) {
                      loadJson("jwellery");
                    }
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Jwellery"),
                      duration: Duration(seconds: 1),
                    ));
                  } else if (state == 2) {
                    if (shoe.length == 0) {
                      loadJson("shoe");
                    }
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Shoe"),
                      duration: Duration(seconds: 1),
                    ));
                  } else {
                    if (shoe.length == 0) {
                      loadJson("shirt");
                    }
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("shirt"),
                      duration: Duration(seconds: 1),
                    ));
                  }
                })
              : Container()
          // bags.length > 0 && jwellerys.length > 0
          //     ? BlocBuilder<CategoriesCubit, int>(
          //         builder: (context, state) {
          //           if (state == 0) {
          //             return GridItems(products: bags);
          //           }
          //           if (state == 1) {
          //             return GridItems(products: jwellerys);
          //           }
          //         },
          //       )
          //     : Container(
          //         width: 0.0,
          //         height: 0.0,
          //       )
          // ? Expanded(
          //     child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //         child: GridView.builder(
          //           itemCount: products.length,
          //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2,
          //             mainAxisSpacing: 20,
          //             crossAxisSpacing: 20,
          //             childAspectRatio: 0.75,
          //           ),
          //           itemBuilder: (context, index) => ProductCard(
          //               product: products[index],
          //               press: () => Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => DetailScreen(
          //                             product: products[index],
          //                           )))),
          //         )),
          //   )
        ],
      ),
    );
  }
}
