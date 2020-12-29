import 'dart:async';
import 'package:bloc/bloc.dart';

part 'categories_state.dart';
part 'catergories_event.dart';

// import 'package:equatable/equatable';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc(CategoriesState initialState) : super(initialState);

  // @override
  // CategoriesState get initialState => CategoriesState(counter: 0);

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    if (event is IncrementEvent) {
      print(event);
      // yield CategoriesState(counter: state.counter + state - state.counter);
    } else if (event is DecrementEvent) {
      // yield CategoriesState();
      print(event);
    }
  }
}
