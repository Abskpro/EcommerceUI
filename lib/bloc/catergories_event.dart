part of 'categories_bloc.dart';

abstract class CategoriesEvent {}

class IncrementEvent extends CategoriesEvent {
  // final int counterValue;
  // IncrementEvent({this.counterValue});
  @override
  List<Object> get props => [];
}

class DecrementEvent extends CategoriesEvent {
  @override
  // final int counterValue;
  // DecrementEvent({this.counterValue});
  List<Object> get props => [];
}
