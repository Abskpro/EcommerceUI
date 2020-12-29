part of 'categories_bloc.dart';

abstract class CategoriesState {}

// class CategoriesState {
//   final int counter;
//   const CategoriesState({this.counter});
//   List<Object> get props => [counter];
// }

class CategoriesUninitialized extends CategoriesState {
  final int counter = 0;

  // const CategoriesUninitialized({this.counter});
}

class CategoriesChanged extends CategoriesState {
  final int counter;
  CategoriesChanged({this.counter});
}
