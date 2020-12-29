import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_day/Screens/Welcome/components/body.dart';
import 'package:one_day/bloc/categories_bloc.dart';
import 'package:one_day/cubit/categories_cubit.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: Body());
    // return BlocProvider(
    //   create: (_) => CategoriesCubit(),
    //   child: Body(),
    // );
    return Scaffold(
      body: BlocProvider(
        create: (_) => CategoriesCubit(),
        child: Body(),
      ),
    );
    // return Scaffold(body: Body());
  }
}
