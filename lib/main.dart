import 'package:flutter/material.dart';
import 'package:one_day/Screens/Welcome/welcome_screen.dart';
import 'package:bloc/bloc.dart';

import 'categories_observer.dart';

void main() {
  // Bloc.observer = CategoriesObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shop',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}
